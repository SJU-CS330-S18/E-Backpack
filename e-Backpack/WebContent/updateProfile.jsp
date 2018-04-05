<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<html>
<link rel="stylesheet" type="text/css" href="../../styles.css" />
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
						formaction="../userMenu.jsp"></td>
				</tr>
			</table>
			<br> <br>

		</form>
	</div>
</body>
</html>