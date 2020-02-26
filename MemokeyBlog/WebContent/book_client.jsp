<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
<%@include file="WEB-INF/base.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#page_nav :button,.article_cond :button").click(function(){
			var pageNo = $("#pn_input").val();
			var useridNo = $("input[name='useridNo']").val();
			//使用location去BookClientServlet请求
			location = "ArticleServlet?method=getBooksByPageAndUserId&pageNo="
					+pageNo+"&useridNo="+useridNo;
		});
	});
</script>
</head>
<body>
<!-- 	http://localhost:8080<br> -->
<%-- 	<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath() %> --%>
	<div id="header">
		
			<span class="wel_word">网上书城</span>
	</div>
	
	<div id="main">
	
		<div id="book">
			<br>
			<div class="book_cond">
				价格：<input type="text" name="useridNo" value="${param.useridNo }"> 元 - 
				
			</div>	
			<br>
			<c:forEach var="article" items="${requestScope.page.list }">
				<div class="b_list">
					
					<div class="book_info">
						<div class="book_name">
							<span class="sp1">书名:</span>
							<span class="sp2">${article.articletitle }</span>
						</div>
						<div class="book_author">
							<span class="sp1">作者:</span>
							<span class="sp2">${article.content }</span>
						</div>
						
						<div class="book_sales">
							<span class="sp1">销量:</span>
							<span class="sp2">${article.profile }</span>
						</div>
						<div class="book_add">
							<button>加入购物车</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
<!-- 	
	totalPageNo<5
		begin:1
		end:totalPageNo
	totalPageNo>=5
	pageNo<=3	
		begin:1
		end:5
			【1】2345
			1【2】345
			12【3】45
	pageNo>3&&pageNo<=totalPageNo-2		
		begin:pageNo-2
		end:pageNo+2
			23【4】56
			34【5】67
			45【6】78
	pageNo>totalPageNo-2	
		begin:totalPageNo-4
		end:totalPageNo
			456【7】8
			4567【8】
 -->
 		<c:choose>
 			<c:when test="${page.totalPageNo<5 }">
 				<c:set var="begin" value="1"></c:set>
 				<c:set var="end" value="${page.totalPageNo }"></c:set>
 			</c:when>
 			<c:when test="${page.pageNo<=3 }">
 				<c:set var="begin" value="1"></c:set>
 				<c:set var="end" value="5"></c:set>
 			</c:when>
 			<c:when test="${page.pageNo>3&&page.pageNo<=page.totalPageNo-2 }">
 				<c:set var="begin" value="${page.pageNo-2 }"></c:set>
 				<c:set var="end" value="${page.pageNo+2 }"></c:set>
 			</c:when>
 			<c:otherwise>
 				<c:set var="begin" value="${page.totalPageNo-4 }"></c:set>
 				<c:set var="end" value="${page.totalPageNo }"></c:set>
 			</c:otherwise>
 		</c:choose>
		<div id="page_nav">
		<c:forEach var="i" begin="${begin}" end="${end}" step="1">
			<c:if test="${i == page.pageNo }">
				<span style="color:red;">【<strong style="color: blue;">${i}</strong>】</span>
			</c:if>
			<c:if test="${i != page.pageNo }">
				<a href="ArticleServlet?method=getArticlesByPageAndUserId&pageNo=${i }&useridNo=${param.useridNo}">${i }</a>
			</c:if>
		</c:forEach>
		&nbsp;&nbsp;共&nbsp;<strong id="pag" style="color:red;">${requestScope.page.pageNo }</strong>/<strong style="color: blue;">${requestScope.page.totalPageNo }</strong>&nbsp;页&nbsp;&nbsp;<strong style="color:red;">${requestScope.page.totalRecord }</strong> &nbsp;条记录&nbsp;&nbsp; 
		跳到第<input style="color: purple;" value="${requestScope.page.pageNo }" name="pn" id="pn_input"/>页
		<input type="button" value="确定">
		</div>
	
	</div>
	
	<div id="bottom">
		<span>
			书城.Copyright &copy;2019
		</span>
	</div>
</body>
</html>