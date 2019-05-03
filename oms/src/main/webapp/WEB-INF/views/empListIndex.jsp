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
        }

        .row {
            margin-bottom: 10px;
        }

        .modal-dialog {
            width: 700px;
        }

        #kk {
            margin-top: 25px;
            height: 250px;
        }

    </style>
</head>
<body>
<input type="hidden" id="queryEmpManegeUrl" value="empManageListqueryEmp"/>
<input type="hidden" id="deleteEmpUrl" value="empManageListdeleteEmp"/>
<input type="hidden" id="createOrUpdateEmpUrl" value="empManageListinserOrUpdatetEmp"/>

<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>员工管理</a></li>
    <li class="active">员工列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px;">
    <div class="panel panel-default">
        <div class="panel-body" style="height: 540px">
            <div class="container-fluid">
                <form id="searchEmpForm" name="searchEmpForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">员工名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_empId" id="search_empId"
                                       placeholder="请输入客户名称" oninput="checkInput()">
                            </div>

                            <label class="control-label col-md-1 ">电话号码:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " id="search_empPhone"
                                       name="search_empPhone" placeholder="请输入电话号码" oninput="checkInput()">
                            </div>
                            <label class="control-label col-md-1">员工标识:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_roleId"
                                        name="search_roleId" onchange="checkInput()">
                                    <option value="">请选择用户级别</option>
                                </select>
                            </div>
                            <label class="control-label col-md-1 ">归属部门:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_dptId"
                                        name="search_dptId" onchange="checkInput()">
                                    <option value="">请选择归属部门</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group ">
                        <div class="row ">
                            <label class="control-label col-md-1 ">开始时间:</label>
                            <div class="col-md-3 has-feedback ">
                                <input name="beginTime" id="beginTime" class="form-control Wdate input-sm"
                                       onchange="checkInput()"
                                       placeholder="精确到年月日" type="text"
                                       onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01\'}',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-md-1 ">结束时间:</label>
                            <div class="col-md-3 has-feedback ">
                                <input id="endTime" name="endTime" class="form-control Wdate input-sm"
                                       type="text" placeholder="精确到年月日" onchange="checkInput()"
                                       onFocus="WdatePicker({minDate:'#F{$dp.$D(\'beginTime\')}',maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <div class="col-md-1 col-lg-offset-2   " style="color: white">
                                <button class="btn btn-primary " style="width: 70px;  text-align: left;" type="button"
                                        id="searchBtn" onclick="queryEmpBtn()">查&nbsp;询
                                    <span class="fa fa-search-plus fa-lg"></span>
                                </button>
                            </div>
                            <div class="col-md-1  " style="color: white">
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
<!--查询框 end-->
<!--模态框 start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick="rightClose()" type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">员工信息</h4>
                </div>
                <fieldset id="fieldset">
                    <div class="modal-body" style="margin-right: 30px">
                        <input type="hidden" class="form-control" name="empNo" id="empNo" placeholder="请输入..."/>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>员工名称:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="empName" id="empName"
                                       placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2">员工密码:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="password" id="password"
                                       placeholder="默认123456"/>
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>电话号码:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>员工标识:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="roleId" id="roleId"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>员工职位:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="job" id="job"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>上级领导:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="mgr" id="mgr"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">员工性别:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="sex" id="sex"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2">出生日期:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="birth" id="birth" type="text" placeholder="精确到年月日... "
                                       class="form-control  input-sm "
                                       onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">居住地址:</label>
                        </div>
                        <div class="form-group form-group-sm" style="padding-left: 10px">
                            <div class="col-sm-12">
                            <textarea class="form-control" name="addr" id="addr"
                                      style="resize:none; height: 50px;" rows="3"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>员工薪资:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="sal" id="sal" placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>归属部门:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="depNo" id="depNo"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2 ">存档时间:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="doneTime" id="doneTime" type="text " placeholder="精确年月日时分秒 "
                                       class="form-control"
                                       onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-sm-2 ">修改时间:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="updateTime" id="updateTime" type="text " placeholder="精确年月日时分秒 "
                                       class="form-control "
                                       onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                        </div>
                        <div class="form-group form-group-sm" style="padding-left: 10px">
                            <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none; height: 70px"
                                      rows="3" placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group form-group-sm">
                    <button id="saveEmp" onclick="saveOrUpdateFun()" class="btn btn-primary  col-sm-1 col-sm-offset-4"
                    >保存
                    </button>
                    <button id="resetEmp" onclick="resetModelBtn()" class="btn btn-warning  col-sm-1  col-sm-offset-2 "
                    >重置
                    </button>
                    <button id="closedEmp" onclick="rightClose()" data-dismiss="modal"
                            class="btn btn-primary  col-sm-4 col-sm-offset-4"
                    >关闭
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
<%--<!--模态框2 start-->
<div class="modal fade  bs-example-modal-sm " id="Modal" tabindex="-1" role="dialog"
     aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-sm" role="document" style="width: 400px">
        <form class="form-horizontal" role="form" id="emp" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header" style="height: 50px">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body" style="padding-right: 55px;:">
                    <div class="panel-body" style="height: 470px">
                        <div class="container-fluid">
                            <form id="searchEmpNameForm" name="searchEmpNameForm" class="form-horizontal">
                                <div class="form-group form-group-sm">
                                    <label class="control-label col-sm-4">员工名称:</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control input-sm" name="search_empName"
                                               id="search_empName"
                                               placeholder="请选择"/>
                                    </div>
                                    <div class="col-sm-2">
                                        <button class="btn btn-primary btn-sm"
                                                type="button"
                                                id="searchEmpBtn">查询
                                            <span class="fa fa-search-plus fa-lg"></span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="emps" style="width:350px;height: 235px;">
                            <table id="tb_roles2"></table>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button onclick="reuRenFun()" id="queren" class="btn btn-primary  col-sm-3 col-sm-offset-3   btn-sm"
                            style="width: 230px">
                        确认
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框2 end-->--%>
<%--
<button class="btn btn-danger" id="click">click</button>
--%>
</body>
<script>
    /*------------全局变量 start----------*/
    var deptTypeList =${deptTypeList}; //归属部门
    var roleTypeList =${roleTypeList}; //员工标识
    var JobList =${JobList}; //员工职位
    var sexList =${sexList};  //员工性别
    var mgrList =${mgrList}; //上级领导
    var sysMenuList =${sysMenuList};//按钮列表

    /*------------全局变量 end----------*/

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

    /* -------------加功能按钮end------------- */
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
        var searchEmpForm = $('#searchEmpForm').serializeArray();
        $.each(searchEmpForm, function () {
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
        $("#empForm").data('bootstrapValidator').destroy();
        $('#empForm').data('bootstrapValidator', null);
    }

    /*查询按钮*/
    function queryEmpBtn() {
        $('#tb_roles').bootstrapTable('refresh');
    }

    /*重置按钮*/
    function resetEmpBtn() {
        $("#searchEmpForm")[0].reset();
        $('#searchEmpForm').find('[name]').each(function () {
            $(this).val('');
        });
        $('#tb_roles').bootstrapTable('refresh');
        changeBtndisable();
    }

    /*刷新按钮*/
    function refreshFun() {
        $('#tb_roles').bootstrapTable('refresh');
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
        var delUrl = $("#deleteEmpUrl").val();
        var empNo = "";
        if (rowId.length == 1) {
            empNo = rowId[0].empNo;
        }
        $.post(delUrl, {"empNo": empNo}, function (data) {
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
        $("#empForm").data('bootstrapValidator').resetForm();
        $('#empForm')[0].reset();
        $("#fieldset").removeAttr("disabled");
        $("#saveEmp").attr("style", "display:block;");
        $("#resetEmp").attr("style", "display:block;");
        $("#closedEmp").attr("style", "display:none");
    }

    /*新增信息确认按钮*/
    function saveOrUpdateFun() {
        var bootstrapValidator = $("#empForm").data('bootstrapValidator');
        if (bootstrapValidator.validate().isValid()) {
            $("body").mLoading({
                text: "加载中，请稍候...",//加载文字，默认值:加载中...
                html: false,//设置加载内容是否是html格式，默认值是false
                content: "",//忽略icon和text的值，直接在加载框中显示此值
                mask: true//是否显示遮罩效果，默认显示
            })
            var createOrUpdateEmpUrl = $("#createOrUpdateEmpUrl").val();
            $.post(createOrUpdateEmpUrl, $("#empForm").serialize(), function (data) {
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
                                    $("#empForm").data('bootstrapValidator').resetForm();
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

    /*新增信息重置按钮*/
    function resetModelBtn() {
        if (row.empNo == null) {
            $("#empForm").data('bootstrapValidator').resetForm();
            $('#empForm')[0].reset();
            $("#empForm").data('bootstrapValidator').destroy();
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
            $('#empForm').data('bootstrapValidator', null);
            checkForm();
        }
    }

    /*表单验证*/
    function checkForm() {
        $("#empForm").bootstrapValidator({
            message: '不可用的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                empName: {
                    validators: {
                        notEmpty: {
                            message: '请填写选员工名称'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '请填写电话号码'
                        }
                    }
                },
                roleId: {
                    validators: {
                        notEmpty: {
                            message: '请选择员工标识'
                        }
                    }
                },
                job: {
                    validators: {
                        notEmpty: {
                            message: '请选择员工职位'
                        }
                    }
                },
                mgr: {
                    validators: {
                        notEmpty: {
                            message: '请选择上级领导'
                        }
                    }
                },
                sal: {
                    validators: {
                        notEmpty: {
                            message: '请填写员工薪资'
                        }
                    }
                },
                depNo: {
                    validators: {
                        notEmpty: {
                            message: '请选择归属部门'
                        }
                    }
                }

            }
        });
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
            $('#myModal #empNo').val(rowId[0].empNo);
            $('#myModal #empName').val(rowId[0].empName);
            $('#myModal #password').val(rowId[0].password);
            $('#myModal #phone').val(rowId[0].phone);
            $('#myModal #roleId').val(rowId[0].roleId);
            $('#myModal #job').val(rowId[0].job);
            $('#myModal #mgr').val(rowId[0].mgr);
            $('#myModal #sex').val(rowId[0].sex);
            $('#myModal #birth').val(rowId[0].birth);
            $('#myModal #addr').val(rowId[0].addr);
            $('#myModal #sal').val(rowId[0].sal);
            $('#myModal #depNo').val(rowId[0].depNo);
            $('#myModal #doneTime').val(rowId[0].doneTime);
            $('#myModal #updateTime').val(rowId[0].updateTime);
            $('#myModal #remark').val(rowId[0].remark);
            row = rowId[0];
            $('#myModal').modal('show');
            $("#fieldset").removeAttr("disabled");
            $("#saveEmp").attr("style", "display:block;");
            $("#resetEmp").attr("style", "display:block;");
            $("#closedEmp").attr("style", "display:none");
            checkForm();
            $("#empForm").data('bootstrapValidator').resetForm();
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
            $('#myModal #empNo').val(rowId[0].empNo);
            $('#myModal #empName').val(rowId[0].empName);
            $('#myModal #password').val(rowId[0].password);
            $('#myModal #phone').val(rowId[0].phone);
            $('#myModal #roleId').val(rowId[0].roleId);
            $('#myModal #job').val(rowId[0].job);
            $('#myModal #mgr').val(rowId[0].mgr);
            $('#myModal #sex').val(rowId[0].sex);
            $('#myModal #birth').val(rowId[0].birth);
            $('#myModal #addr').val(rowId[0].addr);
            $('#myModal #sal').val(rowId[0].sal);
            $('#myModal #depNo').val(rowId[0].depNo);
            $('#myModal #doneTime').val(rowId[0].doneTime);
            $('#myModal #updateTime').val(rowId[0].updateTime);
            $('#myModal #remark').val(rowId[0].remark);
            $('#myModal').modal('show');
            $("#fieldset").attr("disabled", "true");
            $("#saveEmp").attr("style", "display:none;");
            $("#resetEmp").attr("style", "display:none;");
            $("#closedEmp").attr("style", "display:block");

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

    /*---------bootstrapTable------start-----*/
    var index = '';
    var TableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryEmpManegeUrl").val();
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
                        empName: $("#search_empId").val(), //员工名称
                        phone: $("#search_empPhone").val(),//电话号码
                        roleId: $("#search_roleId").val(),//员工标识
                        depNo: $("#search_dptId").val(),//归属部门
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
                    title: '员工编号',
                    field: 'empNo',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '员工名称',
                    field: 'empName',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '登陆密码',
                    field: 'password',
                    align: 'center',
                    valign: 'middle',
                    editable: {
                        type: 'text',
                        title: '修改密码',
                        validate: function (v) {
                            if (!v) return '登陆密码不能为空';
                            if (/(^\s+)|(\s+$)/g.test(v)) {
                                return '登陆密码不不能输入空格!';
                            }

                        }
                    }
                }, {
                    title: '联系方式',
                    field: 'phone',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '员工级别',
                    field: 'roleDes',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '员工编号',
                    field: 'roleId',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '员工职位',
                    field: 'jobDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '职位编号',
                    field: 'job',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '上级领导',
                    field: 'mgrDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '上级编号',
                    field: 'mgr',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '性别',
                    field: 'sexDes',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '性别',
                    field: 'sex',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '出生日期',
                    field: 'birth',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '薪资',
                    field: 'sal',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '住址',
                    field: 'addr',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '归属部门',
                    field: 'depDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '部门id',
                    field: 'depNo',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }, {
                    title: '存档时间',
                    field: 'doneTime',
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
                    visible: false
                }],
                onEditableSave: function (field, row, oldValue, $el) {
                    var createOrUpdateEmpUrl = $("#createOrUpdateEmpUrl").val();
                    $.ajax({
                        type: "post",
                        url: createOrUpdateEmpUrl,
                        data: row,
                        dataType: 'JSON',
                        success: function (data, status) {
                            console.info(date = +"----" + status);
                            if (status == "success") {
                                $.alert({
                                    title: '提示',
                                    content: '密码修改成功！',
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
                                content: '密码修改失败！',
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
        //下拉框
        initSelectOptions(roleTypeList, "dataCode", "codeName", "search_roleId");//员工标识
        initSelectOptions(deptTypeList, "dataCode", "codeName", "search_dptId");//部门标识
        //模态框下拉框
        initSelectOptions(roleTypeList, "dataCode", "codeName", "roleId");//员工标识
        initSelectOptions(deptTypeList, "dataCode", "codeName", "depNo");//部门标识
        initSelectOptions(JobList, "dataCode", "codeName", "job");//员工职位
        initSelectOptions(sexList, "dataCode", "codeName", "sex");//员工性别
        initSelectOptions(mgrList, "empNo", "empName", "mgr");//上级领导
        //初始化table
        var oTable = new TableInit();
        oTable.Init();

    })

</script>
</html>
