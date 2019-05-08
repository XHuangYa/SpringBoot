package com.bakery.application.service;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.OrderDtl;

import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/02  13:19
 */
public interface OrderDtlService {
    /**
     * @Description:订单明细分页查询
     * @Author: LiTing
     * @Date: 1:20 PM 2019/5/2
     * @return:
     * @throws:
     */
    public List<OrderDtl> selectByCriteriaPage(Page page,String orderId);
    /**
     * @Description:修改订单明细商品数量和价格
     * @Author: LiTing
     * @Date: 10:49 PM 2019/5/2
     * @return:
     * @throws:
     */
    public boolean updatepdtNumByPrimaryKey(OrderDtl orderDtl);
    /**
     * @Description:删除订单明细
     * @Author: LiTing
     * @Date: 11:45 PM 2019/5/2
     * @return:
     * @throws:
     */
    public boolean updateByPrimaryKeySelective(OrderDtl orderDtl);
    /**
     * @Description:批量插入
     * @Author: LiTing
     * @Date: 11:45 PM 2019/5/2
     * @return:
     * @throws:
     */
    public Map<String,Object> insertBatchService(List<OrderDtl> orderDtl);
}
