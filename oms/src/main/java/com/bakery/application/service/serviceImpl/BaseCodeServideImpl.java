package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.constant.PageInfo;
import com.bakery.application.constant.ResDataDTO;
import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.BaseCodeCriteria;
import com.bakery.application.entity.CodeType;
import com.bakery.application.mapper.BaseCodeMapper;
import com.bakery.application.service.BaseCodeService;
import com.github.pagehelper.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author liting
 * @date 2019/04/13  21:13
 */
@Service("baseCodeService")
@Transactional(readOnly = false)
public class BaseCodeServideImpl implements BaseCodeService {
    @Autowired
    BaseCodeMapper baseCodeMapper;
    @Override
    public List<BaseCode> findByCodeType(String codeType) {
        return baseCodeMapper.selectByCodeType(codeType);
    }
    
    
	@Override
	public ResDataDTO<List<BaseCode>>  selectCodeByPage(BaseCodeCriteria criteria, PageInfo pageInfo) {
		List<BaseCode> baseCodeList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			baseCodeList=baseCodeMapper.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(baseCodeMapper.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			baseCodeList=baseCodeMapper.selectByExample(criteria);
		}
		ResDataDTO<List<BaseCode>> listRes=new ResDataDTO<List<BaseCode>>();
		listRes.setData(baseCodeList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}
	
	
	@Override
	public int insertBaseCode(BaseCode baseCode) {
		return baseCodeMapper.insertSelective(baseCode);
	}
	@Override
	public int updateBaseCode(BaseCodeCriteria criteria, BaseCode baseCode) {
		return baseCodeMapper.updateByExampleSelective(baseCode, criteria);
	}
	@Override
	public List<BaseCode> selectInfoCode(BaseCodeCriteria criteria) {
		return baseCodeMapper.selectByExample(criteria);
	}


	
}
