<%--
  User: liting
  Date: 2019/5/3
  Time: 5:56 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>product</title>
    <%--js--%>
    <script src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/jquery-confirm.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table-group.js"></script>
    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>
    <script src="<%=basePath%>static/jquery_mloading/jquery.mloading.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-editable.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table-editable.js"></script>
    <script src="<%=basePath%>static/bootstrap/treeView/js/bootstrap-treeview.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/bootstrap/switch/js/bootstrap-switch.min.js"></script>
    <%--css--%>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/jquery-confirm.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table-group.css">
    <link rel="stylesheet" href="<%=basePath%>static/jquery_mloading/jquery.mloading.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-editable.css">
    <link href="<%=basePath%>static/bootstrap/treeView/css/bootstrap-treeview.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/bootstrap/switch/css/bootstrap-switch.css  " rel="stylesheet">

    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/switch/css/bootstrap-switch.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
        }

        .modal-body {
            margin-right: 15px;
            height: 400px;
        }

        #kk {
            height: 205px;
        }

    </style>


</head>

<body>
<input type="hidden" id="selectLeftTree" value="selectLeftTree"/>
<input type="hidden" id="queryPdtManegeUrl" value="pdtManageList/queryPdt"/>
<input type="hidden" id="queryUserManegeUrl" value="userManageList/queryUser"/>
<input type="hidden" id="insertOrderAndDtlUrl" value="orderManageList/insertOrderAndDtl"/>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>订单管理</a></li>
    <li class="active">新增订单</li>
