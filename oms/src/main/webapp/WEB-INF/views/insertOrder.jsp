<%--
  User: liting
  Date: 2019/5/3
  Time: 5:56 PM
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
    <script src="<%=basePath%>static/bootstrap/treeView/js/bootstrap-treeview.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>
    <%--css--%>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/jquery-confirm.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table-group.css">
    <link rel="stylesheet" href="<%=basePath%>static/jquery_mloading/jquery.mloading.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-editable.css">
    <link href="<%=basePath%>static/bootstrap/treeView/css/bootstrap-treeview.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
        }

        .modal-body {
            margin-right: 15px;
        }

        #kk {
            margin-top: 40px;
            height: 280px;
        }

        .modal-body {
            height: 400px;
        }
    </style>


</head>

<body>
<input type="hidden" id="selectLeftTree" value="selectLeftTree"/>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>订单管理</a></li>
    <li class="active">新增订单</li>
</ol>
<!-- 输入框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body" style="height: 540px">
            <div class="container-fluid">

                <form id="searchOrderForm" name="searchOrderForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1">商品名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm" name="pdtName"
                                       id="pdtName" placeholder="商品名称" onclick="getPdtInfo()">
                            </div>
                            <label class="control-label col-md-1">商品数量:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="pdtNum"
                                       id="pdtNum" placeholder="商品数量">
                            </div>
                            <label class="control-label col-md-1">商品单价:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm" name="unitPrice"
                                       id="unitPrice" placeholder="商品单价">
                            </div>
                            <label class="control-label col-md-1 ">商品总价:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control  input-sm" name="dtlTotalPrice"
                                       id="dtlTotalPrice" placeholder="商品总价">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-5" style="margin-top: 15px">
                                <button class="btn btn-primary btn-sm" type="button">保存并录入下一个</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 输入框 end -->
<!--模态框 start-->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick="rightClose()" type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">选择商品</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                    <input type="hidden" class="form-control" name="empNo" id="empNo" placeholder="请输入..."/>
                    <div class="form-group form-group-sm">
                        <div class="col-sm-4">
                            <div id="tree"></div>
                        </div>
                        <div class="col-sm-8">
                            <div id="kk">
                                <table id="tb_roles"></table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group form-group-sm">
                        <div class="col-md-1 col-md-offset-4">
                            <button type="button" class="btn btn-warning" data-dismiss="modal" style="width: 80px">关闭
                            </button>
                        </div>
                        <div class="col-md-1 col-md-offset-2">
                            <button type="button" class="btn btn-primary" style="width: 80px">保存</button>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
</body>
<script>
    /*点击商品名称触发弹框*/
    function getPdtInfo() {
        $('#myModal').modal('show');
    }
    /*---------bootstrapTable------订单明细下方表格 start-----*/
    var TableDownInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#dataGrid').bootstrapTable({
                height: 330,
                striped: true,
                pagination: true,
                pageSize: 10,
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
                        valign: 'middle'
                    }, {
                        field: 'unitPrice',
                        title: '单价',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'dtlTotalPrice',
                        title: '总价',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        title: "操作",
                        formatter: function (value, row, index) {
                            return '<button style="margin-left: 15px" class="btn btn-danger"  onclick="delDtlFun(\'' + row.orderDtlId + '\')"><span class="fa fa-trash-o fa-fw"></span></button> ';
                        }
                    }
                ]
            });
        }
        return oTableInit;
    }

    /*---------bootstrapTable------订单明细下方表格 end-----*/
    /*---------bootstrapTable------模态框右侧表格 start-----*/
    var index = '';
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
                            pdtType: pdtType, //商品类别
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
                    }, {
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
    /*---------bootstrapTable------模态框右侧表格 end-----*/
    $(function () {
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
        //初始化下方table
        var oTable = new TableDownInit();
        oTable.Init();
    })
</script>
</html>
