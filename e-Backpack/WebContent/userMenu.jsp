<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="userMenuErrorPage.jsp"%>
<%if(!hasAccess){
	response.sendRedirect("Login.jsp?Error=2");
	}%>
<html>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>
   		  
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
  padding: 0,0,0,0;
}

#holdingblock{
	display: inline-block;
	vertical-align: top;
	width: 250px;
	height: 300px;
	background-color: white;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
	margin: 20px;

	}
	


</style>
   		  
	<head>
		<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >User Menu</title>
	</head>
	
	<body>
	
	<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <td align="right" width="690"><a href="Logout.jsp">Logout</a></td></tr><br>
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

<div id="holdingblock">


			<div class="list-group">
<!-- idk why this won't line up with the others... -->
			<a class="list-group-item btn btn-success" href="PlannerPage.jsp"><img src="data:image/png;base64,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"></a> 
	<br><br><a class="list-group-item btn btn-warning" href="PlannerPage.jsp">Planner</a> <br>
						
				</div>
</div>

<div id="holdingblock">

			<div class="list-group">

					
					 <a class="list-group-item btn btn-success" href="folderMenu.jsp"><img src="http://worldartsme.com/images/red-pocket-folder-clipart-1.jpg"></a> 
					 <a class="list-group-item btn btn-success" href="folderMenu.jsp">Folder</a><br>
				</div>
</div>


<div id="holdingblock">
			<div class="list-group">
					<a class="list-group-item btn btn-success" href="notebookMenu.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL-ISSPGZ2coE4SxMpZ1kNekfpufmjWspeV3ZNyUZMW8Hy4FLt"></a> 
					<a class="list-group-item btn btn-success" href="notebookMenu.jsp">Notebook</a><br>
					
				</div>
</div>

	
	
</body>
</html>