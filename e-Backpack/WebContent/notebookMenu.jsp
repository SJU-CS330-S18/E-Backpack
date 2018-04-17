<!-- JSP Page to represent the Notebook UI. This UI page is a place where the
user can see their current active and retired notebooks. Clicking on a listed notebook
allows the user to view, create, and edit their current notes for that specific notebook.  -->

<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<html>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<head>
<!-- Page Title -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notebook</title>
<style>
<!-- Top banner element, used throughout project. -->
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

<!-- DIV element used throughout the project to hold other elements, and add contrast from background.-->
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
<!-- Page Title -->
<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Notebook</title>

</head>
<body>
<!-- Implement Banner-->
<div id="banner">
<!--Sidebar navigation Links -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
  <td align="right" width="690"><a href="Logout.jsp">Logout</a></td></tr><br>
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

 <font size="120">e-Backpack </font>
</div>



 
	
	<body>
	<!-- Block containing icon and link to Add a new Notebook
	, jumps to AddNewNotebook.jsp page -->
	<div id="holdingblock">
<br>
			<a href="addNewNotebook.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJZ4Uesj_ZEC-sLUuTPCI5fBaBfN_iX0Erscqlz9ACtD_pPUIovg"></a>
			<br><br> <a href="addNewNotebook.jsp">Add New Notebook</a>
</div>
<!-- Gets the list of a student's current notebooks to display from the information in the database -->
<%try{
	ResultSet rs = student.getCurrentNotesList();
%>		
<div id="holdingblock">		
<table>
		<tbody>
			<tr>
				<td style="vertical-align: top;">Currently Active Notebooks:<br>
				</td>
				<td style="vertical-align: top;"> <br>
				</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td style="vertical-align: top;"><%=rs.getString("COURSETITLE")%><br>
				</td>
				<td>
					<form method="post" action="NoteUI.jsp" name="note">
				</td>
			</tr>
		</tbody>
					<%
			}
			}catch(IllegalStateException ise){
			    out.println(ise.getMessage());
			}
			%>
	</table>
	</div>
	
	
	
	</body>
</html>