<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="event" class="entity.Event" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Event</title>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
</head>
<body>

<button id="modalBtn" class="button">Update Event</button>
<div id="SimpleModal" class="modal">
	<div class="modal-content">
		<span class="closeBtn">&times;</span>
		<form method="post" action="UpdateEvent_action.jsp" name="Login">
		<%try{ 
          ResultSet rs = event.getEventInfo();
         while (rs.next()) { %>
		<button id="addEventBtn" type="submit" class="button">Update Event</button>
					<div class="form-group">
						<p class="center">
							<label>Event Title:</label> 
							<input name="eventtitle" value="<%=rs.getString("eventtitle")%>"> 
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Description:</label> 
							<input name="description" value="<%=rs.getString("eventdescription")%>"> 
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Location:</label> 
							<input name="location" value="<%=rs.getString("location")%>"> 
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Date (mm/dd/yyyy):</label> 
							<input name="date" value="<%=rs.getString("eventdate")%>"> 
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Start Time (e.g. 14:00 -Enter as Military Time):</label>
							 <input name="starttime" value="<%=rs.getString("starttime")%>"> 
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>End Time (e.g. 15:45 -Enter as Military Time):</label> 
							<input name="endtime" value="<%=rs.getString("enddate")%>"> 
						</p>
					</div>
					<%}%>
<% rs.close();}

    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }
%>
					</form>
	</div>
</div>

<script src = "modalFunc.js"></script>
</body>
</html>

