<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<html>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notebook</title>
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



#current_day { background-color:yellow; font-weight: bold; } 
-->



</style>
<head>
<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Notebook</title>

</head>
<body>

<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
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
<!-- This title is not the same as the others because of the modal HTML  -->
 <font size="120">e-Backpack </font>
</div>



 
	
	<body>
	<div id="holdingblock">
<br>
			<a href="addNewNotebook.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJZ4Uesj_ZEC-sLUuTPCI5fBaBfN_iX0Erscqlz9ACtD_pPUIovg"></a>
			<br><br> <a href="addNewNotebook.jsp">Add New Notebook</a>
</div>

<%try{
	ResultSet rs = student.getCurrentNotebooksList();
%>				
<table>
		<tbody>
			<tr>
				<td style="vertical-align: top;">Currently used Notebook Title<br>
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
					<form method="post" action="NoteUI.jsp" name="note"></form>
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
	
	</body>
</html>