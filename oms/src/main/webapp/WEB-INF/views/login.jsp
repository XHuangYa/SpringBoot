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
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/assets/css/form-elements.css">
    <link rel="stylesheet" href="<%=basePath%>static/assets/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/jquery-confirm.css">
    <link rel="shortcut icon" href="<%=basePath%>static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="<%=basePath%>static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="<%=basePath%>static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="<%=basePath%>static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>static/assets/ico/apple-touch-icon-57-precomposed.png">
    <!--JS-->
    <script src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/assets/js/jquery.backstretch.min.js"></script>
    <script src="<%=basePath%>static/assets/js/retina-1.1.0.min.js"></script>
    <script src="<%=basePath%>static/assets/js/scripts.js"></script>
    <script src="<%=basePath%>static/assets/js/login.js?ver=1"></script>
    <script src="<%=basePath%>static/bootstrap/js/jquery-confirm.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>
</head>
<input type="hidden" id="loginUrl" value="login"/>
<input type="hidden" id="registUrl" value="regisOms"/>
<input type="hidden" id="rebackPwdUrl" value="rebackPwd"/>
<div class="top-content">
    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1 style="font-family:'bradley hand itc';font-size: 60px"><strong>Welcome</strong> to join us!</h1>
                    <div class="description">
                        <p>
                            There are the most delicious cake and drink!<strong>UNIQUE</strong> And best service! You
                            will have a great time!
                        </p>
                    </div>
                </div>
            </div>
            <!--登录-->
            <div class="login">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="tab">
                            <ul>
                                <li class="tab_login curColor ">登录</li>
                                <li class="tab_regist">注册</li>
                            </ul>
                        </div>

                        <div class="form-top">
                            <div class="form-top-left">
                                <div>
                                    <form>
                                        <input type="radio" name="radio" class="norrad"/>普通会员登录
                                        <input type="radio" name="radio" class="numrad" style="margin-left: 20px;"/>手机动态码登录
                                    </form>
                                </div>
                                <h3>Sign in to continue</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <form role="form" action="" method="post" id="loginForm">
                            <!--普通会员登录start-->
                            <div class="form-bottom">
                                <%-- <form role="form" action="" method="post" id="formOne">--%>
                                <div class="form-group">
                                    <label class="sr-only" for="empName">username</label>
                                    <input type="text" name="empName" id="empName" placeholder="请输入你的用户名"
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="password">username</label>
                                    <input type="text" name="password" id="password" placeholder="请输入你的密码"
                                           class="form-control">
                                </div>
                                <p class="forget">
                                    <a type="button" class="btn-link" id="reset"
                                       style="color: white; font-size: 25px;">
                                        Forget your password?
                                    </a>
                                </p>
                                <button type="button" class="btn   btn-warning btn-block" onclick="loginFun()">登录
                                </button>
                                <%-- </form>--%>
                            </div>
                            <!--普通会员登录end-->
                            <!--手机动态码登录start-->
                            <div class="phoneLog hide">
                                <%-- <form role="form" action="" method="post">--%>
                                <div class="form-group">
                                    <input type="text" name="phone" id="phone" placeholder="请输入你的手机号"
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" name="remark" id="remark" placeholder="请输入你的验证码">
                                        </div>
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <input type="button" id="getValidNum" class="btn btn-info"
                                                   style="margin-left:  50px;height: 45px;" value="获取验证码">
                                            <%--
                                                <button id="getValidNum"class="btn btn-warning" onclick="getValidNum()" >获取验证码</button>
                                            --%>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-warning btn-block" onclick="loginFun()">登录</button>
                                <%--  </form>--%>
                            </div>
                            <!--手机动态码登录end-->
                        </form>
                    </div>
                </div>
            </div>

            <!--注册-->
            <div class="regist  hide">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="tab">
                            <ul>
                                <li class="tab_login">登录</li>
                                <li class="tab_regist">注册</li>
                            </ul>
                        </div>
                        <div class="form-top">
                            <div class="form-top-left">
                                <div>
                                    <form>
                                        <input type="radio" name="radio" class="norregis"/>普通会员注册
                                        <input type="radio" name="radio" class="numregis" style="margin-left: 20px;"/>手机动态码注册
                                    </form>
                                </div>
                                <h3>Let's create your account</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <!--普通会员注册start-->
                        <form role="form" action="" method="post" id="regisForm">
                            <div class="normalRegis">
                                <div class="form-group">
                                    <label class="sr-only" for="empName">username</label>
                                    <input type="text" name="empName" id="regis_empName" placeholder="输入您的用户名"
                                           class="form-first-name form-control">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="password">password</label>
                                    <input type="text" name="password" id="regis_password"
                                           placeholder="请输入6位以上密码."
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only">newpassword</label>
                                    <input type="text" name="newPassword" id="regis_newPassword"
                                           placeholder="确认密码"
                                           class="form-control">
                                </div>
                                <button type="button" class="btn btn-warning btn-block" onclick="regisFun()">注册</button>
                                <%-- </form>--%>
                            </div>
                            <!--普通会员注册end-->
                            <!--手机动态码注册 start-->
                            <div class="phoneRegis hide">
                                <%-- <form role="form" action="" method="post">--%>
                                <div class="form-group">
                                    <label class="sr-only" for="phone">phone</label>
                                    <input type="text" name="phone" id="regis_phone" placeholder="输入您的手机号"
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" name="remark" id="regisremark" placeholder="请输入你的验证码">
                                        </div>
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <input type="button" id="getregisNum" class="btn btn-info"
                                                   style="margin-left:  50px;height: 45px;" value="获取验证码">
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-warning btn-block" onclick="regisFun()">注册</button>
                            </div>
                        </form>
                        <!--手机动态码注册 end-->
                    </div>
                </div>
            </div>
            <!--找回密码 start-->
            <div class="pwd  hide">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="tab">
                            <ul>
                                <li class="tab_repwd2">找回密码</li>
                                <li class="tab_login2">登录</li>
                                <li class="tab_regist2">注册</li>
                            </ul>
                        </div>
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3 style="margin-top: 15px;">Let's reset your password</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <!--start-->
                        <div class="pwdRegis" style="padding-top: 0px">
                            <form role="form" id="backPwdForm" action="" method="post">
                                <div class="form-group">
                                    <label class="sr-only" for="reback_phone">First name</label>
                                    <input type="text" name="phone" id="reback_phone" placeholder="输入您的手机号"
                                           class="form-control">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input type="text" name="validNum" id="validNum" placeholder="请输入你的验证码">
                                        </div>
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <input type="button" id="getrebackNum" class="btn btn-info"
                                                   style="margin-left:  50px;height: 45px;" value="获取验证码">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group" id="pwd1">
                                    <label class="sr-only" for="reback_password">repassword</label>
                                    <input type="text" name="firstPwd" id="reback_password" placeholder="请输入6位以上密码"
                                           class="form-control">
                                </div>
                                <div class="form-group" id="pwd2">
                                    <label class="sr-only" for="reback_newPassword">renewpassword</label>
                                    <input type="text" name="password" id="reback_newPassword"
                                           placeholder="确认密码"
                                           class="form-control">
                                </div>
                                <button type="button" class="btn btn-warning btn-block" onclick="reBackPwdFun()">确认</button>
                            </form>
                        </div>
                        <!-- end-->
                    </div>
                </div>
            </div>
            <!--找回密码 end-->
        </div>
    </div>
