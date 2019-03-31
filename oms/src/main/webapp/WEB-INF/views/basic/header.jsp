<%--
  User: liting
  Date: 2019/3/26
  Time: 9:35 PM
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
    <title>header</title>
    <script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/static/bootstrap/css/bootstrap.min.css">
    <style>
        .ha:hover{
            text-decoration: none;
            color: darkgrey;
        }
        .ha:visited{
            text-decoration: none;
            color: white;
        }
        .ha{
            color: white;
        }
        .hna{
            color: white;
        }
        .hd1{
            font-size: 24px;
        }
        .hd2{
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container-fluid hna">
    <div class="row">
        <div class="col-md-8 glyphicon glyphicon-bell hd1">&nbsp;UNIQUE&烘焙店后台管理系统</div>
        <div class="col-md-2 glyphicon glyphicon-earphone hd2">&nbsp;13467856890</div>
        <div class="col-md-2">
            <span class="dropdown ">
                <a  role="button" class="dropdown-toggle ha" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i> &nbsp;Jack Smith
                    <i class="caret"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a tabindex="-1" href="#">个人信息</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1"  href="#">修改密码</a></li>
                    <li class="divider "></li>
                    <li><a tabindex="-1" href="sign-in.html">登陆</a></li>
                     <li class="divider "></li>
                    <li><a tabindex="-1" href="sign-in.html">登出</a></li>
                </ul>
          </span>
        </div>
    </div>
</div>




    <%--<div role="navigation" class="navbar navbar-inverse">
        <h3 class="navbar-text " style="color: white;font-family: 'Arial Hebrew'"><span class="glyphicon glyphicon-bell">&nbsp;&nbsp;</span>Unique烘焙店后台管理系统</h3>
        <div class="container-fluid">
            <div class="collapse navbar-collapse hd1" id="bs-example-navbar-collapse-1">
                &lt;%&ndash;下拉框statrt&ndash;%&gt;
                <div class="navd navbar-nav navbar-right ">
                    <span class="glyphicon glyphicon-earphone hs1">13467856890</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="dropdown ">
                    <a  role="button" class="dropdown-toggle ha" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-user"></i> Jack Smith
                        <i class="caret"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="#">个人信息</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1"  href="#">修改密码</a></li>
                        <li class="divider "></li>
                        <li><a tabindex="-1" href="sign-in.html">登陆</a></li>
                         <li class="divider "></li>
                        <li><a tabindex="-1" href="sign-in.html">登出</a></li>
                    </ul>
                    </span>
                </div>
                &lt;%&ndash;下拉框end&ndash;%&gt;
            </div>
        </div>--%>
    </div>
</body>
</html>
