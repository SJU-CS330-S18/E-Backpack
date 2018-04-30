<!-- JSP Page to represent Add new note UI. This UI page is a place where the
user can input information to add a new note to a selected notebook  -->
<%-- Import java.sql.* and use the Student bean as id: student --%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="student" class="entity.Student" scope="session"/>

<html>
<link rel="stylesheet" type="text/css" href="e-BP.css" />

<style>

/*Top banner element, used throughout project. */
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
/* DIV element used throughout the project to hold other elements, and add contrast from background */
#logginblock{
	width: 600px;
	height: 370px;
	background-color: white;
	background-position:center;
	margin:auto;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
}
/* Stylized buttons*/
#Confirm{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#Confirm:hover{
	background: #babdb6;
}
</style>
<%-- Additional checking to ensure user is logged in--%>
<script>function myFunction() {
    var x = document.getElementById("pass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
        
    }
}</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Note</title>
</head>
<!-- Implement Banner-->
<div id="banner">
<!--Sidebar navigation Links -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="notebookMenu.jsp">Notebook Menu</a>
  <a href="userMenu.jsp">Menu</a>
  <a href="Logout.jsp">Log Out</a>
</div>

<span style="font-color: white;font-size:45px;cursor:pointer; " onclick="openNav()">&#9776;</span>
<!-- Javascript element to control sidebar menu, where user can navigate to other pages-->
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}0
</script>
 e-Backpack 
</div>
<body>

<div id="logginblock">
<form method="post" action="addNote_action.jsp" name="NoteForm">
    <div id="divDocumentSelected" class="bordered">
        <div>
        	<label>Title of new <%= session.getAttribute(request.getParameter("courseID"))%> note: </label>
            <input name="courseID" type="hidden" value=<%= request.getParameter("courseID")%>>
            <!-- name of selected note that is being viewed -->
             <input name = "nameOfNote" id= "name" value ="" >
            <!-- <input name = "dateOfNote" id="date" value="">
            <!-- button to save any new notes or changes to a note -->
            
           
        </div>
        <div>
        
        </div>
        <!-- text are for selected notes contents used for reading and editing and creating a note -->
        <div><textarea name = "noteContent"  id = "content" style="width:70%" rows="20"></textarea>
        </div>
        <input style="color: black;" id = "Confirm" name="Confirm" value="Add Note" type="submit">
         </div>
        </form>
        </div>
</body>
</html>