package com.bakery.application.mapper;

import com.bakery.application.entity.Store;
import com.bakery.application.entity.StoreCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StoreMapper {
    int countByExample(StoreCriteria example);

    int deleteByExample(StoreCriteria example);

    int deleteByPrimaryKey(String storeId);

    int insert(Store record);

    int insertSelective(Store record);

    List<Store> selectByExample(StoreCriteria example);

    Store selectByPrimaryKey(String storeId);

    int updateByExampleSelective(@Param("record") Store record, @Param("example") StoreCriteria example);

    int updateByExample(@Param("record") Store record, @Param("example") StoreCriteria example);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);
}