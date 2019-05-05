package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.CodeTypeConstant;
import com.bakery.application.constant.Page;
import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.ProductDTO;
import com.bakery.application.entity.*;
import com.bakery.application.mapper.BaseCodeMapper;
import com.bakery.application.mapper.CodeTypeMapper;
import com.bakery.application.mapper.ProductMapper;
import com.bakery.application.service.ProductService;
import com.bakery.application.util.CopyUtil;
import com.bakery.application.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/02  00:02
 */
@Service
@Transactional(readOnly = false)
public class ProductServiceImpl implements ProductService {
    @Autowired
	ProductMapper productMapper;
    
    @Autowired
    BaseCodeMapper baseCodeMapper;
    
    @Autowired
    CodeTypeMapper codeTypeMapper;

	@Override
	public List<BaseCodeDTO> selectLeftTrees() {
		List<BaseCodeDTO> baselistdto=new ArrayList<BaseCodeDTO>();
		 CodeTypeCriteria criteria2 = new CodeTypeCriteria();
		 CodeTypeCriteria.Criteria cri2 = criteria2.createCriteria();
		 cri2.andStatusEqualTo(1);// 只查询状态为1的
		 cri2.andCodeTypeEqualTo(CodeTypeConstant.PDT_TYPE);
		 List<CodeType> codeTypeList=codeTypeMapper.selectByExample(criteria2);
		 BaseCodeCriteria criteria3 = new BaseCodeCriteria();
		 BaseCodeCriteria.Criteria cri3 = criteria3.createCriteria();
		 cri3.andStatusEqualTo(1);// 只查询状态为1的
		 cri3.andCodeTypeEqualTo(CodeTypeConstant.PDT_TYPE);
		 List<BaseCode> pdtTypeList =baseCodeMapper.selectByExample(criteria3);
		 for (CodeType source : codeTypeList) {
			    BaseCodeDTO dest = new BaseCodeDTO();
			    BaseCodeDTO object =new BaseCodeDTO();
				try {
					CopyUtil.Copy(source, dest);
				} catch (Exception e) {
					e.printStackTrace();
				}
				int sum=0;
				dest.setText(source.getCodeName());
				dest.setPartentCode("");
				dest.setChilderCode(source.getCodeType());
				dest.setLevel(0);
				baselistdto.add(dest);
				List<BaseCodeDTO> childerlist=new ArrayList<BaseCodeDTO>();
				dest.setNodes(childerlist);
				for (BaseCode source1 : pdtTypeList) {
					BaseCodeDTO dest1 = new BaseCodeDTO();
					try {
						CopyUtil.Copy(source1, dest1);
					} catch (Exception e) {
						e.printStackTrace();
					}
					object.setPdtType(source1.getDataCode());
					object.setCodeType(source1.getCodeType());
					int count=productMapper.countByBaseCode(object);
					sum +=count;
					dest1.setTags(new String[]{"("+count+")"});
					dest1.setText(source1.getCodeName());
					dest1.setLevel(1);
					dest1.setChilderCode(source1.getDataCode());
					dest1.setPartentCode(source.getCodeType());
					childerlist.add(dest1);
				}
				dest.setTags(new String[]{"("+sum+")"});
			}
		return  baselistdto;
	}

	@Override
	public List<ProductDTO> selectByCriteriaPage(Page page, Product product) {
		PageHelper.startPage(page.getPageNo(),page.getPageSize());
		return productMapper.queryPdtByPage(product);
	}

	@Override
	public Map<String, Object> insertSelective(Product product) {
		Map<String,Object> map=new HashMap<String, Object>();
		ProductCriteria productCriteria=new ProductCriteria();
		ProductCriteria.Criteria cri=productCriteria.createCriteria();
		cri.andPdtNameEqualTo(product.getPdtName().trim());
		List<Product> products = productMapper.selectByExample(productCriteria);
		if(products.isEmpty()){
			product.setPdtId(UUIDUtil.create32Key());
			product.setStatus(4);//待上架
			boolean flag=productMapper.insertSelective(product)>=1?true:false;
			if(flag){
				map.put("result",true);
			}else{
				map.put("result",false);
			}
		}else{
			map.put("repeat",false);
		}
		return map;
	}

	@Override
	public Map<String, Object> updateByPrimaryKeySelective(Product product,String flag) {
		Map<String,Object> map=new HashMap<String, Object>();
		if("del".equals(flag)){
			product.setStatus(0);
			boolean del = productMapper.updateByPrimaryKeySelective(product) >= 1 ? true : false;
			if(del){
				map.put("result",true);
			}else{
				map.put("result",false);
			}
		}else {
			boolean b = productMapper.updateByPrimaryKeySelective(product) >= 1 ? true : false;
			if(b){
				map.put("result",true);
			}else{
				map.put("result",false);
			}
		}
		return map;
	}

}
