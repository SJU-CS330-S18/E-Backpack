<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="emp" class="entity.StudentIdentity" scope="request"/>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="emp" property="*"/> 
<jsp:setProperty name="student" property="*"/> 

<%
student.setStudent(emp);
if(student.login()){
	 response.sendRedirect("homepage/userMenu.jsp");
     }
 else
 { response.sendRedirect("Login.jsp");}
%> 

