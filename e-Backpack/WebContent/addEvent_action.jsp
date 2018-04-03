<%@page import="entity.Event"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 
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