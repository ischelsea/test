<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
	<link href='http://cdn.repository.webfont.com/webfonts/nomal/134032/45410/5dcaa003f629d804b423b7a7.css' rel='stylesheet' type='text/css' />
	<link href='http://cdn.repository.webfont.com/webfonts/nomal/134032/28595/5dcaa90af629d804b423b7a8.css' rel='stylesheet' type='text/css' />
<style>
*{ 
	margin:0 auto; 
	padding:0 auto; 
	text-align:center;
}
body{
	background-color:#393d49;
}
#header{
	width:1000px;
	height:80px;
}
#nav{
	width:880px;
	height:60px;
}
h1{
	font-size:30px;
	float:left;
	color:white;
}
#section{
	width:1000px;
	height:80px;
}
#box2{
	width:1000px;
	height:80px;
}
span {
	--blur-r: 0.15em;
	--main-sat: 50%;
	--shadow-sat: 70%;

	--main-light: 90%;
	--main-shadow-light: 50%;
	--mid-shadow-light: 40%;
	--dark-shadow-light: 30%;

	--main-shadow-color: hsl(
		var(--hue),
		var(--shadow-sat),
		var(--main-shadow-light)
	);

	--mid-shadow-color: hsl(
		var(--hue),
		var(--shadow-sat),
		var(--mid-shadow-light)
	);

	--dark-shadow-color: hsl(
		var(--hue),
		var(--shadow-sat),
		var(--dark-shadow-light)
	);

	--color: hsl(var(--hue), 74%, var(--main-light));

	--shadow: 0 0 var(--blur-r) var(--main-shadow-color),
		0 0 calc(var(--blur-r) * 2) var(--mid-shadow-color),
		0 0 calc(var(--blur-r) * 3) var(--main-shadow-color),
		0 0 calc(var(--blur-r) * 3.5) var(--main-shadow-color),
		0 0 calc(var(--blur-r) * 4) var(--main-shadow-color),
		0 0 calc(var(--blur-r) * 4.5) var(--dark-shadow-color);

	font-size: 30px;
	color: var(--color);
	font-family:'ActionJackson';
	text-shadow: var(--shadow);
}

.line:first-of-type {
	--hue: 40;
}

.line:nth-of-type(2) {
	--hue: 290;
}

.line:nth-of-type(3) {
	--hue: 330;
}

.line:nth-of-type(4) {
	--hue: 185;
}

.well {
	--hue: 360;
	--duration: 5s;
	--delay: calc(var(--duration) / 4);
	animation: flicker var(--duration) infinite;
  animation-delay: calc(var(--i) * calc(var(--duration) / 4));
	animation-timing-function: linear;
}

@keyframes flicker {
	0%,
	10%,
	15%,
	20%,
	24% {
		opacity: 0.9;
		text-shadow: var(--shadow);
	}

	7%,
	12%,
	16%,
	19%,
	25%,
	100% {
		opacity: 0.2;
		text-shadow: none;
	}
}

.lines {
	margin: auto;
	display: grid;
	padding: 1.5em;
	line-height: 1.1;
}

.buttons {
  display: flex;
  flex-direction: row;
      flex-wrap: wrap;
  justify-content: center;
  text-align: center;
  width: 240px;
  height:180px;
  margin: 0 auto;
}

.container {
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  padding:  40px 0px;
  width: 240px;
}

h2 {
  text-align: left;
  color: white;
  letter-spacing: 0.05em;
  margin: 0 0 0.4em;
  font-size: 15px;
}

p {
  text-align: left;
  color: white;
  letter-spacing: 0.05em;
  font-size: 15px;
  margin: 0 0 2em;
}


.btn {
  letter-spacing: 0.1em;
  cursor: pointer;
  font-size: 14px;
  font-weight: 400;
  line-height: 45px;
  max-width: 160px;
  position: relative;
  text-decoration: none;
  text-transform: uppercase;
  width: 100%;
}
.btn:hover {
  text-decoration: none;
}

.effect01 {
  color: #FFF;
  border: 4px solid #393d49;
  box-shadow:0px 0px 0px 1px #000 inset;
  background-color: #393d49;
  overflow: hidden;
  position: relative;
  transition: all 10s ease-in-out;
}
.effect01:hover {
  border: 4px solid #666;
  background-color: #FFF;
  box-shadow:0px 0px 0px 4px #EEE inset;
}

.effect01 span {
  transition: all 0.2s ease-out;
  z-index: 2;
}
.effect01:hover span{
  letter-spacing: 0.13em;
  color: #333;
}

.effect01:after {
  background: #FFF;
  border: 0px solid #000;
  content: "";
  height: 155px;
  left: -75px;
  opacity: .8;
  position: absolute;
  top: -50px;
  -webkit-transform: rotate(35deg);
          transform: rotate(35deg);
  width: 50px;
  transition: all 1s cubic-bezier(0.075, 0.82, 0.165, 1);
  z-index: 1;
}
.effect01:hover:after {
  background: #FFF;
  border: 20px solid #000;
  opacity: 0;
  left: 120%;
  -webkit-transform: rotate(40deg);
          transform: rotate(40deg);
}
#article{
	width:1000px;
	height:140px;
	
}
#footer{
	width:100px;
	height:50px;
}
.img{
	width:240px;
	height:100px;
	float:right;
}

</style>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="nav">
		<h1 style="font-family:'HoangYen11';">Memokey </h1>
	</div>
	<div id="section">
		<div id="box2">
   		 		<div class="lines">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="line">If you want<span class="well" style="--i: 0;"> knowledge</span></span>
 					<span class="line">you must toil for it<span class="well" style="--i: 3;"> well</span></span>
  
   		 		</div>
   		 </div>
	</div>
	<div id="article">
   		 	<div class="buttons">
  				<div class="container">
    				 <h2 style="font-family:'HoangYen11';">开始使用</h2>
    				 <p style="font-family:'HoangYen11';">Memokey</p>
    			 	<a class="btn effect01" href="login.jsp"><span>START</span></a>
 				 </div>
 				 
			</div>
			<div class="img">
				<img src="image\01_index.png"> 
			</div>
	</div>
	<script src="resources/layui/layui.js"></script>
</body>
</html>