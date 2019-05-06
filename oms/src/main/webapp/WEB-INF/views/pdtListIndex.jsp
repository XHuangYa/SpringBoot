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
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>

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
            width: 700px;
        }

        #kk {
            margin-top: 35px;
            height: 250px;
        }

    </style>
</head>
<body>
<input type="hidden" id="queryPdtManegeUrl" value="pdtManageList/queryPdt"/>
<input type="hidden" id="createtOrUpdatePdtUrl" value="pdtManageList/insertOrUpdatePdt"/>
<input type="hidden" id="deletePdtUrl" value="pdtManageList/deletePdt"/>
<input type="hidden" id="operateShellPdtUrl" value="pdtManageList/operateShellPdt"/>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>商品管理</a></li>
    <li class="active">商品列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-body" style="height: 540px">
            <div class="container">
                <form id="searchProductForm" name="searchProductForm" class="form-horizontal">
                    <div class="form-group" style="margin-top: 20px">
                        <div class="row">
                            <label class="control-label col-md-1 ">商品名称:</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm" name="search_pdtName"
                                       id="search_pdtName"
                                       oninput="checkInput()" placeholder="请输入商品名称"
                                       onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
                            </div>
                            <label class="control-label col-md-1">商品类别:</label>
                            <div class="col-md-3">
                                <select type="text" class="form-control  input-sm " id="search_pdtType"
                                        name="search_pdtType" onchange="checkInput()"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>

                            <div class="col-md-1 col-md-offset-1" style="color: white; ">
                                <button class="btn btn-primary " style="width: 80px;  text-align: left;" type="button"
                                        id="searchBtn" onclick="queryPdtBtn()">查&nbsp;询
                                    <span class="fa fa-search-plus fa-lg"></span>
                                </button>

                            </div>
                            <div class="col-md-2" style="padding-left: 110px;color: white;">
                                <button disabled class="btn btn-primary"
                                        style="width: 80px; background-color: grey; border-color: grey; text-align:left;"
                                        type="button" id="resetSearchBtn" onclick="resetPdtBtn()"> 重&nbsp;置
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog " role="document">
        <form class="form-horizontal" role="form" id="pdtForm" name="pdtForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" onclick="rightClose()"  data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">商品信息</h4>
                </div>
                <fieldset  id="fieldset" disabled>
                    <div class="modal-body">
                        <input type="hidden" class="form-control input-sm" name="pdtId" id="pdtId"/>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>商品名称:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="pdtName" id="pdtName"
                                       placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>商品类别:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="pdtType" id="pdtType"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>计量单位:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="measer" id="measer"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2"><span style="color:red">*</span>商品单价:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="unitPrice" id="unitPrice" type="text " placeholder="精确到年月日 "
                                       class="form-control  input-sm "/>
                                <span class="glyphicon glyphicon-jpy form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2 ">创建时间:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="createTime" id="createTime" type="text " placeholder="精确到年月日"
                                       class="form-control" onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-sm-2 ">修改时间:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="updateTime" id="updateTime" type="text " placeholder="精确到年月日"
                                       class="form-control"  onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                        </div>
                        <div class="form-group form-group-sm" style="padding-left: 18px">
                            <div class="col-sm-12 ">
                            <textarea class="form-control" name="picture" id="picture" style="resize:none;height: 60px;"
                                      rows="3" placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                        </div>
                        <div class="form-group form-group-sm" style="padding-left: 18px">
                            <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 40px;"
                                      rows="3" placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group form-group-sm">
                    <button id="savePdt" onclick="saveOrUpdateFun()" class="btn btn-primary  col-sm-1 col-sm-offset-4"
                    >保存
                    </button>
                    <button id="resetPdt" onclick="resetModelBtn()" class="btn btn-warning  col-sm-1  col-sm-offset-2 "
                    >重置
                    </button>
                    <button id="closePdt" onclick="rightClose()" data-dismiss="modal"
                            class="btn btn-primary  col-sm-4 col-sm-offset-4"
                    >关闭
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
</body>
<script>
    /*全局变量*/
    var pdtTypeList =${pdtTypeList};//商品类别
    var sysMenuList =${sysMenuList};//按钮列表
    var measureList=${measureList}; //计量单位
    /*-------下拉框 jsonArr 数据，valPro value ，textPro text，domid select的id*/
    function initSelectOptions(jsonArr, valPro, textPro, domid) {
        var opt = '';
        for (var i = 0; i < jsonArr.length; i++) {
            opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
        }
        $("#" + domid).append(opt);
    }

    /* -------------添加功能按钮start-------------*/
    var tempStr = "";
    for (var i = 0; i < sysMenuList.length; i++) {
        if (sysMenuList[i].dataCode == "add"
            || sysMenuList[i].dataCode == "update"
            || sysMenuList[i].dataCode == "delete"
            || sysMenuList[i].dataCode == "upShell"
            || sysMenuList[i].dataCode == "downShell"
            || sysMenuList[i].dataCode == "show"
            || sysMenuList[i].dataCode == "refresh"
        ) {
            tempStr += "<button id=\"btn_\""
                + sysMenuList[i].dataCode
                + " type=\"button\" class=\"btn btn-default\" onclick=\""
                + sysMenuList[i].functionName
                + "();\"><span  style=\"display:inline-block; color: deepskyblue; vertical-align:middle; margin-right:3px;\" " +
                "class=\"" + sysMenuList[i].cssIcon
                + "\" aria-hidden=\"true\"></span>"
                + sysMenuList[i].dataName
                + "</button>";
        }
    }
    $("#toolbar").html(tempStr);

    /*查询按钮*/
    function queryPdtBtn() {
        $('#tb_roles').bootstrapTable('refresh');
    }
    /*上架按鈕*/
    function upShellFun() {
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
            if(rowids[0].status==4){
                $.confirm({
                    title: '提示',
                    content: '您确认进行此操作吗？',
                    type: 'blue',
                    icon: 'glyphicon glyphicon-question-sign',
                    buttons: {
                        ok: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //确认按钮回调
                                upShellTask();
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

            }else{
                $.alert({
                    title: '提示',
                    content: '请只有待上架的商品允许此操作！',
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
            }
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
    function  upShellTask(){
        var rowids = $('#tb_roles').bootstrapTable('getSelections'); //获取所选中的行
        var pdtId=rowids[0].pdtId;
        var status=rowids[0].status;
        var upShellUrl=$("#operateShellPdtUrl").val();
            $.post(upShellUrl, rowids[0], function (data) {
            if (data || data == 'true') {
                $.alert({
                    title: '提示',
                    content: '上架成功！',
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
                    content: '上架失败,如有问题请联系管理员！',
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
    /*下架按鈕*/
    function downShellFun() {
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
            if(rowids[0].status==2){
                $.confirm({
                    title: '提示',
                    content: '您确认进行此操作吗？',
                    type: 'blue',
                    icon: 'glyphicon glyphicon-question-sign',
                    buttons: {
                        ok: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //确认按钮回调
                                downShellTask();
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

            }else{
                $.alert({
                    title: '提示',
                    content: '只有已上架的商品允许此操作！',
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
            }
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
    function  downShellTask(){
        var rowids = $('#tb_roles').bootstrapTable('getSelections'); //获取所选中的行
        var pdtId=rowids[0].pdtId;
        var status=rowids[0].status;
        var downShellUrl=$("#operateShellPdtUrl").val();
        $.post(downShellUrl, rowids[0], function (data) {
            if (data || data == 'true') {
                $.alert({
                    title: '提示',
                    content: '下架成功！',
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
                    content: '下架失败,如有问题请联系管理员！',
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
        var delUrl = $("#deletePdtUrl").val();
        var pdtId = "";
        if (rowId.length == 1) {
            pdtId = rowId[0].pdtId;
        }
        $.post(delUrl, {"pdtId": pdtId,"flag":"del"}, function (data) {
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
    /*新增按钮*/
    function addFun() {
        row = "";
        $('#myModal').modal('show');
        checkForm();
        $("#pdtForm").data('bootstrapValidator').resetForm();
        $('#pdtForm')[0].reset();
        $("#fieldset").removeAttr("disabled");
        $("#savePdt").attr("style", "display:block;");
        $("#resetPdt").attr("style", "display:block;");
        $("#closePdt").attr("style", "display:none;");
    }
    /*新增信息确认按钮*/
    function saveOrUpdateFun() {
        var bootstrapValidator = $("#pdtForm").data('bootstrapValidator');
        if (bootstrapValidator.validate().isValid()) {
            $("body").mLoading({
                text: "加载中，请稍候...",//加载文字，默认值:加载中...
                html: false,//设置加载内容是否是html格式，默认值是false
                content: "",//忽略icon和text的值，直接在加载框中显示此值
                mask: true//是否显示遮罩效果，默认显示
            })
            var createtOrUpdatePdtUrl = $("#createtOrUpdatePdtUrl").val();
            $.post(createtOrUpdatePdtUrl, $("#pdtForm").serialize(), function (data) {
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
                                    $("#pdtForm").data('bootstrapValidator').resetForm();
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
                        content: '商品已存在！',
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

    /*新增信息重置按钮*/
    function resetModelBtn() {
        if (row.empNo == null) {
            $("#pdtForm").data('bootstrapValidator').resetForm();
            $('#pdtForm')[0].reset();
            $("#pdtForm").data('bootstrapValidator').destroy();
            checkForm();
        } else {
            $('#myModal #empNo').val(row.empNo);
            $('#myModal #empName').val(row.empName);
            $('#myModal #password').val(row.password);
            $('#myModal #phone').val(row.phone);
            $('#myModal #roleId').val(row.roleId);
            $('#myModal #job').val(row.job);
            $('#myModal #mgr').val(row.mgr);
            $('#myModal #sex').val(row.sex);
            $('#myModal #birth').val(row.birth);
            $('#myModal #addr').val(row.addr);
            $('#myModal #sal').val(row.sal);
            $('#myModal #depNo').val(row.depNo);
            $('#myModal #doneTime').val(row.doneTime);
            $('#myModal #updateTime').val(row.updateTime);
            $('#myModal #remark').val(row.remark);
            $('#pdtForm').data('bootstrapValidator', null);
            checkForm();
        }
    }
    /*修改按钮*/
    var row = "";
    function updateFun() {
        var rowId = $('#tb_roles').bootstrapTable('getSelections'); //获取所选中的行
        if (rowId.length <= 0) {
            $.alert({
                title: '提示',
                content: '请选择一行数据修改！',
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
        } else if (rowId.length == 1) {
            $('#myModal #pdtId').val(rowId[0].pdtId);
            $('#myModal #pdtName').val(rowId[0].pdtName);
            $('#myModal #pdtType').val(rowId[0].pdtType);
            $('#myModal #unitPrice').val(rowId[0].unitPrice);
            $('#myModal #measer').val(rowId[0].measer);
            $('#myModal #createTime').val(rowId[0].createTime);
            $('#myModal #updateTime').val(rowId[0].updateTime);
            $('#myModal #picture').val(rowId[0].picture);
            $('#myModal #remark').val(rowId[0].remark);
            row = rowId[0];
            $('#myModal').modal('show');
            $("#fieldset").removeAttr("disabled");
            $("#savePdt").attr("style", "display:block;");
            $("#resetPdt").attr("style", "display:block;");
            $("#closePdt").attr("style", "display:none");
            checkForm();
            $("#pdtForm").data('bootstrapValidator').resetForm();
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

    /*查看按钮*/
    function showFun() {
        var rowId = $('#tb_roles').bootstrapTable('getSelections'); //获取所选中的行
        if (rowId.length <= 0) {
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
        } else if (rowId.length == 1) {
            $('#myModal #pdtId').val(rowId[0].pdtId);
            $('#myModal #pdtName').val(rowId[0].pdtName);
            $('#myModal #pdtType').val(rowId[0].pdtType);
            $('#myModal #unitPrice').val(rowId[0].unitPrice);
            $('#myModal #measer').val(rowId[0].measer);
            $('#myModal #createTime').val(rowId[0].createTime);
            $('#myModal #updateTime').val(rowId[0].updateTime);
            $('#myModal #picture').val(rowId[0].picture);
            $('#myModal #remark').val(rowId[0].remark);
            row = rowId[0];
            $('#myModal').modal('show');
            $("#fieldset").removeAttr("disabled");
            $("#savePdt").attr("style", "display:block;");
            $("#resetPdt").attr("style", "display:block;");
            $("#closePdt").attr("style", "display:none");
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

    /*表单验证*/
    function checkForm() {
        $("#pdtForm").bootstrapValidator({
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
                            message: '请填写选商品名称'
                        }
                    }
                },
                商品类别: {
                    validators: {
                        notEmpty: {
                            message: '请选择商品类别'
                        }
                    }
                },
                measer: {
                    validators: {
                        notEmpty: {
                            message: '请选择计量单位'
                        }
                    }
                },
                unitPrice: {
                    validators: {
                        notEmpty: {
                            message: '请填写商品单价'
                        }
                    }
                }
            }
        });
    }

    /*重置按钮*/
    function resetPdtBtn() {
        $("#searchProductForm")[0].reset();
        $('#searchProductForm').find('[name]').each(function () {
            $(this).val('');
        });
        $('#tb_roles').bootstrapTable('refresh');
        changeBtndisable();
    }

    /*刷新按钮*/
    function refreshFun() {
        $('#tb_roles').bootstrapTable('refresh');
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
        var searchProductForm = $('#searchProductForm').serializeArray();
        $.each(searchProductForm, function () {
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
        $("#pdtForm").data('bootstrapValidator').destroy();
        $('#pdtForm').data('bootstrapValidator', null);
    }

    /*---------bootstrapTable------start-----*/
    var index = '';
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
                queryParamsType: "und1efined",//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
                contentType: "application/x-www-form-urlencoded",
                queryParams: function queryParams(params) { //设置查询参数
                    var param = {
                        pageNo: params.pageNumber,
                        pageSize: params.pageSize,
                        orderBy: params.sortName,
                        orderType: params.sortOrder,
                        pdtName: $("#search_pdtName").val(), //名称
                        pdtType: $("#search_pdtType").val(), //名称
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
                uniqueId: "pdtId", //每一行的唯一标识，一般为主键列
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
                    title: '商品编号',
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
                    title: '商品类别code',
                    field: 'pdtType',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '商品类别',
                    field: 'pdtTypeDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '单价',
                    field: 'unitPrice',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '单位code',
                    field: 'measer',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '单位',
                    field: 'measerDes',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '描述',
                    field: 'picture',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                },{
                    title: '状态',
                    field: 'statusDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '创建时间',
                    field: 'createTime',
                    align: 'center',
                    valign: 'middle'
                },{
                    title: '状态',
                    field: 'status',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                },{
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
            });

        };
        return oTableInit;
    };

    $(function () {
        initSelectOptions(pdtTypeList, "dataCode", "codeName", "search_pdtType");//员工标识
        initSelectOptions(measureList, "dataCode", "codeName", "measer");//计量单位
        initSelectOptions(pdtTypeList, "dataCode", "codeName", "pdtType");//员工标识
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
        $("#click").click(function () {
            $('#myModal').modal('show')
        })
    })
</script>
</html>
