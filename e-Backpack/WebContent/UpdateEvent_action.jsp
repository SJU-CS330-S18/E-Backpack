<%-- Import java.sql.*, java.util.Date, and others. Use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 

<%-- Grabbing parameters from updateEvent jsp page and sending them to updateEvent 
	in student bean which interacts with the database--%>
<%
try{
	String eventtitle = request.getParameter("eventtitle");
	String eventdescription = request.getParameter("eventdescription");
	String location = request.getParameter("location");
	String date = request.getParameter("eventdate");
	
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
 	Date neweventdate = sdf.parse(date);
	java.sql.Date sDate = new java.sql.Date(neweventdate.getTime());
	
	student.updateEvent(eventtitle,eventdescription,location,neweventdate);
	
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("updateEvent.jsp");

%>