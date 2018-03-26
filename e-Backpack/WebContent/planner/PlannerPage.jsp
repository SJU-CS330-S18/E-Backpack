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
.plannerPageHeader{ 
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}

footer {
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
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
</head>
<div class="container">


<h1>Make Plan</h1>
</div>

</head>
<div class="container">
<div class="content">
<h2 id = "plannerPageHeader">Main Menu</h2>
<ul class="a">

<body>
<li><a href="viewPersonCalen.jsp">Personal Calendar</a></li>
<li><button id="modalBtn" class="button">Add Event</button></li>
<div id="SimpleModal" class="modal">
	<div class="modal-content">
		<div class = "modal-header">
		<span class="closeBtn">&times;</span>
		<h2 class= "modalHead">Modal Header</h2>
		</div>
		<div class="modal-body">
		<form method="post" action="addEvent_action.jsp" name="addEvent">
		
					<div class="form-group">
						<p class="center">
							<label>Event Title:</label> <input id="Title" class="event-title"
								name="Event Title" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Description:</label> <input id="descText" class="event-desc"
								name="Description" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Date:</label> <input class="event-date"
								name="Date" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Start Time</label> <input class="event-time"
								name="Time" value="">
								<button id="addEventBtn" class="button">Add Event</button>
						</p>
					</div>
					</form>
					</div>
	</div>
</div>

<script src = "modalFunc.js"></script>
<li><a href="search1Day.jsp">Search One Day</a></li>
</ul>
</body>
</html>