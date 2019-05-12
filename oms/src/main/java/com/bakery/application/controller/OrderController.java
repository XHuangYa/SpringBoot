package com.bakery.application.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bakery.application.constant.*;
import com.bakery.application.dto.OrderDTO;
import com.bakery.application.entity.*;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.OrderDtlService;
import com.bakery.application.service.OrderService;
import com.bakery.application.service.StockService;
import com.bakery.application.util.JsonUtil;
import com.bakery.application.util.UUIDUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

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

    @Autowired
    StockService stockService;

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
     * @Description:修改订单备注信息
     * @Author: LiTing
     * @Date: 9:05 PM 2019/5/2
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.UPDATE_ORDER_URL, method = RequestMethod.POST)
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
        OrderDtlCriteria criteria = new OrderDtlCriteria();
        OrderDtlCriteria.Criteria cri = criteria.createCriteria();
        cri.andStatusEqualTo(1);
        cri.andOrderIdEqualTo(orderDtl.getOrderId());
        cri.andOrderDtlIdNotEqualTo(orderDtl.getOrderDtlId());
        int i = orderDtlService.countByExample(criteria);
        boolean b = false;
        if (0 == i) {
            b = orderService.deleteOrderAndDtl(orderDtl.getOrderId());
        } else {
            b = orderDtlService.deleteOrderDtl(orderDtl.getOrderDtlId());
            final boolean price = orderService.updatePricebyPrimaryKey(orderDtl);
        }
        return b;
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
    boolean updateOrderStatus(String orderId) {
        return orderService.deleteOrderAndDtl(orderId);
    }

    /**
     * @Description:新增订单及订单明细界面初始化
     * @Author: LiTing
     * @Date: 6:00 PM 2019/5/3
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_ORDER_INDEX_URL)
    public String insertOrderIndex(final Map<String, Object> map) {
        //支付方式
        List<BaseCode> payMethodList = baseCodeService.findByCodeType(CodeTypeConstant.PAY_METHOD);
        map.put("payMethodList", JsonUtil.listtojson(payMethodList));
        return Views.INSERT_ORDER_VIEW;
    }

    /**
     * @Description:新增订单及订单明细
     * @Author: LiTing
     * @Date: 6:00 PM 2019/5/3
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_ORDER_AND_DTL_URL, method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> createOrderAndDtl(@RequestParam(value = "data", required = false) String data, Order order) {
        Map<String, Object> map = new HashMap<String, Object>();
        JSONArray array = JSONArray.parseArray(data);
        String orderId = UUIDUtil.create32Key();
        order.setOrderId(orderId);
        Map<String, Object> orderMap = orderService.insertSelective(order);//订单
        List<OrderDtl> dtls = new ArrayList<OrderDtl>();
        List<Stock> stocks = new ArrayList<Stock>();
        for (Object o : array) {
            OrderDtl dtl = JSONObject.parseObject(o.toString(), OrderDtl.class);
            dtl.setStatus(1);
            dtl.setCreateTime(new Date());
            dtl.setOrderId(orderId);
            dtl.setOrderDtlId(UUIDUtil.create32Key());
            dtls.add(dtl);
            Stock stock = new Stock();
            stock.setStockId(dtl.getOrderDtlId());
            stock.setPdtId(dtl.getPdtId());
            stock.setOutTime(dtl.getCreateTime());
            stock.setOutNum(String.valueOf(dtl.getPdtNum()));
            stock.setFlag("OUT");
            stock.setStatus(1);
            stock.setCreateTime(dtl.getCreateTime());
            stocks.add(stock);
        }
        Map<String, Object> dtlsMap = orderDtlService.insertBatchService(dtls);//訂單明細
        int i = stockService.insertBatch(stocks);
        System.out.println(i + "---");
        map.put("orderResult", orderMap.get("orderResult"));
        map.put("dtlResult", dtlsMap.get("dtlResult"));
        return map;
    }

}
