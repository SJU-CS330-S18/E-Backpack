<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="error" class="apec.users.Error" scope="session"/>

<html>
<link rel="stylesheet" type="text/css" href="styles.css" />
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
<title>APEC GABEs Login</title>
</head>
<jsp:include page="Decorators/Header.jsp" />
<body>
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
					<input class="button" type="reset">
			</form>
			<font color="red"><%=error.getError()%></font>
		</div>
	</div>
	</div>
</body>
</html>