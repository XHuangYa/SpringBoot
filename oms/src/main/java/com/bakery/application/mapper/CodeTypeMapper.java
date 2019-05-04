package com.bakery.application.mapper;

import com.bakery.application.entity.CodeType;
import com.bakery.application.entity.CodeTypeCriteria;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface CodeTypeMapper {
    int countByExample(CodeTypeCriteria example);

    int deleteByExample(CodeTypeCriteria example);

    int deleteByPrimaryKey(String codeType);

    int insert(CodeType record);

    int insertSelective(CodeType record);

    List<CodeType> selectByExample(CodeTypeCriteria example);

    CodeType selectByPrimaryKey(String codeType);

    int updateByExampleSelective(@Param("record") CodeType record, @Param("example") CodeTypeCriteria example);

    int updateByExample(@Param("record") CodeType record, @Param("example") CodeTypeCriteria example);

    int updateByPrimaryKeySelective(CodeType record);

    int updateByPrimaryKey(CodeType record);
}