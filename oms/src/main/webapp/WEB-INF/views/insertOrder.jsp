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

        .modal-body {
            margin-right: 15px;
        }

        #kk {
            margin-top: 40px;
            height: 280px;
        }
    </style>


</head>

<body>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>订单管理</a></li>
    <li class="active">新增订单</li>
</ol>
<!-- 查询框 start -->
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
                                       id="pdtName" placeholder="商品名称">
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
            <div id="kk" style="width:1175px;">
                <div id="toolbar" class="btn-group"></div>
                <table id="tb_roles"></table>
            </div>
        </div>
    </div>
</div>
<!-- 查询框 end -->

</body>
</html>
