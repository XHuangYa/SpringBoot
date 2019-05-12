package com.bakery.application.mapper;

import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderCriteria;
import com.bakery.application.entity.OrderDtl;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderMapper {

    List<Order> queryByExample(OrderDTO orderDTO);

    int updatePricebyPrimaryKey(OrderDtl orderDtl);

    int deleteOrderAndDtl(String orderId);

    int countByExample(OrderCriteria example);

    int deleteByExample(OrderCriteria example);

    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderCriteria example);

    Order selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderCriteria example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderCriteria example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}