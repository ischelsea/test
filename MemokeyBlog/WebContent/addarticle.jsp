<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<style>
body{
	background-color:#393d49;
}
h2{
	font-color:white;
}
#left1{
	float:left;
	width:800px;
	height:600px;
	background-color:white;
	border-radius: 25px;
}
#right1{
	float:right;	
	width:300px;
	height:700px;
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

	<div id="left1">
		<div class="container" id="main">		
			<br/>
			<p>新建文章</p>		
		   <form action="/Blog/NewArticleServlet" method="post">
		   		<div class="col-lg-4">
		   			<span class="help">标题</span>
		   			<input type="text" class="form-control" name="title" >
			   		<span class="help">时间</span>
		   			<input type="text"  class="form-control" name="time" value="${time}" >
		   			<span class="help">作者</span>
		   			<input type="text" class="form-control" name="author" >	
		   			<span class="help">分类</span><br/>
 					<c:forEach var="s"  items="${sort_count}">
 					<input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;					
 					</c:forEach> 	 			
 					<input type="text" class="form-control"  id="sort" name="sort">	
		   			<span class="help">标签</span><br/>
		   			<c:forEach var="tag" items="${all_tag}">
		   			<input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">&nbsp;
		   			</c:forEach>
		   			<input type="text" class="form-control" id="tags"  name="tags">	
		   			<div class="editormd" id="mdView">                
                    	<textarea name="content"></textarea>
                	</div>
                	<br/>
                	<input  class="btn btn-default"  type="submit"   value="提交" />
                </div>
            </form>
		</div>
	</div>
	<div id="right1">
		<img src="image/add1.png" width="270px" height="500px">
	</div>
</div>

<script type="text/javascript">
			var testEditor;
			var jQuery = Zepto;
            $(function() {
					testEditor = editormd("mdView", {
						width  : "90%",
						height : 720,
						path   : './editormd/lib/',
                        codeFold : true,
                        searchReplace : true,
                        saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea                   
                        htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启
                        emoji : true,
                        taskList : true,
                        tocm: true,      
                        tex : true,  
                        flowChart : true,  
                        sequenceDiagram : true,   
                        imageUpload : true,
				        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],				        
				        imageUploadURL : "/Blog/UploadPic",
				        //后台只需要返回一个 JSON 数据				      
						onload : function() {
							//console.log("onload =>", this, this.id, this.settings);
						}
					});				
					editor.setToolbarAutoFixed(false);//工具栏自动固定定位的开启与禁用               
            });
        </script>	
	

	
	
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