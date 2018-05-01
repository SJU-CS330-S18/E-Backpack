<!-- This page make the updating profile working  -->
<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>

<%-- if student password is equal to stored password then update password in database, if not, send error--%>
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