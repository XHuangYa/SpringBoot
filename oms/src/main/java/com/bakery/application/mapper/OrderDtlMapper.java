package com.bakery.application.mapper;

import com.bakery.application.entity.OrderDtl;
import com.bakery.application.entity.OrderDtlCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderDtlMapper {
    int countByExample(OrderDtlCriteria example);

    int deleteByExample(OrderDtlCriteria example);

    int deleteByPrimaryKey(String orderDtlId);

    int insert(OrderDtl record);

    int insertSelective(OrderDtl record);

    List<OrderDtl> selectByExample(OrderDtlCriteria example);

    OrderDtl selectByPrimaryKey(String orderDtlId);

    int updateByExampleSelective(@Param("record") OrderDtl record, @Param("example") OrderDtlCriteria example);

    int updateByExample(@Param("record") OrderDtl record, @Param("example") OrderDtlCriteria example);

    int updateByPrimaryKeySelective(OrderDtl record);

    int updateByPrimaryKey(OrderDtl record);
}