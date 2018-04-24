<%-- Import java.sql.*, java.util.Date, and others. Use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import = "java.io.*, java.util.Date" %>
<%@ page import = "javax.servlet.*, java.text.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/> 


<%
try{
	String newNotebookTitle = request.getParameter("notebookName");
	String oldNotebookName = request.getParameter("oldNotebookName");
		student.updateNotebookName(newNotebookTitle, oldNotebookName);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("notebookMenu.jsp");

%>