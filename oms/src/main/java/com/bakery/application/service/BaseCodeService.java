package com.bakery.application.service;

import java.util.List;

import com.bakery.application.constant.Page;
import com.bakery.application.constant.PageInfo;
import com.bakery.application.constant.ResDataDTO;
import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.BaseCodeCriteria;

/**
 * @author liting
 * @date 2019/04/13  21:11
 */
public interface BaseCodeService {
    /**
     * @Description: 根据code_type查data_code
     * @Author: LiTing
     * @Date: 9:12 PM 2019/4/13
     * @return:
     * @throws:
     */
    public List<BaseCode> findByCodeType(String codeType);
    
    
    
    ResDataDTO<List<BaseCode>>  selectCodeByPage(BaseCodeCriteria criteria, PageInfo pageInfo);
	
	int insertBaseCode (BaseCode baseCode);
	
	int updateBaseCode (BaseCodeCriteria criteria,BaseCode baseCode);
	
	List<BaseCode> selectInfoCode(BaseCodeCriteria criteria);
}
