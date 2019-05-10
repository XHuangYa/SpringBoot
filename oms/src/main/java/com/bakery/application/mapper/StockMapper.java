package com.bakery.application.mapper;

import com.bakery.application.dto.ProductDTO;
import com.bakery.application.dto.StockDTO;
import com.bakery.application.entity.Product;
import com.bakery.application.entity.Stock;
import com.bakery.application.entity.StockCriteria;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface StockMapper {

    List<ProductDTO> queryStockList(Product product);

    List<StockDTO> queryStockByPage(StockDTO stockDTO);
    int countByExample(StockCriteria example);

    int deleteByExample(StockCriteria example);

    int insert(Stock record);

    int insertSelective(Stock record);

    List<Stock> selectByExample(StockCriteria example);

    int updateByExampleSelective(@Param("record") Stock record, @Param("example") StockCriteria example);

    int updateByExample(@Param("record") Stock record, @Param("example") StockCriteria example);
}