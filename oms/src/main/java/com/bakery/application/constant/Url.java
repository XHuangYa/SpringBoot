package com.bakery.application.constant;

/**
 * @author liting
 * @date 2019/03/26  22:30
 */
public  interface Url{
    //员工管理-员工列表
    String  EMP_MANAGER_LIST="/empManageList";
    //员工分页查询
    String  EMP_MANAGE_QUERY_URL=EMP_MANAGER_LIST+"queryEmp";
    //删除员工信息
    String  DELETE_EMP_SINGLE_URL=EMP_MANAGER_LIST+"deleteEmp";
    //新增员工
    String INSERT_OR_UPDATE_EMPINFO_URL=EMP_MANAGER_LIST+"inserOrUpdatetEmp";
    //用户管理-用户列表
    String USER_MANAGER_LIST="/userManageList";
    //用戶分頁查詢
    String USER_MANAGE_QUERY_URL=USER_MANAGER_LIST+"queryUser";

    //商品管理-商品列表
    String PDT_MANAGER_LIST="/pdtManageList";
    //订单管理-订单列表
    String ORDER_MANAGE_LIST="/orderManageList";
    //库存管理-库存列表
    String STOCK_MANAGE_LIST="/stockManageList";
    //库存管理-出库记录
    String STORE_OUT_LIST="/storeOutList";
    //库存管理-出库记录
    String STORE_IN_LIST="/storeInList";


}
