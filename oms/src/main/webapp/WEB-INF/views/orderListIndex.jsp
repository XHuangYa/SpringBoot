<%--
  User: liting
  Date: 2019/4/1
  Time: 10:28 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%--css--%>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/jquery-confirm.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table-group.css">
    <link rel="stylesheet" href="<%=basePath%>static/jquery_mloading/jquery.mloading.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-editable.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
            margin-top: 15px;
        }

        .modal-dialog {
            width: 400px;
        }

        .modal-body {
            margin-right: 15px;
        }

        #kk {
            margin-top: 40px;
            height: 300px;
        }
    </style>


</head>

<body>
<input type="hidden" id="queryOrderManegeUrl" value="orderManageList/queryOrder"/>
<input type="hidden" id="updatePriceUrl" value="orderManageList/updatePrice"/>
<input type="hidden" id="queryOrderDtlManegeUrl" value="orderManageListqueryOrderDtl"/>
<input type="hidden" id="updateOrderUrl" value="orderManageList/updatetOrder"/>
<input type="hidden" id="updateOrderDtlUrl" value="orderManageList/updateOrderDtl"/>
<input type="hidden" id="deleteOrderDtlUrl" value="orderManageList/deleteOrderDtl"/>
<input type="hidden" id="deleteOrderUrl" value="orderManageList/deleteOrder"/>
<ol class="breadcrumb">
    <li><a href="<%=basePath%>welcome">Home</a></li>
    <li><a>订单管理</a></li>
    <li class="active">订单列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default"style="width: 1205px;">
        <div class="panel-body" style="height: 620px">
            <div class="container-fluid">

                <form id="searchOrderForm" name="searchOrderForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">客户名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm" name="search_userName"
                                       id="search_userName" placeholder="请输入客户名称" oninput="checkInput()">
                            </div>
                            <label class="control-label col-md-1 ">联系方式:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_userPhone"
                                       id="search_userPhone" placeholder="请输入联系方式" oninput="checkInput()">
                            </div>
                            <label class="control-label col-md-1 ">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间:</label>
                            <div class="col-md-2 has-feedback">
                                <input name="beginTime" id="beginTime" type="text " placeholder="精确到年月日"
                                       class="form-control input-sm" onchange="checkInput()"
                                       onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01\'}',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-md-1" style="padding-right: 60px; ">至:</label>
                            <div class="col-md-2 has-feedback">
                                <input name="endTime" id="endTime" type="text " placeholder="精确到年月日"
                                       class="form-control  input-sm" onchange="checkInput()"
                                       onFocus="WdatePicker({minDate:'#F{$dp.$D(\'beginTime\')}',maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">支付方式:</label>
                            <div class="col-md-2">
                                <select type="text" class="form-control  input-sm" id="search_payMethod"
                                        name="search_payMethod" onchange="checkInput()">
                                    <option value="">请选择支付方式</option>
                                </select>
                            </div>
                            <label class="control-label col-md-1">会&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员:</label>
                            <div class="col-md-2">
                                <select type="text" class="form-control  input-sm" id="search_isVip"
                                        name="search_isVip" onchange="checkInput()">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                            <div class="col-md-1 col-lg-offset-4" style="color: white">
                                <button class="btn btn-primary " style="width: 70px;  text-align: left;"
                                        type="button"
                                        id="searchBtn" onclick="queryEmpBtn()">查&nbsp;询
                                    <span class="fa fa-search-plus fa-lg"></span>
                                </button>
                            </div>
                            <div class="col-md-1" style="color: white">
                                <button disabled class="btn btn-primary"
                                        style="width: 70px; background-color: grey; border-color: grey; text-align:left;"
                                        type="button" id="resetSearchBtn" onclick="resetEmpBtn()"> 重&nbsp;置
                                    <span class="fa fa-repeat fa-lg"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div id="kk" style="width:1175px;">
                <div id="toolbar" class="btn-group"></div>
                <table id="tb_roles"></table>
            </div>
        </div>
    </div>
</div>
<!-- 查询框 end -->
<!--模态框 start-->
<div class="modal fade  bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" 1
     aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">订单信息</h4>
                </div>
                <div class="modal-body" style="padding-right: 25px;">

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">订单编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="orderId" id="orderId"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="pdtName" id="pdtName"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">出售时间:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="doneTime" id="doneTime"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">出售数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="saleNum" id="saleNum"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="unit_price" id="unit_price"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="total_price" id="total_price"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">客&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="userName" id="userName"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12" style="margin-left: 25px; padding-right: 40px; ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 40px"
                                      rows="2"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-2 col-sm-offset-3   btn-sm">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-2  col-sm-offset-2  btn-sm">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
