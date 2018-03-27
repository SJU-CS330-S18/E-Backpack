<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Planner</title>
<style>

</style>
<head>
<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Planner Page</title>


</head>
<body>

<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="UpdateProfile.jsp">Update Profile</a>
  <td align="right" width="690"><a href="e-Backpack/WebContent/Logout.jsp">Logout</a></td></tr><br>
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
 <font size="70">e-Backpack </font>
</div>


<div class="container">
<div class="content">
<h2 id = "plannerPageHeader">Main Menu</h2>


<body>
<li><a href="viewPersonCalen.jsp">Personal Calendar</a></li>
<li><button id="modalBtn" class="Modalbutton">Add Event</button></li>
<div id="SimpleModal" class="modal">
	<div class="modal-content">
		<div class = "modal-header">
		<span class="closeBtn">&times;</span>
		<h2 class= "modalHead">Add New Event</h2>
		</div>
		<div class="modal-body">
		<form method="post" action="addEvent_action.jsp" name="addEvent">
		
					<div class="form-group">
						<p class="center">
							<label>Event Title:</label> <input type ="text" id="Title" class="event-title"
								name="Event Title" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Description:</label> <input type ="text"id="descText" class="event-desc"
								name="Description" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Date:</label> <input type = "text" class="event-date"
								name="Date" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Start Time</label> <input type = "text" class="event-start"
								name="Timestart" value="">
								<label>AM</label><input type = "radio" id ="endAM" name="startAMPM">
								<label>PM</label><input type = "radio" id ="endPM" name="startAMPM">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>End Time</label> <input type = "text" class="event-end"
								name="Timeend" value="">
								<label>AM</label><input type = "radio" id ="endAM" name="endAMPM">
								<label>PM</label><input type = "radio" id ="endPM" name="endAMPM">
							
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Location:</label> <input type = "text" id="Location" class="event-location"
								name="Event Location" value="">
						</p>
					</div>
					<div><button id="addEventBtn" class="Eventbutton">Add Event</button></div>
					</form>
					</div>
	</div>
</div>

<script src = "modalFunc.js"></script>
<li><a href="search1Day.jsp">Search One Day</a></li>
</ul>
</body>
</html>