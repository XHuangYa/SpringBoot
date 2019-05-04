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
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2"><span>*</span>商品名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" name="pdtName" id="pdtName"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">商品编号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="pdtId" id="pdtId" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 ">商品类别:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="pdtType" id="pdtType"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">计量单位:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="measer" id="measer" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2">商品单价:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="unit_price " id="unit_price " type="text " placeholder="精确到年月日 "
                                   class="form-control  input-sm "/>
                            <span class="glyphicon glyphicon-jpy form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">创建时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="doneTime " id="doneTime " type="text " placeholder="精确到年月日时分秒 "
                                   class="form-control"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                        </div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="updateTime " id="updateTime " type="text " placeholder="精确到年月日时分秒 "
                                   class="form-control "/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 18px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 60px;"
                                      rows="3" placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-1 col-sm-offset-4   ">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-1  col-sm-offset-2  ">重置</button>
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

    /*重置按钮*/
    function resetPdtBtn() {
        $("#searchProductForm")[0].reset();
        $('#searchProductForm').find('[name]').each(function () {
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
        $("#empForm").data('bootstrapValidator').destroy();
        $('#empForm').data('bootstrapValidator', null);
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
                },{
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
                }, {
                    title: '创建时间',
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
            });

        };
        return oTableInit;
    };

    $(function () {
        initSelectOptions(pdtTypeList, "dataCode", "codeName", "search_pdtType");//员工标识
        //初始化table
        var oTable = new TableInit();
        oTable.Init();
        $("#click").click(function () {
            $('#myModal').modal('show')
        })
    })
</script>
</html>
