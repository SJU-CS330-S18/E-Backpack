<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 
<% 
    student.logout();
    response.sendRedirect("Login.jsp");
   %> 