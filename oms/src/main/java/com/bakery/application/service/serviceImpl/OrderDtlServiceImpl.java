package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.entity.OrderDtlCriteria;
import com.bakery.application.mapper.OrderDtlMapper;
import com.bakery.application.service.OrderDtlService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/02  13:21
 */
@Service
@Transactional(readOnly = false)
public class OrderDtlServiceImpl implements OrderDtlService {
    @Autowired
    OrderDtlMapper orderDtlMapper;
    @Override
    public List<OrderDtl> selectByCriteriaPage(Page page, String orderId) {
        PageHelper.startPage(page.getPageNo(),page.getPageSize());
        return orderDtlMapper.queryByExample(orderId);
    }

    @Override
    public boolean updatepdtNumByPrimaryKey(OrderDtl orderDtl) {
        return orderDtlMapper.updatepdtNumByPrimaryKey(orderDtl)>=1?true:false;
    }

    @Override
    public boolean deleteOrderDtl(String orderDtlId) {
        return orderDtlMapper.deleteOrderDtl(orderDtlId)>=1?true:false;
    }


    @Override
    public Map<String,Object> insertBatchService(List<OrderDtl> orderDtl) {
        Map<String,Object> map=new HashMap<String,Object>();
        boolean b = orderDtlMapper.insertBatch(orderDtl) >= 1 ? true : false;
        map.put("dtlResult",b);
        return map;
    }

    @Override
    public int countByExample(OrderDtlCriteria criteria) {
        return orderDtlMapper.countByExample(criteria);
    }
}
