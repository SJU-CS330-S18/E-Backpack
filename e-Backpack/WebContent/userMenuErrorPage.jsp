<%-- If user login credentials are not authentic, an error message appears --%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 

	<%
	boolean hasAccess = true;
	if(!student.isLoggedIn()){
		hasAccess = false;
	}

	%>