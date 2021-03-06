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
/* Top banner element, used throughout project. */
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

/* DIV element used throughout the project to hold other elements, and add contrast from background. */
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

#noteBookBtn{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#noteBookBtn:hover{
	background: #babdb6;
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
<!-- Gets the list of a student's current Active notebooks to display from the information in the database -->
<%try{ 

	ResultSet rs = student.getCurrentNotebooksList();
%>		
<div id="holdingblock">		


<table>
		<tbody>
			<tr>
				<td style="vertical-align: top;"><b>Active Notebooks:</b><br>
				</td>
				<td style="vertical-align: top;"> <br>
				</td>
			</tr>
			<%
			int n=0;
			while(rs.next()){
				session.setAttribute(Integer.toString(n),rs.getString("COURSETITLE"));
			%>
			<tr>
				<td style="vertical-align: top;">
					<form method="post" action="NoteUI.jsp" name="note">
					 <input name="actCourseID" type="hidden" value=<%=n%>>
					<input id = "noteBookBtn" value="<%=rs.getString("COURSETITLE")%>" name="note" type="submit">
					</form>				
							
				</td>
				<td>

				</td>
			</tr>
		</tbody>
					<%n++;
			}
			%>
	</table>
	</div>
	
	<!-- Gets the list of a student's current Retired notebooks to display from the information in the database -->
	
	<%
	ResultSet rs2 = student.getRetiredNotebooksList();
%>				
<div id="holdingblock">
<table>
		<tbody>
			<tr>
				<td style="vertical-align: top;"><b>Retired Notebooks:</b><br>
				</td>
				<td style="vertical-align: top;"> <br>
				</td>
			</tr>
			<%
			int t=100;
			while(rs2.next()){
				session.setAttribute(Integer.toString(t),rs2.getString("COURSETITLE"));
			%>
			<tr>
				<td style="vertical-align: top;">

					<form method="post" action="retiredNoteUI.jsp" name="noteRetired">
					 <input name="retCourseID" type="hidden" value=<%=t%>>
					<input id = "noteBookBtn" value="<%=rs2.getString("COURSETITLE")%>" name="note" type="submit">
					</form>				
						
				</td>
				<td>

				</td>
			</tr>
		</tbody>
					<%t++;
			}
			}catch(IllegalStateException ise){
			    out.println(ise.getMessage());
			}
			%>
	</table>
	
	</div>
	</body>
</html>