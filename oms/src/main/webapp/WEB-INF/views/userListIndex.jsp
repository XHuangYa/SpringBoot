<%--
  User: liting
  Date: 2019/3/31
  Time: 9:01 PM
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
    <title>user</title>
    <script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
userListIndex.jsp
</body>
</html>
