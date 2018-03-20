<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="emp" property="*"/> 
<jsp:setProperty name="student" property="*"/> 

<%
student= new Student(request.getParameter("username"),request.getParameter("password"));
if(student.login()){
	 response.sendRedirect("homepage/userMenu.jsp");
     }
 else
 { response.sendRedirect("Login.jsp");}
%> 

