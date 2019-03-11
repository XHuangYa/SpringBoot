<%--
  User: liting
  Date: 2019/2/22
  Time: 14:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Title</title>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>

</head>
<script type="text/javascript">
    $(function () {
        $("#validate").click(function () {
            var jsonData=$("#form1").serializeJSON();
            //将json转为可读json格式字符串
            JSON.stringify(jsonData);
            console.info(JSON.stringify(jsonData));
            $.ajax({
                url:"<%=basePath%>number",
                type:"POST",
                dataType:"json",
                data:jsonData,
                success:　function(data){
                    alert(JSON.stringify(data.responseText));
                },
                error:　function(data){
                   alert(JSON.stringify(data.responseText));
                   $("#validate").val(data.responseText);

                }
            });
        });

        $("#regist").click(function () {
            var jsonData=$("#form1").serializeJSON();
            //将json转为可读json格式字符串
            JSON.stringify(jsonData);
            console.info(JSON.stringify(jsonData));
            $.ajax({
                url:"<%=basePath%>regist",
                type:"POST",
                dataType:"json",
                data:jsonData
            });
        });
    });
</script>
<body>
<form id="form1" action=" ">
    <table border="1px" width="300px" text-align="center">
        <tr>
            <td>手机号</td>
            <td colspan="2"><input type="text"  name="phone" placeholder="手机号"></td>
        </tr>
        <tr>
            <td>验证码</td>
            <td><input type="text" name="number" placeholder="验证码"></td>
            <td><input type="button" id="validate" value="获取验证码"></td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="button" value="注册" id="regist">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>
</body>


</html>
