package com.bakery.application.mapper;

import com.bakery.application.entity.Stock;
import com.bakery.application.entity.StockCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StockMapper {
    int countByExample(StockCriteria example);

    int deleteByExample(StockCriteria example);

    int deleteByPrimaryKey(String stockId);

    int insert(Stock record);

    int insertSelective(Stock record);

    List<Stock> selectByExample(StockCriteria example);

    Stock selectByPrimaryKey(String stockId);

    int updateByExampleSelective(@Param("record") Stock record, @Param("example") StockCriteria example);

    int updateByExample(@Param("record") Stock record, @Param("example") StockCriteria example);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);
}