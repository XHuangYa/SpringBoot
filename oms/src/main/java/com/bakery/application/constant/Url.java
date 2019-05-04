package com.bakery.application.constant;

/**
 * @author liting
 * @date 2019/03/26  22:30
 */
public interface Url {
    //员工管理-员工列表
    String EMP_MANAGER_LIST = "/empManageList";
    //员工分页查询
    String EMP_MANAGE_QUERY_URL = EMP_MANAGER_LIST + "queryEmp";
    //删除员工信息
    String DELETE_EMP_SINGLE_URL = EMP_MANAGER_LIST + "deleteEmp";
    //新增/修改员工
    String INSERT_OR_UPDATE_EMPINFO_URL = EMP_MANAGER_LIST + "inserOrUpdatetEmp";
    //用户管理-用户列表
    String USER_MANAGER_LIST = "/userManageList";
    //用戶分頁查詢
    String USER_MANAGE_QUERY_URL = USER_MANAGER_LIST + "/queryUser";
    //新增/修改客户信息
    String INSERT_OR_UPDATE_USER_URL = USER_MANAGER_LIST + "/inserOrUpdatetUser";
    //删除用户
    String DELETE_USER_SINGLE_URL=USER_MANAGER_LIST+"/deleteuser";
    //商品管理-商品列表
    String PDT_MANAGER_LIST = "/pdtManageList";
    //商品分頁查詢
    String  PDT_MANAGE_QUERY_URL=PDT_MANAGER_LIST+"/queryPdt";
    //订单管理-订单列表
    String ORDER_MANAGE_LIST = "/orderManageList";
    //新增订单-商品左侧树
    String SELECT_LEFT_TREE = "/selectLeftTree";
    //修改订单金额
    String UPDATE_ORDER_PRICE_URL=ORDER_MANAGE_LIST+"/updatePrice";
    //订单分頁查詢
    String ORDER_MANAGE_QUERY_URL = ORDER_MANAGE_LIST + "/queryOrder";
    //删除订单
    String DELETE_ORDER_URL=ORDER_MANAGE_LIST+"/deleteOrder";
    //订单明细分页查询
    String ORDERDTL_MANAGE_QUERY_URL=ORDER_MANAGE_LIST+"queryOrderDtl";
    //新增/修改订单备注信息
    String INSERT_OR_UPDATE_ORDER_URL = ORDER_MANAGE_LIST + "/inserOrUpdatetOrder";
    //新增订单初始化页面
    String INSERT_ORDER_INDEX_URL=ORDER_MANAGE_LIST+"/insertOrderIndex";
    //删除订单明细
    String DELETE_ORDER_DTL_URL=ORDER_MANAGE_LIST+"/deleteOrderDtl";
    //库存管理-库存列表
    String STOCK_MANAGE_LIST = "/stockManageList";
    //库存管理-出库记录
    String STORE_OUT_LIST = "/storeOutList";
    //库存管理-出库记录
    String STORE_IN_LIST = "/storeInList";


}
