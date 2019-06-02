package com.bakery.application.service;

import java.util.List;

import com.bakery.application.constant.Page;
import com.bakery.application.constant.PageInfo;
import com.bakery.application.constant.ResDataDTO;
import com.bakery.application.entity.CodeType;
import com.bakery.application.entity.CodeTypeCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月21日 上午1:01:47
* 类说明
*/
public interface CodeTypeService {

	ResDataDTO<List<CodeType>> selectCodeTypeByPage(CodeTypeCriteria criteria,PageInfo pageInfo);
	
	int insertCodeType (CodeType baseCodeType);
	
	int updateCodeType (CodeTypeCriteria criteria,CodeType baseCodeType);
	
	List<CodeType> selectInfoCodeType(CodeTypeCriteria criteria);
}
