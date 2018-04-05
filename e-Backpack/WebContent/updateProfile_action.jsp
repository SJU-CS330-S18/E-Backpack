<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<%
	String newPass = request.getParameter("newPass");
	if(newPass.equals(request.getParameter("newPass2")) && newPass.length() > 0){
		student.setPassword(newPass);
	}
	student.updateProfile();
	if(newPass.equals(request.getParameter("newPass2"))){
	response.sendRedirect("updateProfile.jsp?Error=1");
	}else{
		response.sendRedirect("updateProfile.jsp?Error=2");
	}
	
	
%>