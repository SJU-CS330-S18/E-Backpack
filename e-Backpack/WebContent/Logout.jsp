<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 

<% 
	//script calling to student to log this student out
    student.logout();
    response.sendRedirect("Login.jsp");
   %> 