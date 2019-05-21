<%--
  User: liting
  Date: 2019/5/17
  Time: 1:54 PM
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
    <title>welcome</title>
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
    <link rel="stylesheet" href="<%=basePath%>static/css/menu.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .bg {
            background: url(static/assets/img/backgrounds/2.jpg) no-repeat center center;
            background-size: 50% 50%;
        }
    </style>
</head>
<body>
<div style="height: 710px;" class="bg">

</div>
</body>
</html>
