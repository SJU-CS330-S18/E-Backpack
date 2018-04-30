<%-- Import java.sql.*, java.util.Date, and others. Use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 

<%-- Grabbing parameters from updateEvent jsp page and sending them to updateEvent 
	in student bean which interacts with the database--%>
<%
try{
	String noteTitle = request.getParameter("nameOfNote");
	String noteContent = request.getParameter("noteContent");
	//String noteContent = request.getElementById("noteContent");
	String courseTitle =(String)session.getAttribute(request.getParameter("difCourseID"));
	//String date2 = request.getParameter("dateOfNote");	
		
 	//SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
  	//Date neweventdate2 = sdf.parse(date2);
 	//java.sql.Date sDate2 = new java.sql.Date(neweventdate2.getTime());
	
	//student.addNewNote(sDate2, noteTitle, noteContent, courseTitle);
	student.addNewNote(noteTitle, noteContent, courseTitle);
	
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("notebookMenu.jsp");

%>