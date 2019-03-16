package com.bakery.application.mapper;

import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
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