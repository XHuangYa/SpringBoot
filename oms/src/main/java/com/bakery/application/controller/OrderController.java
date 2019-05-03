package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.BaseCode;
import com.bakery.application.entity.Order;
import com.bakery.application.entity.OrderDtl;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.OrderDtlService;
import com.bakery.application.service.OrderService;
import com.bakery.application.util.JsonUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/01  22:14
 */
@Controller
public class OrderController {

    @Autowired
    BaseCodeService baseCodeService;

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDtlService orderDtlService;

    /**
     * @Description:订单首页初始化
     * @Author: LiTing
     * @Date: 10:14 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(Url.ORDER_MANAGE_LIST)
    public String orderIndex(final Map<String, Object> map) {
        //支付方式
        List<BaseCode> payMethodList = baseCodeService.findByCodeType(CodeTypeConstant.PAY_METHOD);
        List<BaseCode> yesOrNo = baseCodeService.findByCodeType(CodeTypeConstant.YES_OR_NO);
        map.put("yesOrNo", JsonUtil.listtojson(yesOrNo));
        map.put("payMethodList", JsonUtil.listtojson(payMethodList));
        return Views.ORDER_LIST_VIEW;
    }

    /**
     * @Description:订单分页查询
     * @Author: LiTing
     * @Date: 11:15 PM 2019/5/1
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.ORDER_MANAGE_QUERY_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryOrderPage(Page page, OrderDTO orderDTO) {
        List<Order> orderList = orderService.selectByCriteriaPage(orderDTO, page);
        PageInfo pageInfo = new PageInfo<Order>(orderList);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;
    }

    /**
     * @Description:订单明细分页查询
     * @Author: LiTing
     * @Date: 12:25 PM 2019/5/2
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.ORDERDTL_MANAGE_QUERY_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryOrderDtlPage(Page page, String orderId) {
        List<OrderDtl> orderDtls = orderDtlService.selectByCriteriaPage(page, orderId);
        PageInfo pageInfo = new PageInfo<OrderDtl>(orderDtls);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;

    }

    /**
     * @Description:新增订单/订单明细-修改订单备注信息
     * @Author: LiTing
     * @Date: 9:05 PM 2019/5/2
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_OR_UPDATE_ORDER_URL, method = RequestMethod.POST)
    public @ResponseBody
    boolean queryOrderDtlPage(Order order) {
        return orderService.updateByPrimaryKeySelective(order);
    }

    /**
     * @Description:修改订单明细商品数量和价格
     * @Author: LiTing
     * @Date: 10:51 PM 2019/5/2
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.UPDATE_ORDER_PRICE_URL, method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> updateOrderDtlpdtNum(OrderDtl orderDtl) {
        Map<String, Object> map = new HashMap<String, Object>();
        final boolean num = orderDtlService.updatepdtNumByPrimaryKey(orderDtl);
        final boolean price = orderService.updatePricebyPrimaryKey(orderDtl);
        if (num && price) {
            map.put("result", true);
        } else if (!num) {
            map.put("result", false);//明细失败
        } else if (!price) {
            map.put("repeat", false);//订单失败
        }
        return map;
    }

    /**
     * @Description:删除订单明细
     * @Author: LiTing
     * @Date: 11:47 PM 2019/5/2
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.DELETE_ORDER_DTL_URL, method = RequestMethod.POST)
    public @ResponseBody
    boolean updateOrderDtlStatus(OrderDtl orderDtl) {
        return  orderDtlService.updateByPrimaryKeySelective(orderDtl);
    }
    /**
     * @Description:删除订单
     * @Author: LiTing
     * @Date: 12:27 AM 2019/5/3
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.DELETE_ORDER_URL, method = RequestMethod.POST)
    public @ResponseBody
    boolean updateOrderStatus(Order order) {
        return orderService.deleteOrderAndDtl(order);
    }
    /**
     * @Description:新增订单及订单明细
     * @Author: LiTing
     * @Date: 6:00 PM 2019/5/3
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_ORDER_INDEX_URL)
    public String insertOrderIndex(final  Map<String,Order> map){

        return Views.INSERT_ORDER_VIEW;
    }
}
