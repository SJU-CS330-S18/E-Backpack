<%--This file works on show events of a specific day to meet user's requirement--%>
<%--Contributor: Yidan Zhang --%>
<%--Date: 04/16/2018 --%>

<%--IMPORT PACKAGES AND SET USEBEAN--%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<%--START HTML--%>
<html>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search for Event</title>
<style>
*{
	 box-sizing: border-box;
}
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
	width: 50%;
	height: 500px;
	background-color: white;
	background-position:left;
	float:left;
	margin-left:25%;
	}
.row:after {
    content: "";
    display: table;
    clear: both;
}
#current_day { background-color:yellow; font-weight: bold; } 
.btn:hover {background: #eee;}
.link{color:black;}
</style>
<head>
<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Search for Event</title>
</head>


<body>

<%--CONSISTENT BAR MENU DESIGN --%>
<div id="banner">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="PlannerPage.jsp">Planner</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
  <td align="right" width="690"><a href="Logout.jsp">Logout</a></td></tr><br>
</div>

<%--CONSISTENT BACKGROUND UI DESIGN --%>
<span style="font-color: white;font-size:45px;cursor:pointer; " onclick="openNav()">&#9776;</span>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
<font size="120">e-Backpack </font>
</div>

<div class="row">
<div id="holdingblock" style= text-align:center>
<%
//CALL METHOD IN STUDENT.JAVA WITH PARAMETER FROM USER TO GET SEARCH RESULTS.
try{
	String date = request.getParameter("date");
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	Date neweventdate = sdf.parse(date);
	java.sql.Date sDate = new java.sql.Date(neweventdate.getTime());
	ResultSet rs = student.search1Day(sDate);%>
	<%--CREATE TABLE --%>
	<table style="width:100%">
	<tr><th>Event</th>
	<th>Event Date</th>
	<th>Location</th></tr>
	<%	while(rs.next()){%>
	<%--PRINT OUT THE RESULTS IN WEB PAGE --%>
     	<tr>
     	<td style="vertical-align: top; text-align: center;"><%=rs.getString("EVENTTITLE")%></td>
			<td style="vertical-align: top; text-align: center;"><%=rs.getString("eventdescription")%></td>
       		<td style="vertical-align: top; text-align: center;"><%=rs.getString("location1")%></td> 
     	</tr><%}
	}catch(IllegalStateException ise){
	    out.println(ise.getMessage());
	} %>
	</table>
	<!-- Button to allow the user to jump to another day other than the current day, to view that day's events-->
<br><br><script src = "modalFunc.js"></script>
 <form style=""font-family: Times New Roman,Times,serif";" method="post"action="search.html" name="search">
<button id="modalBtn" class="link">Return to Search...</button>
</form>
	</div>
	</div>
</body>
</html>