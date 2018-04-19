<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
	width: 400px;
	height: 250px;
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

<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>e-Backpack Login</title>



</head>

<body>

<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="Register.jsp">Register</a>
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

<!--  ignore the ...... that was just me being sneaky and centering the title w/ out messing up the navigation bar-->
 e-Backpack 
</div>



<div id="logginblock"> 

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1>Login</h1>
				<form method="post" action="Login_action.jsp" name="Login">
					<div class="form-group">
						<p class="center">
							<label>Username</label> <input class="form-control"
								name="username" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Password</label> <input id="pass" class="form-control"
								name="password" value="" type="password">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
						<input type="checkbox" onclick="myFunction()">Show Password
					</div>
			

			
					<input class="button" name="Login" value="Login" type="submit">
					<input class="button" type="reset"><br><br>
					
<font color="red"><%
String error = request.getParameter("Error");
if(error != null && error.equals("1")){
	out.println("Invalid Credentails, please try again.");
}
else if(error != null && error.equals("2")){
	out.println("You don't have access to the system.");
}


%></font>
					<br>
					<br>
					<tr>
					</form>
					<td colspan="4" align ="right">
   						 <br> <br> <h4> New To E-Backpack? </h2>
    					<form method="post" action="Register.jsp" name="Register">
   						<input style="color: black;" name="Register" value="Create your E-Backpack account" type="submit">
   					</form>
				</td>
			</tr>
		</div>
		</div>
	</div>
	</div>
</body>
</html>