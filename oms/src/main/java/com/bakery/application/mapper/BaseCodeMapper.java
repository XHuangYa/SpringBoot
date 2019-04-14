package com.bakery.application.mapper;

import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.BaseCodeCriteria;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BaseCodeMapper {
    /**
     * @Description: 根据code_type查data_code
     * @Author: LiTing
     * @Date: 9:12 PM 2019/4/13
     * @return:
     * @throws:
     */
    List<BaseCode> selectByCodeType(String codeType);

    int countByExample(BaseCodeCriteria example);

    int deleteByExample(BaseCodeCriteria example);

    int insert(BaseCode record);

    int insertSelective(BaseCode record);

    List<BaseCode> selectByExample(BaseCodeCriteria example);

    int updateByExampleSelective(@Param("record") BaseCode record, @Param("example") BaseCodeCriteria example);

    int updateByExample(@Param("record") BaseCode record, @Param("example") BaseCodeCriteria example);
}