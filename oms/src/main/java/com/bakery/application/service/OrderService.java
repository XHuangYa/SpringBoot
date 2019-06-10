package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderCriteria;
import com.bakery.application.entity.OrderDtl;

import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/01  23:58
 */
public interface OrderService {
    /**
     * @Description: 分页查询订单信息
     * @Author: LiTing
     * @Date: 11:58 PM 2019/5/1
     * @return:
     * @throws:
     */
    public List<Order> selectByCriteriaPage(OrderDTO orderDTO, Page page);

    /**
     * @Description:修改订单备注信息
     * @Author: LiTing
     * @Date: 9:09 PM 2019/5/2
     * @return:
     * @throws:
     */
    public boolean updateByPrimaryKeySelective(Order order);

    /**
     * @Description:修改订单总价
     * @Author: LiTing
     * @Date: 11:12 PM 2019/5/2
     * @return:
     * @throws:
     */
    public boolean updatePricebyPrimaryKey(OrderDtl orderDtl);

    /**
     * @Description:删除订单
     * @Author: LiTing
     * @Date: 12:34 AM 2019/5/3
     * @return:
     * @throws:
     */
    public boolean deleteOrderAndDtl(String orderId);

    /**
     * @Description:新增訂單
     * @Author: LiTing
     * @Date: 12:34 AM 2019/5/3
     * @return:
     * @throws:
     */
    public Map<String,Object> insertSelective(Order order);

    /**
     * @Description:example
     * @Author: LiTing
     * @Date: 7:32 PM 2019/6/8
     * @return:
     * @throws:
     */
    List<Order> selectByExample(OrderCriteria example);
}
