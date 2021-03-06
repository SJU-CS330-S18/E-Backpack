<!-- JSP Page to represent Add event UI. This UI page is a place where the
user can input information to be able to add a new event to their calendar  -->
<%-- Import java.sql.* and use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/>

<html>
<link rel="stylesheet" type="text/css" href="e-BP.css" />

<style>

/*Top banner element, used throughout project. */
#banner{
  width:100%;
  background-size:880px 680px;
  background-repeat:no-repeat;
  background-position:60% 46%;
  height: 99px;
  background-color: #0A0808;
  color: #b5cce0;
  text-align: center;
  font-size: 72;
}
/* DIV element used throughout the project to hold other elements, and add contrast from background */
#logginblock{
	width: 600px;
	height: 300px;
	background-color: white;
	background-position:center;
	margin:auto;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
}

#return{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#return:hover{
	background: #babdb6;
}

#confirm{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#confirm:hover{
	background: #babdb6;
}
</style>
<%-- Additional checking to ensure user is logged in--%>
<script>function myFunction() {
    var x = document.getElementById("pass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
        
    }
}</script>


<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>e-Backpack Add Event</title>

</head>
<!-- Implement Banner-->
<div id="banner">
<!--Sidebar navigation Links -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="userMenu.jsp">Menu</a>
  <a href="Logout.jsp">Log Out</a>
</div>

<span style="font-color: white;font-size:45px;cursor:pointer; " onclick="openNav()">&#9776;</span>

<script>
<!-- Javascript element to control sidebar menu, where user can navigate to other pages-->
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
 e-Backpack 
</div>
 <body>

<%-- Container to add a new event with elements being typed in. The action after is to go to
	addEvent_action.jsp. This add action page interacts with the student bean. --%>
<div id="logginblock">
 <div class ="container">
 <header>
 <h1 align="center"> Add a New Event</h1>
 </header>


<form style=""font-family: Times New Roman,Times,serif";" method="post"action="addEvent_action.jsp" name="RegisterForm">
<table align="center">
<tr>
	<th align "right"> Event Title : </th> 
	<td> <input name="title" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Description : </th> 
	<td> <input name="desc" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Location : </th> 
	<td> <input name="location" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Date (MM/DD/YYYY): </th> 
	<td> <input name="date" size ="25%" height = "100" value= "" ></td>
</tr>
<td colspan="4" align ="right">


<input style="color: black;" id = "confirm" name="Confirm" value="Confirm" type="submit">
</td>
</table>
</form>

<form method="post" action="PlannerPage.jsp" name="Return">
<input style="color: black;" id = "return"name="Return" value="Return to Planner" type="submit">
</form>

</body>
</html>