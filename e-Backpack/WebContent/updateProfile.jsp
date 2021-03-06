<!-- The user can update his or her personal information on this page   -->
<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>



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
	width: 315px;
	height: 390px;
	background-color: white;
	background-position:center;
	margin:auto;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
}
</style>

<script>
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>Update Profile</title>
</head>
<body>


<body>

<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
  <td align="right" width="690"><a href="Logout.jsp">Logout</a>
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
<!--  block to update profile-->
<div id="logginblock">
	<div style="text-align: center;">
		<h1>Update Profile</h1>
		<form method="post" action="updateProfile_action.jsp"
			name="UpdateProfile">
			<table id="UpdateProfile">
				<tr>
					<td>Username</td>
					<td><input name="username" value=<%=student.getUsername()%>
						readonly></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input name="fname"
						value=<%=student.getFname()%>></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input name="lname" value=<%=student.getLname()%>></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input name="email" value=<%=student.getEmailad()%>></td>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td><input name="phoneno"
						value=<%=student.getPhoneno()%>></td>
				</tr>

				<tr>
					<td>Old Password</td>
					<td><input name="pass" value=<%=student.getPassword()%>
						type="password" readonly></td>
				</tr>
				<tr>
					<td>New Password</td>
					<td><input id="new" name="newPass" value="" type="password"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" onclick="myFunction('new')">Show Password</td>
				</tr>
				<tr>
					<td>Retype Password</td>
					<td><input id="rnew" name="newPass2" value="" type="password"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" onclick="myFunction('rnew')">Show Password</td>
				</tr>
				<tr>
					<td></td>
					<td><input class="button" name="UpdateProfile" value="Update" type="submit">
						<input class="button" type="submit" value="Cancel"
						formaction="userMenu.jsp"></td>
				</tr>
				<tr>
				<font color="red"><%
String error = request.getParameter("Error");
				//sucessfully updated profile or passwords don't match
if(error != null && error.equals("1")){
	out.println("You have successfully updated your personal information.");
}
else if(error != null && error.equals("2")){
	out.println("Password and retype password don't match.");
}

%></font>
</tr>
			</table>
			<br> <br>

		</form>
	</div>
	</div>
</body>
</html>