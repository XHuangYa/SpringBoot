$(function() {
	/*登录注册按钮 start*/

	$(".tab_login").click(function() {
		$(".regist").addClass("hide");
		$(".login").removeClass("hide");
		$(this).addClass("curColor");
		$(".tab_regist").removeClass("curColor");
	});

	$(".tab_regist").click(function() {
		$(".regist").removeClass("hide")
		$(".login").addClass("hide");
		$(this).addClass("curColor");
		$(".tab_login").removeClass("curColor");
	});
	/*登录注册按钮 end*/
	/*登录——单选框选择start*/
	$(".norrad").click(function() {
		$(".phoneLog").addClass("hide");
		$(".form-bottom").removeClass("hide");
	});
	$(".numrad").click(function() {
		$(".form-bottom").addClass("hide");
		$(".phoneLog").removeClass("hide");
	});

	/*登录——单选框选择end*/
	/*注册——单选框选择start*/
	$(".norregis").click(function() {
		$(".phoneRegis").addClass("hide");
		$(".normalRegis").removeClass("hide");
	});
	$(".numregis").click(function() {
		$(".normalRegis").addClass("hide");
		$(".phoneRegis").removeClass("hide");
	});

	/*注册——单选框选择end*/
	/*找回密码 start*/
	$("#reset").click(function() {
		$(".regist").addClass("hide");
		$(".login").addClass("hide");
		$(".pwd").removeClass("hide");
	});
	$(".tab_login2").click(function() {
		$(".regist").addClass("hide");
		$(".login").removeClass("hide");
		$("tab_login").addClass("curColor");
		$(".pwd").addClass("hide");
	});
	$(".tab_regist2").click(function() {
		$(".login").addClass("hide");
		$(".regist").removeClass("hide");
		$("tab_regist").addClass("curColor");
		$(".pwd").addClass("hide");
	});
	/*找回密码 end*/
})
