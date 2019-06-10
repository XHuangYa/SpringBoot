package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderCriteria;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.mapper.OrderMapper;
import com.bakery.application.service.OrderService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        OrderCriteria criteria=new OrderCriteria();
        OrderCriteria.Criteria cri=criteria.createCriteria();
        cri.andOrderIdEqualTo(orderDtl.getOrderId());
        String  vip =orderMapper.selectByExample(criteria).get(0).getIsVip();
        boolean b=false;
        if("N".equals(vip)){
             b = orderMapper.updatePricebyPrimaryKey(orderDtl) >= 1 ? true : false;
        }else{
            b=orderMapper.updatePricebyPrimaryKeyV(orderDtl)>= 1 ? true : false;
        }
        return b;
    }

    @Override
    public boolean deleteOrderAndDtl(String orderId) {
        return orderMapper.deleteOrderAndDtl(orderId)>=0?true:false;
    }

    @Override
    public Map<String,Object> insertSelective(Order order) {
        Map<String,Object> map=new HashMap<String,Object>();
        order.setStatus(1);
        order.setCreateTime(new Date());
        order.setUpdateTime(new Date());
        if(StringUtils.isNotBlank(order.getUserPhone())){
            order.setIsVip("Y");
        }else{
            order.setIsVip("N");
        }
        boolean b = orderMapper.insertSelective(order) >= 0 ? true : false;
        map.put("orderResult",b);
        return map;
    }

    @Override
    public List<Order> selectByExample(OrderCriteria example) {
        return orderMapper.selectByExample(example);
    }
}
