<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<c:if test="${!empty user}">
  <div align="center">
	当前用户: ${user.username}
  </div>
</c:if>
 
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>id</td>
        <td>名称</td>
        <td>价格</td>
        <td>购买</td>
    </tr>
    <c:forEach items="${articles}" var="article" varStatus="st">
        <tr>
            <td>${article.articleid}</td>
            <td>${article.articletitle}</td>
            <td>${article.profile}</td>
            <td>
             
            <form action="addOrderItem" method="post">
             
            数量<input type="text" value="1" name="num">
            <input type="hidden" name="pid" value="${article.articleid}">
            <input type="submit" value="购买">
            </form>
            </td>
 
        </tr>
    </c:forEach>
</table>>