</div>
</body>
<script>
    /*登陆获取验证码*/
    $("#getValidNum").click(function () {
        var jsonData = $("#loginForm").serializeJSON();
        $.ajax({
            url: "<%=basePath%>/getValidNumber",
            type: "POST",
            dataType: "json",
            data: jsonData,
            success: function (data) {
                $("#getValidNum").val(data.responseText);
            },
            error: function (data) {
                alert(JSON.stringify(data.responseText));

            }
        });
    })
    /*注册获取验证码*/
    $("#getregisNum").click(function () {
        var jsonData = $("#regisForm").serializeJSON();
        $.ajax({
            url: "<%=basePath%>/getRegisValidNum",
            type: "POST",
            dataType: "json",
            data: jsonData,
            success: function (data) {
                $("#getregisNum").val(data.responseText);
            },
            error: function (data) {
                alert(JSON.stringify(data.responseText));

            }
        });
    })
    /*找回密码获取验证码*/
    $("#getrebackNum").click(function () {
        var jsonData = $("#backPwdForm").serializeJSON();
        $.ajax({
            url: "<%=basePath%>/pwdGetValidNum",
            type: "POST",
            dataType: "json",
            data: jsonData,
            success: function (data) {
                $("#getrebackNum").val(data.responseText);
            },
            error: function (data) {
                alert(JSON.stringify(data.responseText));

            }
        });
    })

    /*登陆*/
    function loginFun() {
        var loginUrl = $("#loginUrl").val();
        var flag = $("#loginForm").valid();
        if (flag) {
            $.ajax({
                type: 'post',
                data: $("#loginForm").serialize(),
                url: loginUrl,
                success: function (data) {
                    window.location.href = '<%=basePath%>welcome';
                },
                error: function (data) {
                    alert("登陆信息有误！");
                }
            });
        }
    }

    /*注册*/
    function regisFun() {
        var registUrl = $("#registUrl").val();
        var flag = $("#regisForm").valid();
        if (flag) {
            $.ajax({
                type: 'post',
                data: $("#regisForm").serialize(),
                url: registUrl,
                success: function (data) {
                    window.location.href = '<%=basePath%>oms';
                },
                error: function (data) {
                    alert("登陆信息有误！");
                }
            });
        }
    }

    /*找回密码*/
    function reBackPwdFun(){
        var rebackPwdUrl = $("#rebackPwdUrl").val();
        var flag = $("#backPwdForm").valid();
        if (flag) {
            $.ajax({
                type: 'post',
                data: $("#backPwdForm").serialize(),
                url: rebackPwdUrl,
                success: function (data) {
                    $.alert({
                        title: '提示',
                        content: '找回成功！',
                        type: 'green',				//一般危险操作用red,保存成功操作green
                        buttons: {				//定义按钮
                            confirm: {
                                text: '确认',
                                btnClass: 'btn-primary',
                                action: function () {	//这里写点击按钮回调函数
                                    window.location.href = '<%=basePath%>oms';
                                }
                            }
                        }
                    });
                },
                error: function (data) {
                    alert("米密码找回失败！");
                }
            });
        }
    }
    $(function () {
        $.validator.addMethod("regex", function (value, element, regexpr) {
            return regexpr.test(value);
        }, "Please enter a valid pasword.");

        /*找回密码验证*/
        $("#backPwdForm").validate({
            rules: {
                firstPwd: {
                    required: true,
                    minlength: 6,
                    regex: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/,
                },
                password: {
                    required: true,
                    minlength: 6,
                    regex: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/,
                    equalTo: "#reback_password"
                },
                phone: {
                    required: true,
                    minlength: 11,
                    regex: /^1[3,5,7,8]\d{9}$/,
                    remote: {
                        type: "POST",
                        url: "loginValidate",
                        data: {
                            phone: function () {
                                return $("#reback_phone").val();
                            }
                        }
                    }
                },
                validNum: {
                    required: true,
                    minlength: 6,
                    regex: /^\d+$|^\d+[.]?\d+$/,
                    remote: {
                        type: "POST",
                        url: "repwdValidateNum",
                        data: {
                            remark: function () {
                                return $("#validNum").val();
                            }
                        }
                    }
                }
            },
            messages: {
                firstPwd: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于6位",
                    regex: '密码必须是数字和字母组合',
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于6位",
                    regex: '密码必须是数字和字母组合',
                    equalTo: "两次输入的密码不一样"
                },
                phone: {
                    required: "请输入电话",
                    minlength: "电话长度不能小于11位",
                    regex: "手机号码格式不正确",
                    remote: "该手机号尚未注册"
                },
                validNum: {
                    required: "请输入验证码",
                    minlength: "验证码长度不能小于6位",
                    regex: "只能输入数字",
                    remote: "验证码不正确"
                }
            }
        });
        /*注册验证*/
        $("#regisForm").validate({
            rules: {
                empName: {
                    required: true,
                    minlength: 2,
                    regex: /^[a-zA-Z\u4e00-\u9fa5]+$/
                },
                password: {
                    required: true,
                    minlength: 6,
                    regex: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/,
                    remote: {
                        type: "POST",
                        url: "regisValidate",
                        data: {
                            empName: function () {
                                return $("#regis_empName").val();
                            },
                            password: function () {
                                return $("#regis_password").val();
                            }
                        }
                    }
                },
                newPassword: {
                    required: true,
                    minlength: 6,
                    regex: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/,
                    equalTo: "#regis_password"
                },
                phone: {
                    required: true,
                    minlength: 11,
                    regex: /^1[3,5,7,8]\d{9}$/,
                    remote: {
                        type: "POST",
                        url: "regisValidate",
                        data: {
                            phone: function () {
                                return $("#regis_phone").val();
                            }
                        }
                    }
                },
                remark: {
                    required: true,
                    minlength: 6,
                    regex: /^\d+$|^\d+[.]?\d+$/,
                    remote: {
                        type: "POST",
                        url: "validateRegisNum",
                        data: {
                            remark: function () {
                                return $("#regisremark").val();
                            }
                        }
                    }
                }
            },
            messages: {
                empName: {
                    required: "请输入用户名",
                    minlength: "请输入用户名长度不能小于 2 ",
                    regex: "禁止输入特殊字符"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于6位",
                    regex: '密码必须是数字和字母组合',
                    remote: "请更换用户名或密码"
                },
                newPassword: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于6位",
                    regex: '密码必须是数字和字母组合',
                    equalTo: "两次输入的密码不一样"
                },
                phone: {
                    required: "请输入电话",
                    minlength: "电话长度不能小于11位",
                    regex: "手机号码格式不正确",
                    remote: "该手机号已注册"
                },
                remark: {
                    required: "请输入验证码",
                    minlength: "验证码长度不能小于6位",
                    regex: "只能输入数字",
                    remote: "验证码不正确"
                }
            }
        });
        /*登陆验证*/
        $("#loginForm").validate({
            rules: {
                empName: {
                    required: true,
                    minlength: 2,
                    regex: /^[a-zA-Z\u4e00-\u9fa5]+$/
                },
                password: {
                    required: true,
                    minlength: 6,
                    regex: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/,
                    remote: {
                        type: "POST",
                        url: "loginValidate",
                        data: {
                            empName: function () {
                                return $("#empName").val();
                            },
                            password: function () {
                                return $("#password").val();
                            }
                        }
                    }
                },
                phone: {
                    required: true,
                    minlength: 11,
                    regex: /^1[3,5,7,8]\d{9}$/,
                    remote: {
                        type: "POST",
                        url: "loginValidate",
                        data: {
                            phone: function () {
                                return $("#phone").val();
                            }
                        }
                    }
                },
                remark: {
                    required: true,
                    minlength: 6,
                    regex: /^\d+$|^\d+[.]?\d+$/,
                    remote: {
                        type: "POST",
                        url: "validateNumber",
                        data: {
                            remark: function () {
                                return $("#remark").val();
                            }
                        }
                    }
                }
            },
            messages: {
                empName: {
                    required: "请输入用户名",
                    minlength: "请输入用户名长度不能小于 2 ",
                    regex: "禁止输入特殊字符"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于6位",
                    regex: '密码必须是数字和字母组合',
                    remote: "用户名或密码不正确"
                },
                phone: {
                    required: "请输入电话",
                    minlength: "电话长度不能小于11位",
                    regex: "手机号码格式不正确",
                    remote: "手机号码尚未注册"
                },
                remark: {
                    required: "请输入验证码",
                    minlength: "验证码长度不能小于6位",
                    regex: "只能输入数字",
                    remote: "验证码不正确"
                }
            }
        });
    });
</script>
</html>