package com.bakery.application.service.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bakery.application.constant.Page;
import com.bakery.application.constant.PageInfo;
import com.bakery.application.constant.ResDataDTO;
import com.bakery.application.entity.CodeType;
import com.bakery.application.entity.CodeTypeCriteria;
import com.bakery.application.mapper.CodeTypeMapper;
import com.bakery.application.service.CodeTypeService;
import com.github.pagehelper.PageHelper;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月21日 上午1:02:18
* 类说明
*/
@Service("codeTypeService")
public class CodeTypeServiceImpl implements CodeTypeService{

	@Autowired
	private CodeTypeMapper codeTypeDao;

	@Override
	public ResDataDTO<List<CodeType>> selectCodeTypeByPage(CodeTypeCriteria criteria, PageInfo pageInfo) {
		List<CodeType> baseCodeTypeList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			baseCodeTypeList=codeTypeDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(codeTypeDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			baseCodeTypeList=codeTypeDao.selectByExample(criteria);
		}
		ResDataDTO<List<CodeType>> listRes=new ResDataDTO<List<CodeType>>();
		listRes.setData(baseCodeTypeList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertCodeType(CodeType baseCodeType) {
		baseCodeType.setStatus(1);
		return codeTypeDao.insert(baseCodeType);
	}

	@Override
	public int updateCodeType(CodeTypeCriteria criteria, CodeType baseCodeType) {
		return codeTypeDao.updateByExampleSelective(baseCodeType, criteria);
	}

	@Override
	public List<CodeType> selectInfoCodeType(CodeTypeCriteria criteria) {
		return codeTypeDao.selectByExample(criteria);
	} 
}
