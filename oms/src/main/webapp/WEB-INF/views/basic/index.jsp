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

		<link rel="shortcut icon" href="<%=basePath%>static/assets/ico/favicon.png">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>static/assets/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>static/assets/ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>static/assets/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="<%=basePath%>static/assets/ico/apple-touch-icon-57-precomposed.png">
		<!--JS-->
		<script src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js"></script>
		<script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>static/assets/js/jquery.backstretch.min.js"></script>
		<script src="<%=basePath%>static/assets/js/retina-1.1.0.min.js"></script>
		<script src="<%=basePath%>static/assets/js/scripts.js"></script>
		<script src="<%=basePath%>static/assets/js/login.js"></script>
		<script src="<%=basePath%>static/http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
		<script src="<%=basePath%>static/http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

	</head>
	<script type="text/javascript">
		$(function() {
			$("#form1").validate({
				rules: {
					username: {
						required: true,
						minlength: 2,
					},
					pasword: {
						required: true,
						minlength: 6,
					}
				},
				messages: {
					username: {
						required: "请输入用户名",
						minlength: "请输入用户名长度不能小于 2 个字母符",
					},
					loginpwd2: {
						required: "请输入密码",
						minlength: "密码长度不能小于 6 个字母",
				}
			}
				});
		});
	</script>
	<body>

		<div class="top-content">
			<div class="inner-bg">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2 text">
							<h1 style="font-family:'bradley hand itc';font-size: 60px"><strong>Welcome</strong> to join us!</h1>
							<div class="description">
								<p>
									There are the most delicious cake and drink!<strong>UNIQUE</strong> And best service! You will have a great time!
								</p>
							</div>
						</div>
					</div>
					<!--登录-->
					<div class="login ">
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
												<input type="radio" name="radio" class="norrad" />普通会员登录
												<input type="radio" name="radio" class="numrad" style="margin-left: 20px;" />手机动态码登录
											</form>
										</div>
										<h3>Sign in to continue</h3>
									</div>
									<div class="form-top-right">
										<i class="fa fa-pencil"></i>
									</div>
								</div>
								<!--普通会员登录start-->
								<div class="form-bottom">
									<form role="form" action="" method="post" class="registration-form" id="form1">
										<div class="form-group">
											<label class="sr-only" for="form-first-name">First name</label>
											<input type="text" name="username" placeholder="请输入你的用户名" class="form-control" >
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-last-name">Last name</label>
											<input type="text" name="pasword" placeholder="请输入你的密码" class="form-control " >
										</div>
										<p class="forget">
											<button class="btn-link" id="reset" style="color: white; font-size: 25px; ">Forget your password?</button>
										</p>
										<button type="button" class="btn   btn-warning btn-block">登录</button>
									</form>
								</div>
								<!--普通会员登录end-->
								<!--手机动态码登录start-->
								<div class="phoneLog hide">
									<form role="form" action="" method="post" class="registration-form" >
										<div class="form-group">
											<label class="sr-only" for="form-first-name">First name</label>
											<input type="text" name="phone" placeholder="请输入你的手机号" class="form-control" >
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-last-name">Last name</label>
											<input type="text" name="numer" placeholder="请输入你的验证码" class="" >
											<button class="btn btn-warning" style="margin-left: 130px;">获取验证码</button>
										</div>
										<button type="button" class="btn btn-warning btn-block">登录</button>
									</form>
								</div>
								<!--手机动态码登录end-->
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
												<input type="radio" name="radio" class="norregis" />普通会员注册
												<input type="radio" name="radio" class="numregis" style="margin-left: 20px;" />手机动态码注册
											</form>
										</div>
										<h3>Let's create your account</h3>
									</div>
									<div class="form-top-right">
										<i class="fa fa-pencil"></i>
									</div>
								</div>
								<!--普通会员注册start-->
								<div class="normalRegis">
									<form role="form" action="" method="post" class="registration-form">
										<div class="form-group">
											<label class="sr-only" for="form-first-name">First name</label>
											<input type="text" name="form-first-name" placeholder="输入您的用户名" class="form-first-name form-control" >
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-email">password</label>
											<input type="text" name="form-email" placeholder="请输入6位以上验证码." class="form-email form-control" >
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-email">password</label>
											<input type="text" name="form-email" placeholder="确认密码" class="form-email form-control" >
										</div>
										<button type="submit" class="btn btn-warning btn-block">注册</button>
									</form>
								</div>
								<!--普通会员注册end-->
								<!--手机动态码注册 start-->
								<div class="phoneRegis hide">
									<form role="form" action="" method="post" class="registration-form">
										<div class="form-group">
											<label class="sr-only" for="form-first-name">First name</label>
											<input type="text" name="form-first-name" placeholder="输入您的手机号" class="form-first-name form-control" >
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-last-name">Last name</label>
											<input type="text" name="form-last-name" placeholder="输入短信验证码" class="form-last-name " >
											<button class="btn btn-warning" style="margin-left: 130px;">获取验证码</button>
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-email">password</label>
											<input type="text" name="form-email" placeholder="请输入6位以上验证码." class="form-email form-control" >
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-email">password</label>
											<input type="text" name="form-email" placeholder="确认密码" class="form-email form-control" >
										</div>
										<button type="submit" class="btn btn-warning btn-block">注册</button>
									</form>
								</div>
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
										<h3>Let's reset your password</h3>
									</div>
									<div class="form-top-right">
										<i class="fa fa-pencil"></i>
									</div>
								</div>
								<!--start-->
								<div class="pwdRegis ">
									<form role="form" action="" method="post" class="registration-form">
										<div class="form-group">
											<label class="sr-only" for="form-first-name">First name</label>
											<input type="text" name="form-first-name" placeholder="输入您的手机号" class="form-first-name form-control" id="form-first-name">
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-last-name">Last name</label>
											<input type="text" name="form-last-name" placeholder="输入短信验证码" class="form-last-name " id="form-last-name">
											<button class="btn btn-warning" style="margin-left: 130px;">获取验证码</button>
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-email">password</label>
											<input type="text" name="form-email" placeholder="请输入6位以上验证码." class="form-email form-control" id="form-email">
										</div>
										<div class="form-group">
											<label class="sr-only">password</label>
											<input type="text" name="form-email" placeholder="确认密码" class="form-email form-control" >
										</div>
										<button type="submit" class="btn btn-warning btn-block">确认</button>
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

</html>