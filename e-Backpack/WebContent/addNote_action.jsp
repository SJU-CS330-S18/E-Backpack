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
	
	String courseTitle =(String)session.getAttribute(request.getParameter("difCourseID"));
	
	student.addNewNote(noteTitle, noteContent, courseTitle);
	
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("notebookMenu.jsp");

%>