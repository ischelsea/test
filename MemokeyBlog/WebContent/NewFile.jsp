<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
body
{
	
	background-color:#393d49;
}
.container{
	
	background:url(image/bg1.jpg) no-repeat center;
    background-size:contain;
    width:800px;
    height:600px;
}
</style>
</head>
<body>
<%
Object o = session.getAttribute("user");
if(o!=null){
	User user = (User)o;
	out.println("当前登录用户："+user.getUsername()+"<br/>");
}
%>
 
<%
Object msg = request.getAttribute("message");
if(msg!=null)
	out.println(msg);
%>
<div class="container">
	<div class="row clearfix" style="padding-top:30px">
		<div class="col-md-12 column">
			<h3 class="text-center">
				Register
			</h3>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="register_do" method="post">
				<div class="form-group">
					 <label for="exampleInputEmail1">username:<input type="text" name="username">
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">Password</label><input  name="password" type="password" class="form-control">
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">email</label><input type="email" name="email" class="form-control" id="exampleInputEmail1" />
				</div>
				</div> 
				<div><br></div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
      <!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>