</ol>
<!-- 输入框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body" style="height: 580px">
            <div class="container-fluid">

                <form id="orderForm" name="orderForm" role="form" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <input type="hidden" id="choseUserPhone"/>
                            <input type="hidden" class="form-control  input-sm" name="pdtId" id="pdtId">
                            <label class="control-label col-md-1">商品名称:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control  input-sm" name="pdtName"
                                       id="pdtName" placeholder="名称" onclick="getPdtInfo()">
                            </div>
                            <label class="control-label col-md-1">商品数量:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control  input-sm" name="pdtNum"
                                       id="pdtNum" placeholder="数量" oninput="checkInput()" onmouseleave="checkPrice()">
                            </div>
                            <label class="control-label col-md-1">单价:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control  input-sm" name="unitPrice"
                                       id="unitPrice" placeholder="单价" oninput="checkInput()">
                            </div>
                            <label class="control-label col-md-1 ">总价:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control  input-sm" name="dtlTotalPrice"
                                       id="dtlTotalPrice" placeholder="总价">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-5" style="margin-top: 15px">
                                <button class="btn btn-primary btn-sm" type="button" onclick="addRow()">保存并录入下一个
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div style="width:1175px;">
                <table id="dataGrid"></table>
            </div>
            <div class="container-fluid" style="margin-top: 20px">
                <div class="form-group">
                    <div class="row">
                        <div class="switch control-label col-md-1" data-on="primary" data-off="info">
                            <input id="switch" type="checkbox" onclick="checkSwitch()"/>
                        </div>
                        <div class="col-md-2">
                            <fieldset disabled id="fieldset">
                                <input id="choseUserName" type="text" onclick="choseUser()"
                                       class="form-control  input-sm"
                                       placeholder="会员请选择">
                            </fieldset>
                        </div>
                        <div class="col-md-2">
                            <select type="text" class="form-control  input-sm" id="payMethod"
                                    name="payMethod" >
                                <option value="">请选择支付方式</option>
                            </select>
                        </div>
                        <label class="control-label col-md-1 col-md-offset-1">应付款:</label>
                        <div class="col-md-2">
                            <label class="control-label col-md-1" ><span id="money" style="color: red;"></span></label>
                            <label class="control-label col-md-1" >元</label>
                        </div>
                        <label class="control-label col-md-1">实付款:</label>
                        <div class="col-md-2">
                            <label class="control-label col-md-1"><span id="moneyF" style="color: red;"></span></label>
                            <input type="hidden" id="totalPrice">
                            <label class="control-label col-md-1" >元</label>
                        </div>


                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-5" style="margin-top: 15px">
                            <button class="btn btn-primary btn-sm" type="button"  style="width: 100px"
                                    onclick="createOrder()">提交订单
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 输入框 end -->
<!--模态框 加载商品start-->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="pdtForm" name="pdtForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick="rightClose()" type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">选择商品</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-4"><h3><span class="label label-default">商品类别</span></h3></div>
                        <div class="col-sm-8"><h3><span class="label label-default">详细信息</span></h3></div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-sm-4" style="margin-top: 20px">
                            <div id="tree"></div>
                        </div>
                        <div class="col-sm-8">
                            <div id="kk" style="visibility: hidden;">
                                <table id="tb_roles"></table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group form-group-sm">
                        <div class="col-md-1 col-md-offset-4">
                            <button type="button" class="btn btn-warning" data-dismiss="modal" style="width: 80px"
                                    onclick="rightClose()">关闭
                            </button>
                        </div>
                        <div class="col-md-1 col-md-offset-2">
                            <button type="button" class="btn btn-primary" style="width: 80px" onclick="makeSure()">确认
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
<!--模态框 加载商品end-->
<!--模态框 加载客户start-->
<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="searchUserForm" name="searchUserForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick="rightClose()" type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel2">选择用户</h4>
                </div>
                <div class="modal-body" style="height: 400px;">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-1">名称:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control  input-sm" name="search_userName"
                                   id="search_userName" placeholder="请输入客户名称" oninput="checkdInput()">
                        </div>
                        <label class="control-label col-md-1">电话:</label>
                        <div class="col-md-3">
                            <input type="text" class="form-control  input-sm " id="search_userPhone"
                                   name="search_userPhone" placeholder="请输入电话号码" oninput="checkdInput()">
                        </div>
                        <div class="col-sm-1 col-sm-offset-1" style="color: white">
                            <button class="btn btn-primary"
                                    type="button" onclick="queryUserBtn()">查询
                                <span class="fa fa-search-plus fa-lg"></span>
                            </button>
                        </div>
                        <div class="col-sm-1" style="color: white;margin-left: 55px">
                            <button disabled style="background-color: grey; border-color: grey; " id="resetSearchBtn"
                                    class="btn btn-primary" type="button" onclick="resetUserBtn()">重置
                                <span class="fa fa-repeat fa-lg"></span>
                            </button>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div style="height: 240px;margin-left: 15px">
                            <table id="user_table"></table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group form-group-sm">
                        <div class="col-md-1 col-md-offset-4">
                            <button type="button" class="btn btn-warning" data-dismiss="modal" style="width: 80px"
                                    onclick="rightClose()">关闭
                            </button>
                        </div>
                        <div class="col-md-1 col-md-offset-2">
                            <button type="button" class="btn btn-primary" style="width: 80px" onclick="getUser()">确认
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 加载客户start-->
</body>
<script>
    var payMethodList =${payMethodList}; //支付方式
    /*-------下拉框 jsonArr 数据，valPro value ，textPro text，domid select的id*/
    function initSelectOptions(jsonArr, valPro, textPro, domid) {
        var opt = '';
        for (var i = 0; i < jsonArr.length; i++) {
            opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
        }
        $("#" + domid).append(opt);
    }
    /*点击选择用户输入框触发*/
    function choseUser() {
        $('#userModal').modal('show');
    }
    /*提交订单*/
    function createOrder() {
        var totalPrice= $("#totalPrice").val();
        var userPhone= $("#choseUserPhone").val();
        var datas = $('#dataGrid').bootstrapTable('getData');
        var createUrl=$("#insertOrderAndDtlUrl").val();
        $.post(createUrl, {"data":JSON.stringify(datas),"totalPrice":totalPrice,"userPhone":userPhone}, function (data) {
            console.info(data);
            console.info(data.orderResult);
            if (data.orderResult == true&&data.dtlResult == true) {
                $.alert({
                    title: '提示',
                    content: '提交成功！',
                    type: 'green',             //一般危险操作用red,保存成功操作green
                    buttons: {              //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                                window.location.href="orderManageList/insertOrderIndex";
                            }
                        }
                    }
                });
                $('#tb_roles').bootstrapTable('refresh');  //刷新列表
            } else if (data.orderResult == true&&data.dtlResult == false) {
                $.alert({
                    title: '提示',
                    content: '订单明细生成失败！',
                    type: 'red',             //一般危险操作用red,保存成功操作green
                    buttons: {              //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                            }
                        }
                    }
                });
            }else if (data.orderResult == false&&data.dtlResult == true){
                $.alert({
                    title: '提示',
                    content: '订单生成失败！',
                    type: 'red',             //一般危险操作用red,保存成功操作green
                    buttons: {              //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                            }
                        }
                    }
                });
            }else{
                $.alert({
                    title: '提示',
                    content: '提交失败！',
                    type: 'green',             //一般危险操作用red,保存成功操作green
                    buttons: {              //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                            }
                        }
                    }
                });
            }
        }, 'json');

    }
    /*取用户名*/
    function getUser() {
        var rowids = $('#user_table').bootstrapTable('getSelections'); //获取所选中的行
        if (rowids.length <= 0) {
            $.alert({
                title: '提示',
                content: '您还没有选择数据！',
                type: 'blue',
                buttons: { //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //这里写点击按钮回调函数
                        }
                    }
                }
            });
        } else if (rowids.length == 1) {
            $("#choseUserName").val(rowids[0].userName);
            $("#choseUserPhone").val(rowids[0].userPhone);
            $("#moneyF").text(Math.ceil(priceTotal*0.8));
            $("#totalPrice").val(Math.ceil(priceTotal*0.8));
            $('#userModal').modal('hide');
        } else {
            $.alert({
                title: '提示',
                content: '每次只能选择一行数据！',
                type: 'blue', //一般危险操作用red,保存成功操作green
                buttons: { //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //这里写点击按钮回调函数
                        }
                    }
                }
            });
        }

    }

    /*点击商品名称触发弹框*/
    function getPdtInfo() {
        $('#myModal').modal('show');
    }

    /*-------------设置重置按钮状态start---------*/
    function changeBtnable() {
        $("#resetSearchBtn").removeAttr("disabled");
        $("#resetSearchBtn").removeAttr("style", "background-color:grey");
        $("#resetSearchBtn").removeAttr("style", "border-color:grey");
    }

    function changeBtndisable() {
        $("#resetSearchBtn").attr("disabled", "true");
        $("#resetSearchBtn").attr("style", "background-color:grey;border-color:grey");
    }

    var values = "";//判断按钮状态全局变量
    function checkdInput() {
        var searchUserForm = $('#searchUserForm').serializeArray();
        $.each(searchUserForm, function () {
            if (this.value != "") {
                values += this.value;
            }
        });
        if (values.length > 0) {
            changeBtnable();
        } else {
            changeBtndisable();
        }
        values = "";
    }

    /*查询按钮*/
    function queryUserBtn() {
        $('#user_table').bootstrapTable('refresh');
    }

    /*重置按钮*/
    function resetUserBtn() {
        $("#searchUserForm")[0].reset();
        $('#searchUserForm').find('[name]').each(function () {
            $(this).val('');
        });
        $('#user_table').bootstrapTable('refresh');
        changeBtndisable();
    }

    /*确认按钮*/
    function makeSure() {
        var rowids = $('#tb_roles').bootstrapTable('getSelections'); //获取所选中的行
        if (rowids.length <= 0) {
            $.alert({
                title: '提示',
                content: '请选择一行数据！',
                type: 'blue',
                buttons: { //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //这里写点击按钮回调函数
                        }
                    }
                }
            });
        } else if (rowids.length == 1) {
            var pdtName = rowids[0].pdtName;
            var pdtId = rowids[0].pdtId;
            var unitPrice = rowids[0].unitPrice;
            $("#pdtName").val(pdtName);
            $("#pdtId").val(pdtId);
            $("#unitPrice").val(unitPrice);
            $('#myModal').modal('hide');
        } else {
            $.alert({
                title: '提示',
                content: '每次只能选择一行数据修改！',
                type: 'blue', //一般危险操作用red,保存成功操作green
                buttons: { //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //这里写点击按钮回调函数
                        }
                    }
                }
            });
        }
    }

    function checkInput() {
        var pdtNum = $("#pdtNum").val();
        var unitPrice = $("#unitPrice").val();
        if (pdtNum != null || pdtNum != "" && unitPrice != null || unitPrice != "") {
            var dtlTotalPrice = pdtNum * unitPrice;
            $("#dtlTotalPrice").val(dtlTotalPrice);
        }
    }

    /*检查总价*/
    function checkPrice() {
        var pdtNum = $("#pdtNum").val();
        if (pdtNum == null || pdtNum == "") {
            $("#dtlTotalPrice").val("");
        }
    }

    /*校验按钮状态*/
    function checkSwitch() {
        if ($("#switch").prop('checked')) {
            $("#fieldset").removeAttr("disabled");
        } else {
            $("#fieldset").attr("disabled", "true");
        }
    }

    /*关闭按钮*/
    function rightClose() {
        $("#orderForm")[0].reset();
        $('#orderForm').find('[name]').each(function () {
            $(this).val('');
        });
    }

    /*新增一行数据*/
    function addRow() {
        checkForm();
        var bootstrapValidator = $("#orderForm").data('bootstrapValidator');
        if (bootstrapValidator.validate().isValid()) {
            var count = $('#dataGrid').bootstrapTable('getData').length;
            var jsonData = $("#orderForm").serializeJSON();
            $('#dataGrid').bootstrapTable('insertRow', {index: count, row: jsonData});
            $("#orderForm")[0].reset();
            $("#money").text(priceTotal);
            $("#moneyF").text(priceTotal);
            $("#totalPrice").val(priceTotal);
            /* $('#orderForm').find('[name]').each(function () {
                 $(this).val('');
             });*/
            $("#orderForm").data('bootstrapValidator').resetForm();
            $("#orderForm").data('bootstrapValidator').destroy();
            $('#orderForm').data('bootstrapValidator', null);
        }
    }

    /*删除一行数据*/
    function removeRow(pdtName) {
        newCount = newCount - 1;
        // 删除选定的行
        $('#dataGrid').bootstrapTable('remove', {field: "pdtName", values: [pdtName]});
    }

    /*表单验证*/
    function checkForm() {
        $("#orderForm").bootstrapValidator({
            message: '不可用的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                pdtName: {
                    validators: {
                        notEmpty: {
                            message: '商品不能为空'
                        }
                    }
                },
                pdtNum: {
                    validators: {
                        notEmpty: {
                            message: '数量不能为空'
                        }
                    }
                },
                unitPrice: {
                    validators: {
                        notEmpty: {
                            message: '单价不能为空'
                        }
                    }
                },

            }
        });
    }

    /*---------bootstrapTable------订单明细下方表格 start-----*/
    var newCount = 0;
    var priceTotal=0;
    var TableDownInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#dataGrid').bootstrapTable({
                    height: 330,
                    striped: true,
                    pagination: false,
                    pageSize: 10,
                    showFooter:true,
                    sortName: 'updateTime',
                    sidePagination: 'client',  //配置客户端分页方式
                    columns: [
                        {
                            field: 'pdtId',
                            title: '商品编号',
                            align: 'center',
                            valign: 'middle',
                            visible: false
                        }, {
                            field: 'pdtName',
                            title: '商品名称',
                            align: 'center',
                            valign: 'middle',
                        }, {
                            field: 'pdtNum',
                            title: '商品数量',
                            align: 'center',
                            valign: 'middle',
                            footerFormatter: function (value) {
                                var count = 0;
                                for (var i in value) {
                                    count += parseInt(value[i].pdtNum);
                                }
                                return  count;
                            }
                        }, {
                            field: 'unitPrice',
                            title: '单价',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            field: 'dtlTotalPrice',
                            title: '总价',
                            align: 'center',
                            valign: 'middle',
                           footerFormatter: function (value) {
                                var count = 0;
                                for (var i in value) {
                                    count += parseInt(value[i].dtlTotalPrice);
                                }
                               priceTotal=count;
                               return  count;
                            }
                        }, {
                            title: "操作",
                            align: 'center',
                            valign: 'middle',
                            formatter: function (value, row, index) {
                                return '<button style="margin-left: 15px" class="btn btn-danger"  onclick="removeRow(\'' + row.pdtName + '\')"><span class="fa fa-trash-o fa-fw"></span>删除</button> ';
                            }
                        }
                    ]
                }
            );
        }
        return oTableInit;
    }
    /*---------bootstrapTable------模态框右侧表格 start-----*/
    var index = '';
    var pdtType = '';
    var TableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryPdtManegeUrl").val();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_roles').bootstrapTable({
                    url: urlStr, //请求后台的URL（*）
                    method: 'post', //请求方式（*）
                    toolbar: '#toolbar', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: true, //是否显示分页（*）
                    sortable: true, //是否启用排序
                    sortOrder: "desc", //排序方式
                    striped: true, //是否显示行间隔色
                    sortName: "updateTime",
                    dataType: 'json',
                    queryParamsType: "undefined",//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
                    contentType: "application/x-www-form-urlencoded",
                    queryParams: function queryParams(params) { //设置查询参数
                        var param = {
                            pageNo: params.pageNumber,
                            pageSize: params.pageSize,
                            orderBy: params.sortName,
                            orderType: params.sortOrder,
                            pdtType: pdtType, //商品类别
                            searchText: params.searchText
                        };
                        return param;
                    },
                    sidePagination: "server", //分页方式:client客户端分页，server服务端分页（*）
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    pageSize: 5, //每页的记录行数（*）
                    pageList: [5], //可供选择的每页的行数（*）
                    strictSearch: true,
                    showColumns: false, //是否显示所有的列
                    showRefresh: false, //是否显示刷新按钮
                    minimumCountColumns: 2, //最少允许的列数
                    clickToSelect: true, //是否启用点击选中行
                    maintainSelected: false,
                    checkboxHeader: true,
                    uniqueId: "empNo", //每一行的唯一标识，一般为主键列
                    showToggle: false, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    detailView: false, //是否显示父子表
                    showExport: true, //是否显示导出
                    paginationShowPageGo: true,
                    exportDataType: "basic", //basic', 'all', 'selected'.
                    onClickRow: function (row, $element) {
                        index = $element.data('index');
                        //点击每列前的checkbox时
                    },
                    onCheck: function (row, $element) {
                        index = $element.data('index');
                    },
                    onLoadSuccess: function (data) { //bootTable
                    },
                    onExpandRow: function (index, row, $detail) {//加载子表
                        InitSubTable(index, row, $detail);
                    },
                    columns: [{
                        disabled: true,//设置是否可用
                        checkbox: true,
                        align: 'center',
                        valign: 'middle'
                    }, {
                        title: '商品编号',
                        field: 'pdtId',
                        align: 'center',
                        valign: 'middle',
                        visible: false

                    }, {
                        title: '商品名称',
                        field: 'pdtName',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        title: '商品类别',
                        field: 'pdtType',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    },  {
                        title: '商品类别',
                        field: 'pdtTypeDes',
                        align: 'center',
                        valign: 'middle'
                    },{
                        title: '单价',
                        field: 'unitPrice',
                        align: 'center',
                        valign: 'middle',
                    }, {
                        title: '单位',
                        field: 'measer',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    }, {
                        title: '会员',
                        field: 'isVip',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    }, {
                        title: '创建时间',
                        field: 'createTime',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    }, {
                        title: '状态',
                        field: 'status',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    }, {
                        title: '修改时间',
                        field: 'updateTime',
                        align: 'center',
                        valign: 'middle',
                        visible: false
                    }, {
                        title: '备注',
                        field: 'remark',
                        align: 'center',
                        valign: 'middle'
                    }],
                }
            );

        };
        return oTableInit;
    };
    /*查询用户表格*/
    var index = '';
    var UserTableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryUserManegeUrl").val();
        //初始化Table
        oTableInit.Init = function () {
            $('#user_table').bootstrapTable('destroy');
            $('#user_table').bootstrapTable({
                url: urlStr, //请求后台的URL（*）
                method: 'post', //请求方式（*）
                toolbar: '#toolbar', //工具按钮用哪个容器
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: true, //是否启用排序
                sortOrder: "desc", //排序方式
                striped: true, //是否显示行间隔色
                sortName: "updateTime",
                dataType: 'json',
                queryParamsType: "und1efined",//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
                contentType: "application/x-www-form-urlencoded",
                queryParams: function queryParams(params) { //设置查询参数
                    var param = {
                        pageNo: params.pageNumber,
                        pageSize: params.pageSize,
                        orderBy: params.sortName,
                        orderType: params.sortOrder,
                        userName: $("#search_userName").val(),
                        userPhone: $("#search_userPhone").val(),//电话号码
                        searchText: params.searchText
                    };
                    return param;
                },
                sidePagination: "server", //分页方式:client客户端分页，server服务端分页（*）
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 5, //每页的记录行数（*）
                pageList: [5], //可供选择的每页的行数（*）
                strictSearch: true,
                showColumns: false, //是否显示所有的列
                showRefresh: false, //是否显示刷新按钮
                minimumCountColumns: 2, //最少允许的列数
                clickToSelect: false, //是否启用点击选中行
                maintainSelected: false,
                checkboxHeader: true,
                uniqueId: "userId", //每一行的唯一标识，一般为主键列
                showToggle: false, //是否显示详细视图和列表视图的切换按钮
                cardView: false, //是否显示详细视图
                detailView: false, //是否显示父子表
                showExport: false, //是否显示导出
                paginationShowPageGo: true,
                exportDataType: "basic", //basic', 'all', 'selected'.
                onClickRow: function (row, $element) {
                    index = $element.data('index');
                    //点击每列前的checkbox时
                },
                onCheck: function (row, $element) {
                    index = $element.data('index');
                },
                onLoadSuccess: function (data) { //bootTable
                },
                columns: [{
                    disabled: true,//设置是否可用
                    checkbox: true,
                    align: 'center',
                    valign: 'middle',

                }, {
                    title: '客户编号',
                    field: 'userId',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '客户名称',
                    field: 'userName',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '联系方式',
                    field: 'userPhone',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '性别',
                    field: 'sexDes',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '性别',
                    field: 'sex',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '存档时间',
                    field: 'createTime',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '状态',
                    field: 'status',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '修改时间',
                    field: 'updateTime',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '备注',
                    field: 'remark',
                    align: 'center',
                    valign: 'middle'
                }],
                onEditableSave: function (field, row, oldValue, $el) {
                    var createOrUpdateUserUrl = $("#createOrUpdateUserUrl").val();
                    $.ajax({
                        type: "post",
                        url: createOrUpdateUserUrl,
                        data: row,
                        dataType: 'JSON',
                        success: function (data, status) {
                            if (status == "success") {
                                $.alert({
                                    title: '提示',
                                    content: '修改成功！',
                                    type: 'blue', //一般危险操作用red,保存成功操作green
                                    buttons: { //定义按钮
                                        confirm: {
                                            text: '确认',
                                            btnClass: 'btn-primary',
                                            action: function () { //这里写点击按钮回调函数
                                                $('#tb_roles').bootstrapTable('refresh');  //刷新列表
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        error: function () {
                            $.alert({
                                title: '提示',
                                content: '修改失败！',
                                type: 'red', //一般危险操作用red,保存成功操作green
                                buttons: { //定义按钮
                                    confirm: {
                                        text: '确认',
                                        btnClass: 'btn-primary',
                                        action: function () { //这里写点击按钮回调函数
                                        }
                                    }
                                }
                            });
                        },
                        complete: function () {

                        }

                    });
                }
            });

        };

        return oTableInit;
    };

    //点击左边树触发事件
    function addRightTable(event, node) {
        pdtType = node.childerCode;
        /* 加载右边的表格 */
        $("#tb_roles").bootstrapTable('refresh');
        $('#kk').css("visibility", "visible");
    }

    /*---------bootstrapTable------模态框右侧表格 end-----*/
    $(function () {
        initSelectOptions(payMethodList, "dataCode", "codeName", "payMethod");
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
        //初始化下方table
        var oTable1 = new TableDownInit();
        oTable1.Init();
        var oTable2 = new UserTableInit();
        oTable2.Init();
        //默认加载类别数
        var pdtTypeTreeUrl = $("#selectLeftTree").val();
        $.ajax({
             url: pdtTypeTreeUrl,    // 提交到controller的url路径
             type: "post",    // 提交方式
             dataType: "json",    // 服务器端返回的数据类型
             success: function (data) {
                 $('#tree').treeview({
                     data: data,
                     showIcon: false,
                     showCheckbox: false,
                     levels: 0,
                     selectedBackColor: '#fffccc',
                     selectedColor: '#000000',
                     showTags: true,
                     onNodeSelected: addRightTable
                 });
             }
         });
    })
</script>
</html>
