<%-- Action page to login a student --%>
<%-- Import java.sql.*, java.entity.* and others. Use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="*"/> 


<%-- if student password is equal to stored password then log them in, if not, redirect them to error page --%>
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
