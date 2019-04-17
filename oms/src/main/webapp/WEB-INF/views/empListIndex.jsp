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
    <%--css--%>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/jquery-confirm.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table-group.css">

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
<input type="hidden" id="queryEmpManege" value="/empManageListqueryEmp"/>

<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>员工管理</a></li>
    <li class="active">员工列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body" style="height: 540px">
            <div class="container-fluid">
                <form id="searchEmpForm" name="searchEmpForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">员工名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_empId" id="search_empId"
                                       placeholder="请输入客户名称">
                            </div>

                            <label class="control-label col-md-1 ">电话号码:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " id="search_empPhone"
                                       name="search_empPhone" placeholder="请输入电话号码">
                            </div>
                            <label class="control-label col-md-1 ">员工标识:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_roleId"
                                        name="search_roleId">
                                    <option value="">请选择用户级别</option>
                                </select>
                            </div>
                            <label class="control-label col-md-1 ">归属部门:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_dptId"
                                        name="search_dptId">
                                    <option value="">请选择归属部门</option>
                                    <option value="">普通管理员</option>
                                    <option value="">超级管理员</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group ">
                        <div class="row ">
                            <label class="control-label col-md-1 ">开始时间:</label>
                            <div class="col-md-3 has-feedback ">
                                <input name="beginTime " id="search_beginTime " type="text " placeholder="精确到年月日时分秒 "
                                       class="form-control Wdate input-sm "/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-md-1 ">结束时间:</label>
                            <div class="col-md-3 has-feedback ">
                                <input name="endTime " id="search_endTime " type="text " placeholder="精确到年月日时分秒 "
                                       class="form-control Wdate input-sm "/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <div class="col-md-1 col-lg-offset-2   has-feedback " style="color: white">
                                <button class="btn btn-primary " style="width: 70px;  text-align: left;" type="button "
                                        id="searchBtn ">查&nbsp;询
                                </button>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                            <div class="col-md-1 has-feedback " style="color: white">
                                <button disabled class="btn btn-primary "
                                        style="width: 70px; background-color: grey; border-color: grey; text-align: left;"
                                        type="button " id="resetSearchBtn "> 重&nbsp;置
                                </button>
                                <span class="glyphicon glyphicon-repeat form-control-feedback"></span>
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2"><span>*</span>员工编号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control input-sm" name="empId" id="empId"
                                   placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 ">员工名称:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empName" id="empName" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">电话号码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empPhone" id="empPhone" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 "><span>*</span>员工标识:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="roleId" id="roleId"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">员工职位:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="emoJob" id="emoJob"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                        <label class="control-label col-sm-2 ">上级领导:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="empMgr" id="empMgr"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">员工性别:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2">出生日期:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="empBirth " id="empBirth " type="text " placeholder="精确到年月日... "
                                   class="form-control  input-sm "/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">居住地址:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12">
                            <textarea class="form-control" name="address" id="address"
                                      style="resize:none; height: 50px;" rows="3"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">员工薪资:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empsal" id="empsal" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 ">归属部门:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="deptId"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">存档时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="doneTime " id="doneTime " type="text " placeholder="精确年月日时分秒 "
                                   class="form-control"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                        </div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="updateTime " id="updateTime " type="text " placeholder="精确年月日时分秒 "
                                   class="form-control "/>
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
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-1 col-sm-offset-4   " style="width: 80px">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-1  col-sm-offset-2 " style="width: 80px">重置
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!--模态框 end-->
</div>
<%--
<button class="btn btn-danger" id="click">click</button>
--%>
</body>
<script>
    /*------------全局变量 start----------*/
    var deptTypeList =${deptTypeList}; //归属部门
    var roleTypeList =${roleTypeList}; //员工标识
    var JobList =${JobList}; //员工职位
    var MgrList =${MgrList}; //上级领导
    var sysMenuList=${sysMenuList};//按钮列表
    var emp =${emp};
    console.info(emp.birth + "----roleTypeList");
    /*------------全局变量 end----------*/

    /*-------下拉框 jsonArr 数据，valPro value ，textPro text，domid select的id*/
    function initSelectOptions(jsonArr, valPro, textPro, domid) {
        var opt = '';
        for (var i = 0; i < jsonArr.length; i++) {
            opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
        }
        $("#" + domid).append(opt);
    }
    /* ===========添加功能按钮start============== */
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
                + "();\"><span style=\"display:inline-block; vertical-align:middle; margin-right:3px;\" "
                +"\" aria-hidden=\"true\"></span>"
                + sysMenuList[i].dataName
                + "</button>";
        }
    }
    $("#toolbar").html(tempStr);
    /* ===========添加功能按钮end============== */
    /*---------bootstrapTable------start-----*/
    var index = '';
    var TableInit = function () {
        var oTableInit = new Object();
        var urlStr = $("#queryEmpManege").val();
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
                        depno: $("#search_dptId").val(),//归属部门
                        beginTime: $("#search_beginTime").val(),//开始时间
                        endTime: $("#search_endTime").val(),//结束时间
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
                uniqueId: "planid", //每一行的唯一标识，一般为主键列
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
                    visible: false
                }, {
                    title: '联系方式',
                    field: 'phone',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '员工级别',
                    field: 'roleDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '员工职位',
                    field: 'job',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '上级领导',
                    field: 'mgrDes',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '性别',
                    field: 'sexDes',
                    align: 'center',
                    valign:'middle'
                },{
                    title: '出生日期',
                    field: 'birth',
                    align: 'center',
                    valign:'middle'
                }
            , {
                    title: '薪资',
                    field: 'sal',
                    align: 'center',
                    valign:'middle'
                }
                , {
                    title: '住址',
                    field: 'addr',
                    align: 'center',
                    valign:'middle'
                }
                , {
                    title: '归属部门',
                    field: 'depDes',
                    align: 'center',
                    valign: 'middle'
                }
                , {
                    title: '存档时间',
                    field: 'doneTime',
                    align: 'center',
                    valign: 'middle'
                }
                , {
                    title: '状态',
                    field: 'status',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }
                , {
                    title: '修改时间',
                    field: 'updateTime',
                    align: 'center',
                    valign: 'middle',
                    visible: false
                }
                , {
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
        //下拉框
        initSelectOptions(roleTypeList, "dataCode", "codeName", "search_roleId");
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
        $("#click").click(function () {
            $('#myModal').modal('show')
        })
    })

</script>
</html>