</body>
<script>
    var payMethodList =${payMethodList}; //支付方式
    var yesOrNo =${yesOrNo};//是否
    /*-------下拉框 jsonArr 数据，valPro value ，textPro text，domid select的id*/
    function initSelectOptions(jsonArr, valPro, textPro, domid) {
        var opt = '';
        for (var i = 0; i < jsonArr.length; i++) {
            opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
        }
        $("#" + domid).append(opt);
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

    /*-------------设置重置按钮状态end---------*/
    var values = "";//判断按钮状态全局变量
    function checkInput() {
        var searchOrderForm = $('#searchOrderForm').serializeArray();
        $.each(searchOrderForm, function () {
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

    /*关闭按钮*/
    function rightClose() {
        //清除表单验证
        $("#orderForm").data('bootstrapValidator').destroy();
        $('#orderForm').data('bootstrapValidator', null);
    }

    /*查询按钮*/
    function queryEmpBtn() {
        $('#tb_roles').bootstrapTable('refresh');
    }

    /*重置按钮*/
    function resetEmpBtn() {
        $("#searchOrderForm")[0].reset();
        $('#searchOrderForm').find('[name]').each(function () {
            $(this).val('');
        });
        $('#tb_roles').bootstrapTable('refresh');
        changeBtndisable();
    }

    /*删除订单明细*/
    function delDtlFun(row) {
        var rows = row.split(",");
        if (rows[1].length > 0) {
            $.confirm({
                title: '提示',
                content: '您确认需要删除该数据吗？',
                type: 'blue',
                icon: 'glyphicon glyphicon-question-sign',
                buttons: {
                    ok: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //确认按钮回调
                            deleteDtlTask(row);
                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'btn-primary',
                        action: function () { //取消按钮回调
                        }
                    }
                },
            });
        }
    }

    function deleteDtlTask(row) {
        var rows = row.split(",");
        var delUrl = $("#deleteOrderDtlUrl").val();
        $.post(delUrl, {"orderDtlId": rows[1],"orderId":rows[0]}, function (data) {
            if (data || data == 'true') {
                $.alert({
                    title: '提示',
                    content: '删除成功！',
                    type: 'green',             //一般危险操作用red,保存成功操作green
                    buttons: {              //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                                $(cur_table).bootstrapTable('refresh');  //刷新列表
                                $("#tb_roles").bootstrapTable("refresh");
                            }
                        }
                    }
                });

            } else {
                $.alert({
                    title: '提示',
                    content: '删除失败,如有问题请联系管理员！',
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
            }
        }, 'json');


    }

    /*删除订单*/
    function delFun(orderId) {
        if (orderId.length > 0) {
            $.confirm({
                title: '提示',
                content: '您确认需要删除该数据吗？',
                type: 'blue',
                icon: 'glyphicon glyphicon-question-sign',
                buttons: {
                    ok: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //确认按钮回调
                            deleteTask(orderId);
                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'btn-primary',
                        action: function () { //取消按钮回调
                        }
                    }
                },
            });
        }
    }

    function deleteTask(orderId) {
        var delUrl = $("#deleteOrderUrl").val();
        $.post(delUrl, {"orderId": orderId}, function (data) {
            if (data || data == 'true') {
                $.alert({
                    title: '提示',
                    content: '删除成功！',
                    type: 'green',             //一般危险操作用red,保存成功操作green
                    buttons: {              //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                                $("#tb_roles").bootstrapTable('refresh');  //刷新列表
                            }
                        }
                    }
                });

            } else {
                $.alert({
                    title: '提示',
                    content: '删除失败,如有问题请联系管理员！',
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
            }
        }, 'json');


    }

    /*---------bootstrapTable------start-----*/
    var index = '';
    var cur_table = '';
    var TableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryOrderManegeUrl").val();
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
                        userName: $("#search_userName").val(), //员工名称
                        userPhone: $("#search_userPhone").val(),//电话号码
                        payMethod: $("#search_payMethod").val(),//电话号码
                        isVip: $("#search_isVip").val(),//电话号码
                        beginTime: $("#beginTime").val(),//开始时间
                        endTime: $("#endTime").val(),//结束时间
                        searchText: params.searchText
                    };
                    return param;
                },
                sidePagination: "server", //分页方式:client客户端分页，server服务端分页（*）
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 5, //每页的记录行数（*）
                pageList: [5, 10, 15, 20], //可供选择的每页的行数（*）
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
                detailView: true, //是否显示父子表
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
                    valign: 'middle',

                }, {
                    title: '订单编号',
                    field: 'orderId',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '客户',
                    field: 'userName',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '总价',
                    field: 'totalPrice',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '联系方式',
                    field: 'userPhone',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '支付方式',
                    field: 'payMethod',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '会员',
                    field: 'isVip',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '下单时间',
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
                    valign: 'middle',
                    editable: {
                        type: 'text',
                        title: '备注信息',
                        validate: function (v) {
                            if (/(^\s+)|(\s+$)/g.test(v)) {
                                return '备注信息不能输入空格!';
                            }

                        }
                    }
                }, {
                    field: 'action',
                    title: '操作',
                    align: "center",
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        return '<button class="btn btn-danger"  onclick="delFun(\'' + row.orderId + '\')"><span class="fa fa-trash-o fa-fw"></span></button> ';
                    }
                }],
                onEditableSave: function (field, row, oldValue, $el) {
                    var updateOrderUrl = $("#updateOrderUrl").val();
                    $.ajax({
                        type: "post",
                        url: updateOrderUrl,
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
    //初始化子表格(无线循环)
    InitSubTable = function (index, row, $detail) {
        var orderId = row.orderId;
        cur_table = $detail.html('<table></table>').find('table');
        var dtlUrl = $("#queryOrderDtlManegeUrl").val();
        $(cur_table).bootstrapTable({
            method: 'POST',
            url: dtlUrl,
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false, //是否显示分页（*）
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
                    orderId: orderId,//订单号
                    searchText: params.searchText
                };
                return param;
            },
            clickToSelect: true,
            detailView: true,//父子表
            uniqueId: "orderDtlId",
            pageSize: 20,
            pageList: [20],
            sidePagination: "server", //分页方式:client客户端分页，server服务端分页（*）
            pageNumber: 1, //初始化加载第一页，默认第一页
            strictSearch: false,
            showColumns: false, //是否显示所有的列
            showRefresh: false, //是否显示刷新按钮
            minimumCountColumns: 2, //最少允许的列数
            clickToSelect: false, //是否启用点击选中行
            maintainSelected: false,
            checkboxHeader: false,
            showToggle: false, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
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
                field: 'orderDtlId',
                title: '明细编号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'orderId',
                title: '订单编号',
                align: 'center',
                valign: 'middle',
                visible: false
            }, {
                field: 'pdtId',
                title: '商品编号',
                align: 'center',
                valign: 'middle',
                visible: false
            }, {
                field: 'pdtName',
                title: '商品名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'pdtNum',
                title: '商品数量',
                align: 'center',
                valign: 'middle',
                editable: {
                    type: 'text',
                    title: '商品数量',
                    validate: function (v) {
                        if (!v) return '商品数量不能为空';
                        if (/(^\s+)|(\s+$)/g.test(v)) {
                            return '商品数量不能输入空格!';
                        }
                        if (isNaN(v)) return '商品数量必须是数字';
                    }
                }
            }, {
                field: 'dtlTotalPrice',
                title: '总价',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'action',
                title: '操作',
                align: "center",
                valign: 'middle',
                formatter: function (value, row, index) {
                    return '<button style="margin-left: 15px" class="btn btn-danger"  onclick="delDtlFun(\'' + row.orderId + ',' + row.orderDtlId + '\')"><span class="fa fa-trash-o fa-fw"></span></button> ';

                }
            }],
            onEditableSave: function (field, row, oldValue, $el) {
                var updatePriceUrl = $("#updatePriceUrl").val();
                $.ajax({
                    type: "post",
                    url: updatePriceUrl,
                    data: row,
                    dataType: 'JSON',
                    success: function (data, status) {
                        if (data.result == true) {
                            $.alert({
                                title: '提示',
                                content: '修改成功！',
                                type: 'blue', //一般危险操作用red,保存成功操作green
                                buttons: { //定义按钮
                                    confirm: {
                                        text: '确认',
                                        btnClass: 'btn-primary',
                                        action: function () { //这里写点击按钮回调函数
                                            $(cur_table).bootstrapTable('refresh');  //刷新列表
                                            $("#tb_roles").bootstrapTable('refresh');  //刷新列表

                                        }
                                    }
                                }
                            });
                        }
                    },
                    error: function () {
                        if (data.result == true) {
                            $.alert({
                                title: '提示',
                                content: '订单明细修改失败！',
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
                        } else if (data.repeat == false) {
                            $.alert({
                                title: '提示',
                                content: '订单明细修改失败！',
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
                        }
                    },
                    complete: function () {

                    }

                });
            }

        });

    };

    $(function () {
        initSelectOptions(payMethodList, "dataCode", "codeName", "search_payMethod");//员工标识
        initSelectOptions(yesOrNo, "dataCode", "codeName", "search_isVip");//员工标识
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
    })
</script>
</html>
