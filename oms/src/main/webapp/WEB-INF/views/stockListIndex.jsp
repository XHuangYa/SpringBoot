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
    <script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/static/bootstrap/css/bootstrap.min.css">
    <style>
        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
        }
    </style>
</head>
<body>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>库存管理</a></li>
    <li class="active">库存列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container-fluid">

                <form id="searchOrderForm" name="searchOrderForm" class="form-horizontal">
                    <div class="form-group  ">
                        <div class="row">
                            <label class="control-label col-md-1 ">商品名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_pdtName"
                                       id="search_pdtName" placeholder="请输入商品名称">
                            </div>
                            <label class="control-label col-md-1 ">商品类别:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_pdtType"
                                        name="search_pdtType">
                                    <option value="">商品类别</option>
                                    <option value="">普通管理员</option>
                                    <option value="">超级管理员</option>
                                </select>
                            </div>
                            <div class="col-md-1  col-md-offset-4 has-feedback " style="color: white">
                                <button class="btn btn-primary " style="width: 80px;  text-align: left;" type="button "
                                        id="searchBtn ">查&nbsp;询
                                </button>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                            <div class="col-md-1 has-feedback " style="color: white">
                                <button disabled class="btn btn-primary "
                                        style="width: 80px; background-color: grey; border-color: grey; text-align: left;"
                                        type="button " id="resetSearchBtn "> 重&nbsp;置
                                </button>
                                <span class="glyphicon glyphicon-repeat form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 查询框 end -->

</body>
</html>
