<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
<title>登录 </title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link href='http://cdn.repository.webfont.com/webfonts/nomal/134032/45410/5dcaa003f629d804b423b7a7.css' rel='stylesheet' type='text/css' />

<style>
*{ 
	margin:0 auto; 
	padding:0 auto; 
	text-align:center;
}
body{
	background:#393d49;
}
#header{
	height:30px;
	width:40px;
	background-color:white;
}
#box{
	width:1000px;
	height:480px;
}
h1{
	font-size:30px;
	float:left;
	color:white;
}
.box {
	width: 450px;
	padding: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #191919;
	text-align: center;
	float:left;
}
.box input[type='text'],
.box input[type='password'] {
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #3498db;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
}
.box input[type='text']:focus,
.box input[type='password']:focus {
	width: 280px;
	border-color: #2ecc71;
}
.submit {
	border: 0;
	background: none;
	margin: 20px auto;
	margin-top: 0;
	display: inline-block;
	text-align: center;
	border: 2px solid #3498db;
	padding: 10px 40px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	text-decoration: none;
	font-size: 12px;
}
.submit:hover {
	background: #2ecc71;
	border-color: #2ecc71;
}
.box1{
	width:105px;
	height:30px;
	text-align:center;
}
.img{
	width:200px;
	height:150px;
	padding-bottom:40px;
}
input[type="submit"] {
border:none;
background:none;
cursor:pointer;
outline:none;
color:white;
}
</style>



</head>
<body>

<div class="form">
<form action="MasterServlet?action=login" method="post" name="Loginform" >

		<div id="nav">
			<h1 style="font-family:'HoangYen11';"> </h1>
		</div>
		<div class="box">
		<div class="box1">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="font-family:'HoangYen11';">Login</h1>
		</div>
			<input id="username" name="name" class="ipt" type="text" placeholder="Username" />
			<input id="password" name="pwd" class="ipt" type="password" placeholder="Password" />
			<a class="submit"><input type="submit" value="login" style="BACKGROUND-COLOR: transparent;"></a>
			<a class="submit" href="NewFile.jsp">Register</a>
		</div>

</form>	
</div>
</body>
</html>