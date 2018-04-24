<%-- Action page to add an event to user's personal planner --%>
<%-- Import java.sql.*, java.util.Date, and others. Use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 

<%-- this try catch gets the parameters to add a new event and calls the student 
	 javabean to addevent with those parameters. --%>
<%
try{
	
	String title = request.getParameter("title");
	String desc = request.getParameter("desc");
	String location = request.getParameter("location");
	String eventdate = request.getParameter("date");
	
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
 	Date neweventdate = sdf.parse(eventdate);
	java.sql.Date sDate = new java.sql.Date(neweventdate.getTime());
	student.addEvent(title,desc,location,sDate);
  
	
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("PlannerPage.jsp");

%>