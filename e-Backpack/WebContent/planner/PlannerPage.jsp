<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Planner</title>
<style type="text/css">
body{
margin:0;
padding:0;
font-family:Titillium Web;
color:black;
background:#f3f3f3;
}
.container {
    max-width:960px;
    width:96%
}
header, footer {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}
.logo{
float:left;
margin-top:-30px;
url:logo.PNG;
}
nav{
float:right;
line-height:70px;
}
nav li{
display:inline-block;
padding:5px 20px;
margin-left:10px;
background:#ff4719;
line-height:normal;
}
nav li a{
	color: white;
	 text-decoration: none;
}
.content h2{
color:black;
background: #f1f1c1;
padding:10px;
border-radius:Spx;
margin-bottom:20px;
}
.content ul {
	list-style-position:outside;
}
.content ul a{
 text-decoration: none;
}
</style>
</head>
<div class="container">


<h1>Make Plan</h1>
</div>

</head>
<div class="container">
<div class="content">
<h2>Main Menu</h2>
<ul class="a">

<body>
<li><a href="viewPersonCalen.jsp">Personal Calendar</a></li>
<li><a href="addEvent.jsp">Add an Event</a></li>
<li><a href="search1Day.jsp">Search One Day</a></li>
</ul>
</body>
</html>