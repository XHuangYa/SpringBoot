package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.mapper.OrderMapper;
import com.bakery.application.service.OrderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @author liting
 * @date 2019/05/02  00:02
 */
@Service
@Transactional(readOnly = false)
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> selectByCriteriaPage(OrderDTO orderDTO, Page page) {
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        return orderMapper.queryByExample(orderDTO);
    }

    @Override
    public boolean updateByPrimaryKeySelective(Order order) {
        return orderMapper.updateByPrimaryKeySelective(order)>=1?true:false;
    }

    @Override
    public boolean updatePricebyPrimaryKey(OrderDtl orderDtl) {
        return orderMapper.updatePricebyPrimaryKey(orderDtl)>=1?true:false;
    }

    @Override
    public boolean deleteOrderAndDtl(Order order) {
        return orderMapper.deleteOrderAndDtl(order)>=0?true:false;
    }
}
