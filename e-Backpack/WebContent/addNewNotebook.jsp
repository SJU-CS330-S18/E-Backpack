<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Notebook</title>
</head>
<body>
<h1>Add New Notebook</h1>
		<form method="post" action="addNewNotebook_action.jsp"
			name="AddNewNotebook">
			<table id="AddNewNotebook">
				<tr>
					<td>Course Title</td>
					<td><input name="coursetitle" value=<%=student.getUsername()%>
						></td>
				</tr>
					<td><input class="button" name="AddNewNotebook" type="submit">
						<input class="button" type="submit" value="Cancel"
						formaction="notebookMenu.jsp"></td>
				</tr>
			</table>
			<br> <br>

		</form>
</body>
</html>