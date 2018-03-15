<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="*"/> 

<%if(student.login()){
	 response.sendRedirect("homepage/userMenu.jsp");
     }
 else
 { response.sendRedirect("homepage/userMenu.jsp");}
%> 

