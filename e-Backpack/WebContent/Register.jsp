<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/>

<%  String value = request.getParameter("value");
if(value!=null)
   out.println("PASSWORD DOES NOT MATCH RETYPE PASSWORD");%>
<html>
<link rel="stylesheet" type="text/css" href="e-BP.css" />

<style>


#banner{
  width:100%;
  background-size:880px 680px;
  background-repeat:no-repeat;
  background-position:60% 46%;
  height: 99px;
  background-color: #0A0808;
  color: #b5cce0;
  text-align: center;
  font-size: 72;
}

#logginblock{
	width: 400px;
	height: 250px;
	background-color: white;
	background-position:center;
	margin:auto;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
}
</style>
 </style>
 </head>
 <body bgcolor = "#99ff66">
 <div class ="container">
 <header>
 <h1 align="center"> CREATE YOUR ACCOUNT</h1>
 </header>
<form style=""font-family: Times New Roman,Times,serif";" method="post"action="Register_Action.jsp" name="RegisterForm">
<table align="center">
<!-- <tr> -->
<!-- 	<th align "right"> ID : </th>  -->
<%-- 	<td> <input name="id" size ="25%" height = "100" value= <%=admin.seqcustId()%> readonly></td> --%>
<!-- </tr> -->
<tr>
	<th align "right"> Username : </th> 
	<td> <input name="username" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Firstname : </th> 
	<td> <input name="fname" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Lastname : </th> 
	<td> <input name="lname" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Phone No: </th> 
	<td> <input name="phoneno" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Email Address : </th> 
	<td> <input name="emailad" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Password : </th> 
	<td> <input name="password" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Retype Password : </th> 
	<td> <input name="password2" size ="25%" height = "100" value= "" ></td>
</tr>
<td colspan="4" align ="right">
   <input style="color: black;" name="Confirm" value="Confirm" type="submit">
</td>
 </div>
 </table>
 </form>
</body>
</html>