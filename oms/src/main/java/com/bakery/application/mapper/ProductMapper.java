
package com.bakery.application.mapper;

import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.ProductDTO;
import com.bakery.application.entity.Product;
import com.bakery.application.entity.ProductCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ProductMapper {
    List<ProductDTO> queryPdtByPage(Product product);

    int countByBaseCode(BaseCodeDTO baseCodeDTO);

    int countByExample(ProductCriteria example);

    int deleteByExample(ProductCriteria example);

    int deleteByPrimaryKey(String pdtId);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductCriteria example);

    Product selectByPrimaryKey(String pdtId);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductCriteria example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductCriteria example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}