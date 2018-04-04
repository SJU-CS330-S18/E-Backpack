<%@ page language="java" import="java.sql.*,entity.*, java.util.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="*"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Planner</title>
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
	float:left
	
	
	
	}

.row:after {
    content: "";
    display: table;
    clear: both;
}

#current_day { background-color:yellow; font-weight: bold; } 
-->



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
<div class="row">
<div id="holdingblock" style= text-align:center>
<script type="text/javascript">
<!-- Begin Hiding
var today = new Date();
var month = today.getMonth();
//Using the Date prototype to assign our month names-->

Date.prototype.getMonthNames = function() { return [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]; }
//Getting the number of day in the month.-->
Date.prototype.getDaysInMonth = function() 
{ return new Date( this.getFullYear(), this.getMonth() + 1, 0 ).getDate(); }
Date.prototype.calendar = function()
{  var numberOfDays = this.getDaysInMonth();
//This will be the starting day to our calendar-->
var startingDay = new Date(this.getFullYear(), this.getMonth(), 1).getDay();
//We will build the calendar_table variable then pass what we build back-->
   var calendarTable = '<table summary="Calendar" class="calendar" style= "margin-left:15%" ';
  // calendarTable.style.fontSize("large");
   
calendarTable += '<caption>' + '<font size="25">'+ this.getMonthNames()[this.getMonth()] + '&nbsp;' + this.getFullYear() + '</font>' + '</caption>';
calendarTable += '<tr><td colspan="7"></td></tr>';
calendarTable += '<tr>';
calendarTable += '<td><font color="red" size="25"><b>S/</b></font></td>';
calendarTable += '<td><b><font size="40">M/</b></font></td>';
calendarTable += '<td><b><font size="40">T/</b></font></td>';
calendarTable += '<td><b><font size="40">W/</b></font></td>';
calendarTable += '<td><b><font size="40">TH/</b></font></td>';
calendarTable += '<td><b><font size="40">F/</b></font></td>';
calendarTable += '<td><b><font size="40">S</b></font></td></tr>'; 
//Lets create blank boxes until we get to the day which actually starts the month-->
for ( var i = 0; i < startingDay; i++ ) 
{ calendarTable += '<td>&nbsp;</td>'; }
//border is a counter, initialize it with the "blank"-->
//days at the start of the calendar-->
//Now each time we add new date we will do a modulus-->
//7 and check for 0 (remainder of border/7 = 0)
//if it's zero then it's time to make new row-->
var border = startingDay;
//For each day in the month, insert it into the calendar-->
for ( var id = '',  i = 1; i <= numberOfDays; i++ ) 
{ if (( month == month ) && ( today.getDate() == i )) { id = 'id="current_day"'; } 
else { id = ''; }
calendarTable += '<td ' + id + '>' + i + '</td>'; border++;
if ((( border % 7 ) == 0 ) && ( i < numberOfDays )) 
{ 
//Time to make new row, if there are any days left.-->
calendarTable += '<tr></tr>'; } } 
//All the days have been used up, so pad the empty days until the end of calendar-->
while(( border++ % 7)!= 0) 
{ calendarTable += '<td>&nbsp;</td>'; } 
//Finish the table-->
calendarTable += '</table>';
//Return it-->
return calendarTable; }
//--> Let's add up some dynamic effect
window.onload = function() {
selected_month = '<form name="month_holder">';
selected_month += '<select id="month_items" size="1" onchange="month_picker();">';
for ( var x = 0; x <= today.getMonthNames().length; x++ ) { selected_month += '<option value="' + today.getMonthNames()[x] + ' 1, ' + today.getFullYear() + '">' + today.getMonthNames()[x] + '</option>'; }
selected_month += '</select></form>';
actual_calendar = document.getElementById('show_calendar');
actual_calendar.innerHTML = today.calendar();
var month_listing = document.getElementById('current_month');
month_listing.innerHTML = selected_month;
actual_month = document.getElementById('month_items');
actual_month.selectedIndex = month;
}
//--> Month Picker <--\\
function month_picker()
{ month_menu = new Date(actual_month.value);
actual_calendar.innerHTML = month_menu.calendar();
}
// Done Hiding -->
</script>
<p>&nbsp</p>
<div id="show_calendar">&nbsp;</div>
<div id="current_month">&nbsp;</div>


<body>
<li><button id="modalBtn" class="Modalbutton">Add Event</button></li>
<div name= "SimpleModal" id="SimpleModal" class="modal">
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
							<label>Description:</label> <textarea rows="10" cols = "30" type ="text"id="descText" class="event-desc"
								name="Description" value=""></textarea>
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Date:</label> <input type = "text" class="event-date"
								name="Date" value="">
						</p>
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<p class="center"> -->
<!-- 							<label>Start Time</label> <input type = "text" class="event-start" -->
<!-- 								name="Timestart" value=""> -->
<!-- 								<label>AM</label><input type = "radio" id ="endAM" name="startAMPM"> -->
<!-- 								<label>PM</label><input type = "radio" id ="endPM" name="startAMPM"> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<p class="center"> -->
<!-- 							<label>End Time</label> <input type = "text" class="event-end" -->
<!-- 								name="Timeend" value=""> -->
<!-- 								<label>AM</label><input type = "radio" id ="endAM" name="endAMPM"> -->
<!-- 								<label>PM</label><input type = "radio" id ="endPM" name="endAMPM"> -->
							
<!-- 						</p> -->
<!-- 					</div> -->
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


 <form style=""font-family: Times New Roman,Times,serif";" method="post"action="AddEvent.jsp" name="addEvent">
<li><button id="modalBtn" class="link">Add Event</button></li>
</form>


<br>

<script src = "modalFunc.js"></script>
<a href="search1Day.jsp">Search One Day</a>
</ul>
</div>
<div id="holdingblock" style= text-align:center>
<h2>Today Schedule</h2>
	<%try{
	ResultSet rs = student.getEventList();
	java.sql.Date dateC = new java.sql.Date(Calendar.getInstance().getTime().getTime());
	//System.out.println(dateC.toString());
	%><table style="width:100%">
	<tr><th>Event Date</th>
	<th>Event Location</th>
	<th>Description</th></tr>
	<%	while(rs.next()){
		java.sql.Date eventD = rs.getDate("eventdate");
	if(eventD.toString().equals(dateC.toString())){ 
		%>
     	<tr>
			<td style="vertical-align: top; text-align: center;"><%=rs.getString("eventdescription")%></td>
       		<td style="vertical-align: top; text-align: center;"><%=eventD%></td>
       		<td style="vertical-align: top; text-align: center;"><%=rs.getString("location1")%></td> 
     	</tr>
   
     	<%}}
	}catch(IllegalStateException ise){
	    out.println(ise.getMessage());
	} %>
	</table>
</div>
</div>
</body>
</html>