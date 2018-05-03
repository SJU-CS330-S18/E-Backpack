<%-- Import java.sql.*, java.util.Date, and others. Use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 
<jsp:setProperty name = "student" property = "*" />


<%
	String newNoteContent = request.getParameter("noteContent");
	String noteTitle = request.getParameter("noteT");
	String courseTitle = request.getParameter("courseT");
	
	student.updateNoteText(courseTitle, noteTitle, newNoteContent);
 
response.sendRedirect("notebookMenu.jsp");

%>