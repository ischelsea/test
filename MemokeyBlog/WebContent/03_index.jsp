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
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link href="css/effects/set2.css" rel="stylesheet" type="text/css">
<link href="css/effects/normalize.css" rel="stylesheet" type="text/css">
<link href="css/effects/component.css"  rel="stylesheet" type="text/css" >
<style>
body{
	background-color:#393d49;
}
#face{
	width:200px;
	height:200px;
	
}
h2{
	font-color:white;
}
#box{
	width:200px;
	height:200px;
}

</style>
</head>
<body>
<header role="header">
  <div class="container"> 
     <h1> <a href="03_index.jsp" title="memokeyindex"><img src="image/logo.png" width="200px" height="80px" title="memokey" alt="memokey"/></a> </h1>
    <nav role="header-nav" class="navy">
      <ul>
        <li class="nav-active"><a href="03_index.jsp" title="myblog">MY BLOG</a></li>
        <li><a href="blogworld.jsp" title="blogworld">BLOG WORLD</a></li>
        <li><a href="login.jsp" title="log out">LOG OUT</a></li>
        <li><a href="about.html" title="about">ABOUT</a></li>
      </ul>
    </nav>
  </div>
</header>


<main role="main-home-wrapper" class="container">
  <div class="row">
    <section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 ">
      <article role="pge-title-content">
        <header>'
          <h2><span><div id="face"><img src="image/face.jpg" width="150px" height="150px"></div></span> <font color="white">LEMON CHELSEA</font></h2>
        </header>
        <p><font color="white">do what you want!</font></p>
      </article>
    </section>
    <section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 grid">
      <figure class="effect-oscar"> <img src="image/index2.png" width="400px" height="400px" alt="" class="img-responsive"/>
        <figcaption>
          <h2>MY<span>&nbsp;&nbsp;&nbsp;ARTICLE</span></h2>
          <p>Personal Aricle Manage</p>
          <a href="article.jsp">view</a> </figcaption>
      </figure>
    </section>
    <div class="clearfix"></div>
    <section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 grid">
      <ul class="grid-lod effect-2" id="grid">
        <li>
          <figure class="effect-oscar"> <img src="image/index3.png" alt="" class="img-responsive"/>
            <figcaption>
              <h2>MY <span>Message</span></h2>
              <p>Personal Message Manage</p>
              <a href="message.jsp">View more</a> </figcaption>
          </figure>
        </li>
        <li>
          <figure class="effect-oscar"> <img src="image/index4.png" alt="" class="img-responsive"/>
            <figcaption>
              <h2>MY <span>CATELOG</span></h2>
              <p>VIEW MY CATELOG</p>
              <a href="catelog.jsp">View more</a> </figcaption>
          </figure>
        </li>
      </ul>
    </section>
    <section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 grid">
      <ul class="grid-lod effect-2" id="grid">
        <li>
          <figure class="effect-oscar"> <img src="image/index7.png" alt="" class="img-responsive"/>
            <figcaption>
              <h2>MY <span>LABEL</span></h2>
              <p>personal LABEL manage</p>
              <a href="label.jsp">View more</a> </figcaption>
          </figure>
        </li>
        <li>
          <figure class="effect-oscar"> <img src="image/index8.png" alt="" class="img-responsive"/>
            <figcaption>
              <h2>MY <span>REPRINT</span></h2>
              <p>VIEW MY REPRINT</p>
              <a href="reprint.jsp">View more</a> </figcaption>
          </figure>
        </li>
        
      </ul>
    </section>
    <div class="clearfix"></div>
  </div>
</main>

<footer role="footer" background-color="#393d49"> 
  <nav role="footer-nav">
    <ul>
      <li><a href="index.html" title="Work">myblog</a></li>
      <li><a href="about.html" title="About">blogworld</a></li>
      <li><a href="blog.html" title="Blog">logout</a></li>
      <li><a href="contact.html" title="Contact">about</a></li>
    </ul>
  </nav>>
  <p class="copy-right">&copy; 2019 chelsea All rights Resved</p>
</footer>


<script src="js/jquery.min.js" type="text/javascript"></script> 

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