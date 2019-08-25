package com.bakery.application.mapper;

import com.bakery.application.entity.VisitCount;
import com.bakery.application.entity.VisitCountCriteria;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface VisitCountMapper {
    int countByExample(VisitCountCriteria example);

    int deleteByExample(VisitCountCriteria example);

    int deleteByPrimaryKey(Integer id);

    int insert(VisitCount record);

    int insertSelective(VisitCount record);

    List<VisitCount> selectByExample(VisitCountCriteria example);

    VisitCount selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") VisitCount record, @Param("example") VisitCountCriteria example);

    int updateByExample(@Param("record") VisitCount record, @Param("example") VisitCountCriteria example);

    int updateByPrimaryKeySelective(VisitCount record);

    int updateByPrimaryKey(VisitCount record);
}