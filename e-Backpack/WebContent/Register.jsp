<%-- Import java.sql.* and use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/>

<%-- if the password does not match then retype the password --%>
<%  String value = request.getParameter("value");
if(value!=null)
   out.println("PASSWORD DOES NOT MATCH RETYPE PASSWORD");%>
   
   
<html>
<link rel="stylesheet" type="text/css" href="e-BP.css" />

<style>
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

#logginblock{
	width: 600px;
	height: 460px;
	background-color: white;
	background-position:center;
	margin:auto;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
}
</style>

<script>function myFunction() {
    var x = document.getElementById("pass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
        
    }
}</script>

<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>e-Backpack Register</title>
</head>

	<div id="banner">

<%-- side navigation --%>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Login.jsp">Log In</a>
</div>

<span style="font-color: white;font-size:45px;cursor:pointer; " onclick="openNav()">&#9776;</span>

<script>
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

<%-- A container on the create account page to add a new account--%>
<div id="logginblock">
 <div class ="container">
 <header>
 <h1 align="center"> Create e-Backpack Account</h1> 
 </header>
<form style=""font-family: Times New Roman,Times,serif";" method="post"action="Register_Action.jsp" name="RegisterForm">
<table align="center">
<tr>
	<th align "right"> Username : </th> 
	<td> <input name="username" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Firstname : </th> 
	<td> <input name="fname" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Lastname : </th> 
	<td> <input name="lname" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Phone No: </th> 
	<td> <input name="phoneno" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Email Address : </th> 
	<td> <input name="emailad" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Password : </th> 
	<td> <input name="password" size ="25%" height = "100" value= "" type="password" id="pass" ></td>
</tr>
<tr>
	<td></td>
	<td><input type="checkbox" onclick="myFunction('password')">Show Password</td>
</tr>
<tr>
	<th align "right"> Retype Password : </th> 
	<td> <input name="password2" size ="25%" height = "100" value= "" type="password" id="pass">
	
	</td>
</tr>
<tr>
	<td></td>
	<td><input type="checkbox" onclick="myFunction('password2')">Show Password</td>
</tr>
<tr>
<%-- Submit the new account request/creation--%>
<td colspan="4" align ="right">
   <input style="color: black;" name="Confirm" value="Confirm" type="submit">
</td>
</tr>
</div>
</div>
</table>
 	<div class="form-group">
	<p class="center">
	
	<div class="tooltip"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREDqWA3HbtskFN4K8s9I9qJmYOQj3U1dqEaDh0bN_FCYtrzMho"
 width="35" height="25"> <span class="tooltiptext">Create your e-Backpack account to digitize your planner, notebook, and folder.
 												   Access your digital files at any time, and organize your life without the strain of a heavy backpack!</span></div>
	
	<br><br><b>Already have an e-Backpack account?</b><br>
	<form style=""font-family: Times New Roman,Times,serif";" method="post"action="Login.jsp" name="login">
<button id="modalBtn" class="link">Return to Login</button>
</form>
</div>
</form>
</body>
</html>