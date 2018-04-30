<!-- This page will set the ISRETIRED attribute of notebook to Y, which make the retiring working -->
<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<%
String retiredCourseTitle =(String)session.getAttribute(request.getParameter("retiredCourseID"));
System.out.println(retiredCourseTitle);
	student.reactivateNotebook(retiredCourseTitle);
	response.sendRedirect("notebookMenu.jsp");

	
%>