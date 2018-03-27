<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="*"/> 

<%
//student= new Student(request.getParameter("username"),request.getParameter("password"));
if(student.login()){
	 response.sendRedirect("userMenu.jsp");
     }
 else
 { 
	 response.sendRedirect("Login.jsp?Error=1"); 
	 //response.sendRedirect("Login.jsp");
 
 }
%> 

