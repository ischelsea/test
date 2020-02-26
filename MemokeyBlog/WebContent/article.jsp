<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link href="css/effects/set2.css" rel="stylesheet" type="text/css">
<link href="css/effects/normalize.css" rel="stylesheet" type="text/css">
<link href="css/effects/component.css"  rel="stylesheet" type="text/css" >

<script src="js/article.js"></script>

<style>
body{
	background-color:#393d49;
}
h2{
	font-color:white;
}
</style>
</head>

<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<img src="image/logo.png" width="200px" height="80px" title="memokey" alt="memokey"/>
		</div>
		<div class="col-md-6 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
				</div>
				<div class="col-md-6 column">
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="03_index.jsp">Index</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="#">Article</a>
						</li>
						<li>
							 <a href="#">Information</a>
						</li>
						<li>
							 <a href="#">Reprint</a>
						</li>
						<li>
							 <a href="#"></a>
						</li>
						
							<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Searchway<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">label</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Calelog</a>
								</li>
							</ul>
						</li>
						
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Search</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">tool<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
								<li>
									 <a href="#">Label</a>
								</li>
								<li>
									 <a href="#">Catelog</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-973354">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-973354">
					</li>
					<li data-slide-to="1" data-target="#carousel-973354">
					</li>
					<li data-slide-to="2" data-target="#carousel-973354">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="image/art1.jpg" class="img-responsive center-block"/>
						<div class="carousel-caption">
							<h4>
								Grasp opportunity to create the future.
							</h4>
							<p>
								Through greater effort and hard work a precious dream comes   true. 
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="image/art2.jpg" class="img-responsive center-block"/>
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="image/art3.jpg" class="img-responsive center-block"/>
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-973354" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-973354" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<br/>
			<div class="col-md-12 column">
				<div class="list-group">							
					<a href="#" class="list-group-item">Article</a>
					<!-- 初始化文章列表 -->
					<c:forEach var="article"   items="${article_list}" >	
					<div  class="list-group-item">									
					<h4><a href="/memokey/ArticleServlet?id=${article.id}">${article.title}</a></h4>
					<br/>
					<span>${article.time}&nbsp;&nbsp;|</span>
					<a href="/memokey/SortServlet?get=${article.sort}"><span class="label label-info"  style="font-size: 15px">${article.sort}</span></a>&nbsp;&nbsp;|
					<span>阅读次数: ${article.visit}</span>
					<br/><br/>					
					<span>${article.content}</span>
					<br/><br/>
					<br/>	
					<a href="/memokey/ArticleServlet?id=${article.id}">阅读全文</a>	
					</div>
					</c:forEach>
					<!-- 初始化文章列表完成 -->			
				</div>
					
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		</div>
	</div>
</div>

 <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script src="js/nav.js" type="text/javascript"></script> 
<script src="js/custom.js" type="text/javascript"></script> 

<script src="js/bootstrap.min.js" type="text/javascript"></script> 
<script src="js/effects/masonry.pkgd.min.js"  type="text/javascript"></script> 
<script src="js/effects/imagesloaded.js"  type="text/javascript"></script> 
<script src="js/effects/classie.js"  type="text/javascript"></script> 
<script src="js/effects/AnimOnScroll.js"  type="text/javascript"></script> 
<script src="js/effects/modernizr.custom.js"></script> 

<script src="https://code.jquery.com/jquery.js"></script>
   
<script src="js/bootstrap.min.js"></script>
</body>
</html>