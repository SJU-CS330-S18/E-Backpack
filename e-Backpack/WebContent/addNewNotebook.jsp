<!-- JSP Page to represent Add new notebook UI. This UI page is a place where the
user can input information add a new notebook under their account -->
<%@ page language="java" import="java.sql.*,entity.*"%>

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
	width: 325px;
	height: 125px;
	background-color: white;
	background-position:center;
	margin:auto;
	margin-top: 25px;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
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

<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>Add New Notebook</title>



</head>
<body>

<div id="banner">
<!-- Implement Banner-->
<!--Sidebar navigation Links -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="notebookMenu.jsp">Notebook Menu</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
  <a href="Logout.jsp">Logout</a>
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

<%-- Container to add a new notebook with elements being typed in. The action after is to go to
	addNewNotebook_action.jsp. This add action page interacts with the student bean. --%>
<div id="logginblock"> 
		<form method="post" action="addNewNotebook_action.jsp"
			name="AddNewNotebook">
			<table id="AddNewNotebook">
				<tr>
					<td>Notebook Title:</td>
					<td><input name="courseTitle" >
						</td>
				</tr>
					<td><input class="button" name="AddNewNotebook" type="submit">
						<input class="button" type="submit" value="Cancel"
						formaction="notebookMenu.jsp"></td>
				</tr>
			</table>
			
		</form>
		<div class="tooltip"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREDqWA3HbtskFN4K8s9I9qJmYOQj3U1dqEaDh0bN_FCYtrzMho"
 width="35" height="35"> <span class="tooltiptext">Create a new Subject notebook to store specific notes for a class or topic.
 												   </span></div>
		</div>
</body>
</html>