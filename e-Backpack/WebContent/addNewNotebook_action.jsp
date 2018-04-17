<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<%
	String courseTitle = request.getParameter("courseTitle");
	student.addNewNotebook(courseTitle);
	response.sendRedirect("notebookMenu.jsp");

	
%>