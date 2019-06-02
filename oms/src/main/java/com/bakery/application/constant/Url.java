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
    //新增或修改商品
    String INSERT_OR_UPDATE_PDT_URL=PDT_MANAGER_LIST+"/insertOrUpdatePdt";
    //刪除商品
    String DELETE_PDT_URL=PDT_MANAGER_LIST+"/deletePdt";
    //商品入库
    String INSERT_IN_STOCK_URL=PDT_MANAGER_LIST+"/createInstock";
    //商品上架/下架
    String OPERATE_SHELL_PDT_URL=PDT_MANAGER_LIST+"/operateShellPdt";
    //文件上传
    String UPLOAD_FILE_URL=PDT_MANAGER_LIST+"/upLoadFile";
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
    //修改订单备注信息
    String UPDATE_ORDER_URL = ORDER_MANAGE_LIST + "/updatetOrder";
    //新增订单及订单明细
    String INSERT_ORDER_AND_DTL_URL=ORDER_MANAGE_LIST+"/insertOrderAndDtl";
    //新增订单初始化页面
    String INSERT_ORDER_INDEX_URL=ORDER_MANAGE_LIST+"/insertOrderIndex";
    //删除订单明细
    String DELETE_ORDER_DTL_URL=ORDER_MANAGE_LIST+"/deleteOrderDtl";
    //库存管理-库存列表
    String STOCK_MANAGE_LIST = "/stockManageList";
    //库存分页查询
    String QUERY_STOCK_LIST_BY_PAGE=STOCK_MANAGE_LIST+"/queryStockByPage";
    //库存管理-出库记录
    String STORE_OUT_LIST = "/storeOutList";
    //库存管理-出库记录
    String STORE_IN_LIST = "/storeInList";
    //分页查询
    String QUERY_STOCK_IN_OR_OUT_URL="/queryInOrOutStock";
    //修改入库量
    String UPDATE_STOCK_INNUM_URL=STORE_IN_LIST+"/updateStockInNum";
    //删除入库单
    String DELETE_IN_STOCK_URL=STORE_IN_LIST+"/deleteInStock";
    //登录
    String LOGIN_OMS_URL="/login";
    //用户民密码登录验证
    String LOGIN_VALID_URL="/loginValidate";
    //获取验证码
    String GET_VALID_NUM_URL="/getValidNumber";
    //校验验证码
    String VALIDATE_NUMBER_URL="/validateNumber";
    //welcome
    String WELCOME_URL="/welcome";
    //用户名密码注册验证
    String REGIST_VALID_URL="/regisValidate";
    //注册验证码验证
    String  VALIDATE_REGISNUM_URL="/validateRegisNum";
    //获取验证吗
    String GET_REGIS_VALID_NUM_URL="/getRegisValidNum";
    //注册
    String REGIST_OMS_URL="/regisOms";
    //找回密码获取验证码
    String GETPWD_VALID_NUM_URL="/pwdGetValidNum";
    //找回密码验证验证吗
    String REPWD_VALIDATE_NUM_URL="/repwdValidateNum";
    //找回密码
    String REBACK_PWD_URL="/rebackPwd";
    //修改密码
    String UPDATE_PWD_URL="/updatePwd";
    //数据字典列表
    String BASECODE_BY_PAGE_LIST = "/baseCodeByPageList";

    String BASECODE_MANAGE_LIST = "/baseCodeList";

    String CODETYPE_BY_PAGE_LIST = "/codeTypeByPageList";

    String UPDATE_CODETYPE = "/updateCodeTyoe";

    String INSERT_CODETYPE="/insertCodeType";

    String UPDATE_CODE="/updateCode";

    String INSERT_CODE="/insertCode";

    String DELETE_LIST_CODETYPE="/deleteListCodeType";

    String DELETE_INFO_CODETYPE="/deleteInfoCodeType";

    String DELETE_INFO_CODE="/deleteInfoCode";

    String DELETE_LIST_CODE="/deleteListCode";


}
