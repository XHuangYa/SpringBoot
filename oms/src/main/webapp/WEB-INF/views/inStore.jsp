<%--
  User: liting
  Date: 2019/3/26
  Time: 9:48 PM
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
    <title>Title</title>
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
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
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
        * {
            margin: 0;
            padding: 0;
        }

        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
            margin-top: 15px;
        }

        #kk {
            margin-top: 50px;
            height: 250px;
        }
    </style>
</head>
<body>
<input type="hidden" id="queryInOrOutStockUrl" value="/queryInOrOutStock"/>
<input type="hidden" id="updateInNumStockUrl" value="storeInList/updateStockInNum"/>
<input type="hidden" id="deleteInStockUrl" value="storeInList/deleteInStock"/>
<ol class="breadcrumb">
    <li><a href="<%=basePath%>welcome">Home</a></li>
    <li><a>库存管理</a></li>
    <li class="active">入库记录</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default" style="width: 1205px">
        <div class="panel-body" style="height: 620px;">
            <div class="container-fluid">

                <form id="searchStockForm" name="searchStockForm" class="form-horizontal">
                    <div class="form-group" style="margin-top: 30px">
                        <div class="row">
                            <label class="control-label col-md-1 ">商品名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm" name="search_pdtName"
                                       id="search_pdtName" placeholder="请输入商品名称" oninput="checkInput()">
                            </div>

                            <label class="control-label col-md-1 ">开始时间:</label>
                            <div class="col-md-2 has-feedback">
                                <input name="beginTime" id="beginTime" type="text " placeholder="精确到年月日"
                                       class="form-control input-sm" onchange="checkInput()"
                                       onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01\'}',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-md-1">结束时间:</label>
                            <div class="col-md-2 has-feedback">
                                <input name="endTime" id="endTime" type="text " placeholder="精确到年月日"
                                       class="form-control  input-sm" onchange="checkInput()"
                                       onFocus="WdatePicker({minDate:'#F{$dp.$D(\'beginTime\')}',maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                            <div class="col-md-1 col-md-offset-1" style="color: white">
                                <button class="btn btn-primary " style="width: 70px;  text-align: left;"
                                        type="button"
                                        id="searchBtn" onclick="queryStockBtn()">查&nbsp;询
                                    <span class="fa fa-search-plus fa-lg"></span>
                                </button>
                            </div>
                            <div class="col-md-1" style="color: white">
                                <button disabled class="btn btn-primary"
                                        style="width: 70px; background-color: grey; border-color: grey; text-align:left;"
                                        type="button" id="resetSearchBtn" onclick="resetStockBtn()"> 重&nbsp;置
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


</body>
<script>
    function queryStockBtn() {
        $("#tb_roles").bootstrapTable("refresh");
    }

    /*重置按钮*/
    function resetStockBtn() {
        $("#searchStockForm")[0].reset();
        $('#searchStockForm').find('[name]').each(function () {
            $(this).val('');
        });
        $('#tb_roles').bootstrapTable('refresh');
        changeBtndisable();
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
        var searchStockForm = $('#searchStockForm').serializeArray();
        $.each(searchStockForm, function () {
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

    /*删除订单*/
    function delFun(stockId) {
        if (stockId.length > 0) {
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
                            deleteTask(stockId);
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

    function deleteTask(stockId) {
        var delUrl = $("#deleteInStockUrl").val();
        $.post(delUrl, {"stockId": stockId}, function (data) {
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
    var TableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryInOrOutStockUrl").val();
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
                        flag: "IN",
                        pdtName: $("#search_pdtName").val(),
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
                uniqueId: "stockId", //每一行的唯一标识，一般为主键列
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
                onExpandRow: function (index, row, $detail) {//加载子表
                    InitSubTable(index, row, $detail);
                },
                columns: [{
                    disabled: true,//设置是否可用
                    checkbox: true,
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '入库单号',
                    field: 'stockId',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '商品ID',
                    field: 'pdtId',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '商品名称',
                    field: 'pdtName',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '入库量code',
                    field: 'inNum',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '入库量',
                    field: 'inNumDes',
                    align: 'center',
                    valign: 'middle',
                    editable: {
                        type: 'text',
                        title: '入库量',
                        validate: function (v) {
                            if (!v) return '入库数量不能为空';
                            if (/(^\s+)|(\s+$)/g.test(v)) {
                                return '入库数量不能输入空格!';
                            }
                            if (isNaN(v)) return '商品数量必须是数字';
                        }
                    }
                }, {
                    title: '入库时间',
                    field: 'inTime',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '下单时间',
                    field: 'createTime',
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
                }, {
                    field: 'action',
                    title: '操作',
                    align: "center",
                    valign: 'middle',
                    formatter: function (value, row, index) {
                        return '<button class="btn btn-danger"  onclick="delFun(\'' + row.stockId + '\')"><span class="fa fa-trash-o fa-fw"></span></button> ';
                    }
                }],
                onEditableSave: function (field, row, oldValue, $el) {
                    var updateUrl = $("#updateInNumStockUrl").val();
                    $.ajax({
                        type: "post",
                        url: updateUrl,
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
    $(function () {
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
    })
</script>
</html>
