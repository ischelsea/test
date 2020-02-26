<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.user }">
	<div>
		<a href="login.jsp">登录</a> | 
		<a href="regist.jsp">注册</a> &nbsp;&nbsp;
		<a href="manager.jsp">后台管理</a>
	</div>
</c:if>
<c:if test="${not empty sessionScope.user }">
	<div>
		<span>欢迎<span class="um_span">${sessionScope.user.username }</span>光临书城</span>
		<a href="UserServlet?method=logout">注销</a>&nbsp;&nbsp;
		<a href="index.jsp">返回</a>
	</div>
</c:if>
    