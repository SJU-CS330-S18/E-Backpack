<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="event" class="entity.Event" scope="session"/> 
<jsp:setProperty name="event" property="eventtitle"/>
<jsp:setProperty name="event" property="eventdescription"/>
<jsp:setProperty name="event" property="location"/>
<jsp:setProperty name="event" property="date"/>
<jsp:setProperty name="event" property="starttime"/>
<jsp:setProperty name="event" property="endtime"/>
<jsp:setProperty name="event" property="username"/>

<%
try{
	
	SimpleDateFormat sdf;
	SimpleDateFormat sdf2;

	
	String eventtitle = request.getParameter("eventtitle");
	String eventdescription = request.getParameter("eventdescription");
	String location = request.getParameter("location");
	String date = request.getParameter("date");
	String starttime = request.getParameter("starttime");
	String endtime = request.getParameter("endtime");
	String username = request.getParameter("username");
	
	sdf = new SimpleDateFormat("MM/dd/yyyy");
	Date neweventdate = sdf.parse(date);
	
	sdf2 = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
	Date newstarttime = sdf2.parse(starttime);
	Date newendtime = sdf2.parse(endtime);
	
	java.sql.Timestamp starttime1 = new Timestamp(newstarttime.getTime());
	java.sql.Timestamp endtime1 = new Timestamp(newendtime.getTime());
	
	event.updateEvent(eventtitle,eventdescription,location,neweventdate,starttime1,endtime1,username);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("updateEvent.jsp");

%>