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
<html lang="zh-CN">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
   <%-- <script src="<%=basePath%>static/bootstrap/js/bootstrap-editable.js"></script>--%>
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
        }
        .modal-dialog {
            width: 400px;
        }
        .modal-body{
            margin-right: 15px;
        }
    </style>
</head>

<body>
<input type="hidden" id="queryUserManegeUrl" value="userManageListqueryUser"/>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>客户管理</a></li>
    <li class="active">客户列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container-fluid">
                <form id="searchUserForm" name="searchUserForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1">客户名称:</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm " name="search_userName"
                                       id="search_userName" placeholder="请输入客户名称" oninput="checkInput()">
                            </div>
                            <label class="control-label col-md-1 ">电话号码:</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm " id="search_userPhone"
                                       name="search_userPhone" placeholder="请输入电话号码" oninput="checkInput()">
                            </div>
                            <div class="col-md-2" style="padding-left: 115px;color: white">
                                <button class="btn btn-primary " style="width: 75px; text-align: left" type="button"
                                        id="searchBtn" onclick="queryUserBtn()">查&nbsp;询
                                    <span class="fa fa-search-plus fa-lg"></span>
                                </button>
                            </div>
                            <div class="col-md-2" style="padding-left: 110px;color: white">
                                <button disabled class="btn btn-primary "
                                        style="width: 75px; background-color: grey; border-color: grey; text-align: left"
                                        type="button" id="resetSearchBtn" onclick="resetUserBtn()">重&nbsp;置
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
<div class="modal fade  bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form-horizontal" role="form" id="userForm" name="userForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">客户信息</h4>
                </div>
                <div class="modal-body" >
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">客户名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="userName" id="userName"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">电话号码:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="userPhone" id="userPhone"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">客户性别:</label>
                        <div class="col-sm-8">
                        <select class="form-control" name="sex" id="sex"
                                onkeyup="this.value=this.value.replace(/\s+/g,'')">
                            <option value="">请选择</option>
                        </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">存档时间:</label>
                        <div class="col-sm-8 has-feedback ">
                            <input name="createTime" id="createTime" type="text" placeholder="精确到年月日时分秒 "
                                   class="form-control"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">修改时间:</label>
                        <div class="col-sm-8 has-feedback ">
                            <input name="updateTime" id="updateTime" type="text" placeholder="精确到年月日时分秒 "
                                   class="form-control "/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="margin-left: 10px;">
                        <div class="col-sm-12" >
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 40px;" rows="3"
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
    function checkInput() {
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
        $('#tb_roles').bootstrapTable('refresh');
    }
    /*重置按钮*/
    function resetUserBtn() {
        $("#searchUserForm")[0].reset();
        $('#searchUserForm').find('[name]').each(function () {
            $(this).val('');
        });
        $('#tb_roles').bootstrapTable('refresh');
        changeBtndisable();
    }
    /*------------全局变量 start----------*/
    var sexList =${sexList};  //性别
    var sysMenuList =${sysMenuList};//按钮列表
    /*-------下拉框 jsonArr 数据，valPro value ，textPro text，domid select的id*/
    function initSelectOptions(jsonArr, valPro, textPro, domid) {
        var opt = '';
        for (var i = 0; i < jsonArr.length; i++) {
            opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
        }
        $("#" + domid).append(opt);
    }

    /*---------bootstrapTable------start-----*/
    var index = '';
    var TableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryUserManegeUrl").val();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_roles').bootstrapTable('destroy');
            $('#tb_roles').bootstrapTable({
                url: urlStr, //请求后台的URL（*）
                method: 'post', //请求方式（*）
                //toolbar: '#toolbar', //工具按钮用哪个容器
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
                pageList: [5, 10, 15, 20], //可供选择的每页的行数（*）
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
                    editable: {
                        type: 'text',
                        title: '客户名称',
                        validate: function (v) {
                            if (!v) return '客户名称不能为空';

                        }
                    }
                }, {
                    title: '联系方式',
                    field: 'userPhone',
                    align: 'center',
                    valign: 'middle'
                },{
                    title: '性别',
                    field: 'sexDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '性别',
                    field: 'sex',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                },{
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
                    valign: 'middle'
                }, {
                    title: '备注',
                    field: 'remark',
                    align: 'center',
                    valign: 'middle'
                }]
            });

        };
        return oTableInit;
    };
    $(function () {
        //模态框下拉框
        initSelectOptions(sexList, "dataCode", "codeName", "sex");//员工性别
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
    })
</script>
</html>
