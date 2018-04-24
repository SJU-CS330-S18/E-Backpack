<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<%
String courseTitle =(String)session.getAttribute(request.getParameter("courseID"));
//System.out.println(courseTitle);
	student.retireNotebook(courseTitle);
	response.sendRedirect("notebookMenu.jsp");

	
%>