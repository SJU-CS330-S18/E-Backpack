<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="username"/>
<jsp:setProperty name="student" property="fname"/>
<jsp:setProperty name="student" property="lname"/>
<jsp:setProperty name="student" property="emailad"/>
<jsp:setProperty name="student" property="phoneno"/>

<%
if(!((request.getParameter("password")).equals(request.getParameter("password2"))))
{ %>
	<jsp:forward page = "Register.jsp">
	 <jsp:param name = "value" value="1"/>
	</jsp:forward>
<%}
else{
	try{
	  student.setPassword(request.getParameter("password"));
	  student.registerCustomer();
 	}catch(IllegalStateException ise){
    		out.println(ise.getMessage());
	}
	response.sendRedirect("Login.jsp");
	}
%>
