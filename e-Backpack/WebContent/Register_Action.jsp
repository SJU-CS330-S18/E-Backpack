<%-- Import java.sql.* and use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="username"/>
<jsp:setProperty name="student" property="fname"/>
<jsp:setProperty name="student" property="lname"/>
<jsp:setProperty name="student" property="emailad"/>
<jsp:setProperty name="student" property="phoneno"/>

<%-- Request parameter password and compare it to the second password
 	 if the password and password are not equal, forward to register page with value = 1 and will tell the user that the password do not match--%>
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
