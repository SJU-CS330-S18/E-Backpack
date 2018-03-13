<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
<link rel="stylesheet" type="text/css" href="styles.css" />

<style>


#banner{
  width:100%;
  background-size:880px 680px;
  background-repeat:no-repeat;
  background-position:60% 46%;
  height: 99px;
  background-color: #333333;
  color: white;
  text-align: center;
}

#logginblock{
	width: 400px;
	height: 300px;
	background-color: white;
	background-position:center;
	margin:auto;
	box-shadow: 10px 10px 5px #333333;
	
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
<div id="banner">
e-Backpack
</div>


</head>

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
		
		</div>
	</div>
	</div>
</body>
</html>