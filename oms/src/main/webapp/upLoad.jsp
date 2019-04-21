<%--
  User: liting
  Date: 2019/4/10
  Time: 9:15 PM
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
</head>
<body>
<center>
    <form action="<%=basePath%>uploadFile" method="post" enctype="multipart/form-data">
        <table border="1">
            <tr>
                <td>文件</td>
                <td><input type="file" name="bigHeadImg"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="upload"></td>
            </tr>
        </table>
    </form>
</center>

</body>
</html>
