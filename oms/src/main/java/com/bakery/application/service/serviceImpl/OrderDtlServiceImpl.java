package com.bakery.application.service.serviceImpl;

import com.bakery.application.constant.Page;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.mapper.OrderDtlMapper;
import com.bakery.application.service.OrderDtlService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public boolean updateByPrimaryKeySelective(OrderDtl orderDtl) {
        orderDtl.setStatus(0);
        return orderDtlMapper.updateByPrimaryKeySelective(orderDtl)>=1?true:false;
    }
}
