<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Event</title>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
</head>
<body>

<button id="modalBtn" class="button">Add New Event</button>
<div id="SimpleModal" class="modal">
	<div class="modal-content">
		<span class="closeBtn">&times;</span>
		<form method="post" action="addEvent_action.jsp" name="Login">
		<button id="addEventBtn" type="submit" class="button">Add New Event</button>
					<div class="form-group">
						<p class="center">
							<label>Event Title:</label> <input class="event-info"
								name="eventitle" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Description:</label> <input id="desc" class="event-info"
								name="eventdescription" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Location:</label> <input id="location" class="event-info"
								name="location" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Date (mm/dd/yyyy):</label> 
							<input class="event-info" name="eventdate" value="" type="date">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Start Time (e.g. 14:00 -Enter as Military Time):</label>
							 <input class="event-info" name="starttime" value="" type="time">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>End Time (e.g. 15:45 -Enter as Military Time):</label> 
							<input class="event-info" name="endtime" value="" type="time">
						</p>
					</div>
					</form>
	</div>
</div>

<script src = "modalFunc.js"></script>
</body>
</html>

