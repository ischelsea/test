<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员注册页面</title>
<%@ include file="WEB-INF/base.jsp" %>
<script type="text/javascript" src="static/script/regesit.js"></script>
<script type="text/javascript">
	$(function(){
		//注册按钮
		$("#sub_btn").click(function(){
			//验证用户名是否合法（用户名只能是字母、数字、_[4-12]）
			//获取用户名的数据
			
				var uname = $("#username").val();
				//定义用户名正则表达式
				var unameReg = /^(\w|[\u4e00-\u9fa5]){2,6}$/;
				if(unameReg.test(uname) == false){
					alert("用户名不合法，请重新输入！用户名只能是字母、数字、_、汉字[2-12]");
					//取消默认行为
					return false;
				}
			
			
				//验证用户密码
				var passwd = $("#password").val();
				var passwdReg = /^\w{6}$/;
				if(passwdReg.test(passwd)==false){
					alert("密码格式不正确，长度为6位的英文字符");
					return false;
				}
			
			
				//确认密码
				var checkpsswd=$("#repwd").val();
				if(passwd !=checkpsswd){
					alert("两次输入密码不符！");
					return false;
				}
			
			
			
				//使用正则验证邮箱
				//取邮箱值
				var email = $("#email").val();
				//定义正则验证邮箱 13645644564@163.com
				//^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
				var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,20})$/;
				if(emailReg.test(email) == false){
					alert("邮箱格式不正确，请重新输入！如： 13645644564@163.com");
					return false;
				}
		
		});
		
	});
</script>
<link type="text/css" rel="stylesheet" href="static/css/style.css">
<style type="text/css">
.login_form {
	height: 420px;
	margin-top: 25px;
}

strong {
	color: red;
}

#a1{
	color:blue;
	text-decoration: none;
	margin-right: 20px;
	margin-top:5px;
	font-size: 20px;
}
#header {
	height: 82px;
	width: 1200px;
}

.banner{
	height:600px;
	background-color: #393d49;
}
.login_form{
	height:360px;
	width:450px;
	float: right;
	margin-right:150px;
	margin-top: 90px;
	background-color: #fff;
}

#content {
	height: 475px;
	width: 1200px;
}

.login_box{
	margin: 20px;
	height: 260px;
	width: 366px;
}

h1 {
	font-size: 20px;
}
.msg_cont{
	background: none repeat scroll 0 0 #fff6d2;
    border: 1px solid #ffe57d;
    color: #666;
    height: 18px;
    line-height: 18px;
    padding: 3px 10px 3px 40px;
    position: relative;
    border: none;
}

.msg_cont b {
    display: block;
    height: 17px;
    left: 10px;
    margin-top: -8px;
    overflow: hidden;
    position: absolute;
    top: 50%;
    width: 16px;
}

.form .itxt {
    border: 0 none;
    float: none;
    font-family: "宋体";
    font-size: 14px;
    height: 18px;
    line-height: 18px;
    overflow: hidden;
    padding: 10px 0 10px 10px;
    width: 220px;
    border: 1px #e3e3e3 solid;
}

#sub_btn{
	background-color: #39987c;
	border: none;
	color: #fff;
	width: 360px;
	height: 40px;
}

#l_content {
	float: left;
}

#l_content span {
	font-size: 60px;
	color: white;
}

.tit h1 {
	float: left;
	margin-top: 5px;
}

.tit a {
	float: right;
	margin-left: 10px;
	margin-top: 10px;
	color: red;
	text-decoration: none;
}

.tit .errorMsg {
	float: right;
	margin-left: 10px;
	margin-top: 10px;
	color: red;
}

.tit {
	height: 30px;
}
</style>
</head>
<body>
	<div id="header">
		
	</div>
	
	<div class="banner">

		<div id="l_content">
			<span class="login_word"><img src="image/article1.png" width="400px" height="600px"></span>
		</div>

		<div id="content">
			<div class="login_form">
				<div class="login_box">
					<div class="tit">
						<h1>注册会员</h1> <span style="float:left;padding-left:20px;font-size: 20px;margin-top: 5px;" class="errorMsg"><c:out value="${requestScope.msg}"/></span><span style="float:right;"><a id="a1" href="index.jsp" >退出</a></span>
						
					</div>
					<br/><br/>
					<div class="form">
						<form action="UserServlet?method=regist" method="post">
							<label><strong id="1">*</strong>用户名称：</label> 
							<input value="<c:out value='${requestScope.user.username}'/>" class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" /> <br /> <br /> 
							
							<label><strong id="2">*</strong>用户密码：</label> 
							<input class="itxt" type="password"	placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" /> <br /> <br /> 
							
							<label><strong id="3">*</strong>确认密码：</label> 
							<input class="itxt" type="password"	placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" /> <br /> <br /> 
								
							<label><strong id="4">*</strong>电子邮件：</label>
							<input value="<c:out value='${requestScope.user.password}'/>" class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off" tabindex="1" name="email" id="email" /> <br /><br /> 
							
							<input type="submit" value="注册" id="sub_btn" />
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="bottom">
		<span> Memokey.Copyright &copy;2019 </span>
	</div>
</body>
</html>