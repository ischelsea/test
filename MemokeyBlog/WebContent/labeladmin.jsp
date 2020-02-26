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
#right1{
	float:right;
	width:300px;
	height:700px;
}
#left1{
	float:left;	
	width:800px;
	height:300px;
	background-color:white;
}
</style>

</head>
<script type="text/javascript">
    $(function () {
            $.ajax({
                url: "AdminServlet",//提交地址
                type: "get",//提交方式（get,post）
                dataType: "json",//指定服务器返回的数据类型
                success: function (data) {//请求成功后的回调函数
                     $("#tbody").empty(); //删除匹配的元素集合中所有的子节点（就是不重复执行）
                    var trStr = "";
                    //使用循环找到控制台的数据
                    for (var i = 0; i < data.length; i++) {
                        trStr += "<tr><td>" + data[i].id + "</td><td>" + data[i].title + "</td><td>" + data[i].author + "</td></tr>"
                    }
                    $("#tbody").show().append(trStr);//向<tbody>内部追加内容
                },
                error: function () {
                    alert('请求失败');
                }
            })
        });
    });
</script>
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

	<div id="right1">
		<img src="image/label1.png" width="270px" height="600px">
	</div>
	<div id="left1">
		<table class="table table-hover">
  			<caption>文章管理</caption>
 			 <thead>
    			<tr>
      				<th>标题</th>
      				<th>标签</th>
      				<th>类别</th>
      				<th>操作</th>
    			</tr>
  			</thead>
  			<tbody id="tbody">
    			<tr>
      				<td>${article.title}</td>
      				<td>Bangalore</td>
      				<td>560001</td>
    			</tr>
    			<tr>
				    <td>Sachin</td>
				    <td>Mumbai</td>
				    <td>400003</td>
				</tr>
				<tr>
				     <td>Pune</td>
				     <td>411027</td>
				     <td>Pune</td>
				</tr>
  			</tbody>
		</table>
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