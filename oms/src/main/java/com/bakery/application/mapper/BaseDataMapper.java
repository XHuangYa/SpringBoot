package com.bakery.application.mapper;

import com.bakery.application.entity.BaseData;
import com.bakery.application.entity.BaseDataCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseDataMapper {
    int countByExample(BaseDataCriteria example);

    int deleteByExample(BaseDataCriteria example);

    int deleteByPrimaryKey(String dataCode);

    int insert(BaseData record);

    int insertSelective(BaseData record);

    List<BaseData> selectByExample(BaseDataCriteria example);

    BaseData selectByPrimaryKey(String dataCode);

    int updateByExampleSelective(@Param("record") BaseData record, @Param("example") BaseDataCriteria example);

    int updateByExample(@Param("record") BaseData record, @Param("example") BaseDataCriteria example);

    int updateByPrimaryKeySelective(BaseData record);

    int updateByPrimaryKey(BaseData record);
}