<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理</title>
<%@ include file="WEB-INF/base.jsp" %>
<script type="text/javascript">
$(function(){
	$(".delarticle").click(function(){
		var articletitle = $(this).attr("name");
		var result = confirm("确认删除[ "+articletitle+" ]吗?");
		
		if(result==false){
			return false;
		}
	});
	
    $("#goBtn").click(function(){
    	 var goPageNo = $("#goPageNo").val();
 	 
         location = "ArticleManagerServlet?method=getPageArticle&pageNo=" + goPageNo; 

    });
    
  
 


});

</script>

</head>
<body>
	<div id="header">
		
			<span class="wel_word">图书管理系统</span>
	</div>
	
	<div id="main" style="position: relative;">
		<table>
			<tr>
				<td>名称</td>
				<td>价格</td>
				<td>作者</td>
				<td>销量</td>
				<td>库存</td>
				<td>图片路径</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${requestScope.pageArticle.list}" var="article">
				<tr>
					<td>${article.articletitle}</td>
					<td>${article.username}</td>
					<td>${article.articlestar}</td>
					<td>${article.articlecontent}</td>
					<td>${article.profile}</td>
					<td>${article.labelid}</td>
					<td>${article.sortid}</td>
					<td><a href="ArticleManagerServlet?method=editArticle&&id=${article.id}">修改</a></td>
					<td><a name="${article.articletitle}" class="delarticle" href="ArticleManagerServlet?method=deleteArticle&&id=${article.articleid}" >删除</a></td>
				</tr>	
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2" align="center"><a href="addarticle.jsp" >添加图书</a></td>
			</tr>		
			
		</table>
		<br><br>
		<div  style="position:absolute; bottom: 10px;left:290px;">
	  		<%-- 当前页码大于1 --%>
 		   <c:if test="${requestScope.pageArticle.pageNo > 1}">
      				<a href="ArticleManagerServlet?method=getPageArticle">首页</a>&emsp;
      				<a href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.pageNo - 1}">上一页</a>&emsp;
			</c:if>
				<%-- 当前页码等于1 --%>
			<c:if test="${requestScope.pageArticle.pageNo == 1}">
		 		<a href="ArticleManagerServlet?method=getPageArticle">首页</a>&emsp;
		  		<a href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.pageNo - 1}">上一页</a>&emsp;
			</c:if>
	
			<a style="color:red; text-decoration:none;" href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.pageNo}">【${requestScope.pageArticle.pageNo}/${requestScope.pageArticle.totalPageNo}】</a>&emsp;
	
			<%-- 当前页码小于总页码 --%>
	        <c:if test="${requestScope.pageArticle.pageNo < requestScope.pageArticle.pageNo}">
	            <a href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.pageNo + 1}">下一页</a>&emsp;
	            <a href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.totalPageNo}">末页</a>&emsp;
	        </c:if>
	        <%-- 当前页码等于总页码 --%>
	        <c:if test="${requestScope.pageArticle.pageNo == requestScope.pageArticle.pageNo}">
	     		<a href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.pageNo + 1}">下一页</a>&emsp;
	            <a href="ArticleManagerServlet?method=getPageArticle&pageNo=${requestScope.pageArticle.totalPageNo}">末页</a>&emsp;
	       
	        </c:if>
	
			<span>共<strong>&nbsp;${requestScope.pageArticle.totalPageNo}&nbsp;</strong>页</span>&emsp;
			<span>共<strong>&nbsp;${requestScope.pageArticle.totalRecord}&nbsp;</strong>条记录</span>&emsp;
			<span>跳转到第&nbsp;<input style="text-align: center;color:green;" id="goPageNo" type="text" name="pageNo" value="${requestScope.pageArticle.pageNo}" size="1"/>&nbsp;页</span>&emsp;
			<input type="button" id="goBtn" value="确定"/>
		</div>
	</div>
	
	<div id="bottom" >
		<span>
			书城.Copyright &copy;2019
		</span>
	</div>
</body>
</html>