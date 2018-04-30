<%-- Import java.sql.*, java.util.Date, and others. Use the Student bean as id: student --%>
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
<title>Update Event</title>
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
				<title >Update Event</title>
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
<div>
		<form method="post" action="UpdateEvent_action.jsp"
			id="UpdateEvent">
			<table id="UpdateEvent">
<%
//CALL METHOD IN STUDENT.JAVA WITH PARAMETER FROM USER TO GET SEARCH RESULTS.
try{
	String eventT =(String)session.getAttribute(request.getParameter("eventID"));
	System.out.println(eventT);
	ResultSet rs = student.searchDayWithTitile(eventT);
	while(rs.next()){
		
	%>
	<%--PRINT OUT THE RESULTS IN WEB PAGE --%>
	
		
				<tr>
					<td>Event Title</td>
					<td><textarea name = "eventt"readonly><%=eventT%></textarea></td>
				</tr>
				<tr>
					<td>Event Description</td>
					<td><textarea name="eventde"><%=rs.getString("EVENTDESCRIPTION")%></textarea></td>
				</tr>
								<tr>
					<td>Event Location</td>
					<td><textarea name="eventl"><%=rs.getString("LOCATION1")%></textarea></td>
				</tr>
								<tr>
					<td>Event Date</td>
					<td><input name="eventd"
						value=<%=rs.getString("EVENTDATE")%>></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="button" name="UpdateEvent" value="Update" type="submit">
						<input class="button" type="submit" value="Cancel"
						formaction="search.html"></td>
				</tr>
				<%
     	}
	}catch(IllegalStateException ise){
	    out.println(ise.getMessage());
	} %>
	</table>
	</form>
	
</div>


<script src = "modalFunc.js"></script>
</body>
</html>

