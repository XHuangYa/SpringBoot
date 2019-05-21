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
        * {
            margin: 0;
            padding: 0;
        }
        .breadcrumb {
            width: 1200px;
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
            margin-top: 50px;
            height: 300px;
        }

    </style>
</head>

<body>
<input type="hidden" id="queryUserManegeUrl" value="userManageList/queryUser"/>
<input type="hidden" id="createOrUpdateUserUrl" value="userManageList/inserOrUpdatetUser"/>
<input type="hidden" id="deleteUserUrl" value="userManageList/deleteuser"/>
<ol class="breadcrumb">
    <li><a href="<%=basePath%>welcome">Home</a></li>
    <li><a>客户管理</a></li>
    <li class="active">客户列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default" style="width: 1205px">
        <div class="panel-body" style="height: 620px;">
            <div class="container-fluid">
                <form id="searchUserForm" name="searchUserForm" class="form-horizontal">
                    <div class="form-group" style="margin-top: 30px">
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
                                <button disabled class="btn btn-primary"
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
                <div id="toolbar" class="btn-group">
                </div>
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
                    <button type="button" class="close" data-dismiss="modal" onclick="rightClose()"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">客户信息</h4>
                </div>
                <div class="modal-body">
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
                                   class="form-control"
                                   onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">修改时间:</label>
                        <div class="col-sm-8 has-feedback ">
                            <input name="updateTime" id="updateTime" type="text" placeholder="精确到年月日时分秒 "
                                   class="form-control "
                                   onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="margin-left: 10px;">
                        <div class="col-sm-12">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 40px;"
                                      rows="3"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-2 col-sm-offset-3   btn-sm"
                            onclick="saveOrUpdateFun()">保存
                    </button>
                    <button id="reseted"  class="btn btn-warning  col-sm-2  col-sm-offset-2  btn-sm"
                            onclick="resetModelBtn()">重置
                    </button>
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
    /*刷新按钮*/
    function refreshFun() {
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

    /*新增按钮*/
    function addFun() {
        row = "";
        $('#myModal').modal('show');
        checkForm();
        $("#userForm").data('bootstrapValidator').resetForm();
        $('#userForm')[0].reset();
    }

    /*关闭按钮*/
    function rightClose() {
        //清除表单验证
        $("#userForm").data('bootstrapValidator').destroy();
        $('#userForm').data('bootstrapValidator', null);
    }
    /*删除按钮*/
    function deleteFun() {
        var rowids = $('#tb_roles').bootstrapTable('getSelections'); //获取所选中的行
        if (rowids.length <= 0) {
            $.alert({
                title: '提示',
                content: '请选择一行数据删除！',
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
            $.confirm({
                title: '提示',
                content: '您确认需要删除选中的数据吗？',
                type: 'blue',
                icon: 'glyphicon glyphicon-question-sign',
                buttons: {
                    ok: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function () { //确认按钮回调
                            deleteTask();
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

    /*确认删除*/
    function deleteTask() {
        var rowId = $('#tb_roles').bootstrapTable('getSelections');
        var delUrl = $("#deleteUserUrl").val();
        var userId = "";
        if (rowId.length == 1) {
            userId = rowId[0].userId;
        }
        $.post(delUrl, {"userId": userId}, function (data) {
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
                            }
                        }
                    }
                });
                $('#tb_roles').bootstrapTable('refresh');  //刷新列表
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
    /*新增信息确认按钮*/
    function saveOrUpdateFun() {
        var bootstrapValidator = $("#userForm").data('bootstrapValidator');
        if (bootstrapValidator.validate().isValid()) {
            $("body").mLoading({
                text: "加载中，请稍候...",//加载文字，默认值:加载中...
                html: false,//设置加载内容是否是html格式，默认值是false
                content: "",//忽略icon和text的值，直接在加载框中显示此值
                mask: true//是否显示遮罩效果，默认显示
            })
            var createOrUpdateUserUrl = $("#createOrUpdateUserUrl").val();
            $.post(createOrUpdateUserUrl, $("#userForm").serialize(), function (data) {
                $("body").mLoading("hide");//隐藏loading组件
                if (data.result == true) {
                    $.alert({
                        title: '提示',
                        content: '保存成功！',
                        type: 'green',				//一般危险操作用red,保存成功操作green
                        buttons: {				//定义按钮
                            confirm: {
                                text: '确认',
                                btnClass: 'btn-primary',
                                action: function () {	//这里写点击按钮回调函数
                                    $('#myModal').modal('hide');
                                    $("#userForm").data('bootstrapValidator').resetForm();
                                    $('#tb_roles').bootstrapTable('refresh');  //刷新列表
                                }
                            }
                        }
                    });
                } else if (data.result == false) {
                    $.alert({
                        title: '提示',
                        content: '保存失败！',
                        type: 'red',				//一般危险操作用red,保存成功操作green
                        buttons: {				//定义按钮
                            confirm: {
                                text: '确认',
                                btnClass: 'btn-primary',
                                action: function () {	//这里写点击按钮回调函数
                                }
                            }
                        }
                    });
                } else if (data.repeat == false) {
                    $.alert({
                        title: '提示',
                        content: '用户已存在！',
                        type: 'red',				//一般危险操作用red,保存成功操作green
                        buttons: {				//定义按钮
                            confirm: {
                                text: '确认',
                                btnClass: 'btn-primary',
                                action: function () {	//这里写点击按钮回调函数
                                }
                            }
                        }
                    });
                }

            }, 'json');
        }
        else {
            $.alert({
                title: '提示',
                content: '请按照相关提示修改！',
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
    }

    function resetModelBtn() {
        $("#userForm").data('bootstrapValidator').resetForm();
        $('#userForm')[0].reset();
        $("#userForm").data('bootstrapValidator').destroy();
        checkForm();
    }

    /*表单验证*/
    function checkForm() {
        $("#userForm").bootstrapValidator({
            message: '不可用的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userName: {
                    validators: {
                        notEmpty: {
                            message: '请填写选客户名称'
                        }
                    }
                },
                userPhone: {
                    validators: {
                        notEmpty: {
                            message: '请填写电话号码'
                        }
                    }
                },
                sex: {
                    validators: {
                        notEmpty: {
                            message: '请选择归属性别'
                        }
                    }
                }

            }
        });
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

    var tempStr = "";
    for (var i = 0; i < sysMenuList.length; i++) {
        if (sysMenuList[i].dataCode == "add"
            || sysMenuList[i].dataCode == "delete"
            || sysMenuList[i].dataCode == "refresh"
        ) {
            tempStr += "<button id=\"btn_\""
                + sysMenuList[i].dataCode
                + " type=\"button\" class=\"btn btn-default\" onclick=\""
                + sysMenuList[i].functionName
                + "();\"><span style=\"display:inline-block; vertical-align:middle; margin-right:3px;\" " +
                "class=\"" + sysMenuList[i].cssIcon
                + "\" aria-hidden=\"true\"></span>"
                + sysMenuList[i].dataName
                + "</button>";
        }
    }
    $("#toolbar").html(tempStr);

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
                            if (/(^\s+)|(\s+$)/g.test(v)) {
                                return '客户名称不能输入空格!';
                            }

                        }
                    }
                }, {
                    title: '联系方式',
                    field: 'userPhone',
                    align: 'center',
                    valign: 'middle',
                    editable: {
                        type: 'text',
                        title: '联系方式',
                        validate: function (v) {
                            if (!v) return '联系方式不能为空';
                            if (/(^\s+)|(\s+$)/g.test(v)) {
                                return '联系方式不能输入空格!';
                            }
                            if (!$.trim(v).length == 11) return '联系方式格式有误！';
                            if (isNaN(v)) return '年联系方式必须是数字';
                        }
                    }
                }, {
                    title: '性别',
                    field: 'sexDes',
                    align: 'center',
                    valign: 'middle',
                    editable: {
                        type: 'select',
                        title: '性别',
                        source: [{value: "男", text: "男"}, {value: "女", text: "女"}]
                    }
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
                    editable: {
                        type: 'date',
                        title: '修改时间'
                    }
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
    $(function () {
        //模态框下拉框
        initSelectOptions(sexList, "dataCode", "codeName", "sex");//员工性别
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
    })
</script>
</html>
