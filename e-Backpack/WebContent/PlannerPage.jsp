<!-- JSP Page to represent the Planner UI. This UI page is a place where the
user can see their calendar, and events for the current day. The user has the ability to 
search a specific day to see events for days other than the current.  -->

<%@ page language="java" import="java.sql.*,entity.*, java.util.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="*"/> 

<html>

<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<head>
<!-- Page Title -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Planner</title>
<style>
*{
	 box-sizing: border-box;
}
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

/* DIV element used throughout the project to hold other elements, and add contrast from background.*/
#holdingblock{
	
	width: 50%;
	height: 500px;
	background-color: white;
	background-position:left;
	float:left
	
	
	
	}
/* CSS for each row in Calendar */
.row:after {
    content: "";
    display: table;
    clear: both;
}
/* Changes the color of the calendar day element to yellow, to make it stand out to the user. */
#current_day { background-color:yellow; font-weight: bold; } 
-->

.btn:hover {background: #eee;}
.link{color:black;}

#modalBtn{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#modalBtn:hover{
	background: #babdb6;
}

</style>
<head>
<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Planner Page</title>


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
 e-Backpack 
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
   var calendarTable = '<table summary="Calendar" class="calendar" style= "margin-left:25%" ';
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

 <form style=""font-family: Times New Roman,Times,serif";" method="post"action="AddEvent.jsp" name="addEvent">
<button id="modalBtn" class="link">Add Event</button>
</form>

<!-- Button to allow the user to jump to another day other than the current day, to view that day's events-->
<script src = "modalFunc.js"></script>
 <form style=""font-family: Times New Roman,Times,serif";" method="post"action="search.html" name="search">
<button id="modalBtn" class="link">Jump To...</button>
</form>
</div>
<!-- DIV element containing table with the current day's events. -->
<div id="holdingblock" style= text-align:center>
<h2>Today's Schedule <div class="tooltip"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREDqWA3HbtskFN4K8s9I9qJmYOQj3U1dqEaDh0bN_FCYtrzMho"
 width="35" height="35"> <span class="tooltiptext">Here is your list of your current events for today. If you want to view events for another day, 
 												   use the Jump To... feature.
 												   </span></div></h2> 
	<%try{
	ResultSet rs = student.getEventList();
	java.sql.Date dateC = new java.sql.Date(Calendar.getInstance().getTime().getTime());
	//System.out.println(dateC.toString());
	%><table style="width:100%">
	<tr><th>Event</th>
	<th>Event Date</th>
	<th>Location</th></tr>
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