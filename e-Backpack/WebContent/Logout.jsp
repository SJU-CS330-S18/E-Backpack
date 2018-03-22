<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 
<% 
    try{
        student.logout();
 	   session.invalidate(); 

    }
    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }
    response.sendRedirect("Login.jsp");
   %> 