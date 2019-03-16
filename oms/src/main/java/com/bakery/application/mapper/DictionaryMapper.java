package com.bakery.application.mapper;

import com.bakery.application.entity.Dictionary;
import com.bakery.application.entity.DictionaryCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DictionaryMapper {
    int countByExample(DictionaryCriteria example);

    int deleteByExample(DictionaryCriteria example);

    int deleteByPrimaryKey(String dictId);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    List<Dictionary> selectByExample(DictionaryCriteria example);

    Dictionary selectByPrimaryKey(String dictId);

    int updateByExampleSelective(@Param("record") Dictionary record, @Param("example") DictionaryCriteria example);

    int updateByExample(@Param("record") Dictionary record, @Param("example") DictionaryCriteria example);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);
}