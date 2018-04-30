<!-- This page will display all the Notes that currently login user has -->
<%@ page language="java" import="java.sql.*,entity.*"%>
<jsp:useBean id="student" class="entity.Student" scope="session"/>
<jsp:setProperty name="student" property="*"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>
 
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
  padding: 0,0,0,0;
}


#holdingblock{
	display: inline-block;
	vertical-align: top;
	width: 810px;
	height: 654px;
	background-color: white;
	text-align: center;
	margin-left:25%;

	}
	
#newNoteBtn{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#newNoteBtn:hover{
	background: #babdb6;
}

#deleteNoteBtn{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#deleteNoteBtn:hover{
	background: #babdb6;
}

#saveBtn{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#saveBtn:hover{
	background: #babdb6;
}

#retireNotebookBtn{
	background: #f3f3f3;
	padding: .4em .4em;
	color: #000;
	border: 0;
	
}

#retireNotebookBtn:hover{
	background: #babdb6;
}


 
.bordered {
    border: 1px solid;
}
 
.number {
    width: 64px;
}

#divNotebookFile{
	background-color: #ffff;
}

#divNoteList{
	background-color: #ffff;
	
}

#divDocumentSelected{
	background-color: #ffff;

}

#testID{
	background-color: #ffff;

} 
</style>
<head>
<!-- Page Title -->
<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Notes</title>

</head>
<body>

<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="notebookMenu.jsp">Notebook Menu</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
  <td align="right" width="690"><a href="Logout.jsp">Logout</a></td></tr><br>
</div>

<span style="font-color: white;font-size:45px;cursor:pointer; " onclick="openNav()">&#9776;</span>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}
 
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

</script>
<!-- This title is not the same as the others because of the modal HTML  -->
 <font size="120">e-Backpack </font>
</div>

<div id ="holdingblock">
 
<div>
    <div id="divNotebookFile" class="bordered">
        <div>
            <label>Notebook: <%=session.getAttribute(request.getParameter("actCourseID"))%></label>
            <%
            String oldName =(String)session.getAttribute(request.getParameter("actCourseID"));
            %>
            <input name = "oldNotebookName" type = "hidden" value = <%= oldName%>>
            <form method = "post" action = "NoteUIRetireNotebook_action.jsp" name = "retireNotebook">
            <input id = "retireNotebookBtn" value = "Retire this Notebook" type = "submit">
            <input name="courseID" type="hidden" value=<%= (String)session.getAttribute(request.getParameter("actCourseID"))%>>
            </form>    
        </div>
     
    </div>
 <!-- section for all notes in selcted notebook -->
    <div id="divNoteList" class="bordered">
        <label>Notes:</label>
        <div>
        <form method = "post" action = "addNewNote.jsp" name = "newNoteForm">
        <!-- button to create a new note  -->
            <input id = "newNoteBtn" value = "Add New Note" type = "submit">
            <input name="addCourseID" type="hidden" value=<%=(String)session.getAttribute(request.getParameter("actCourseID"))%>>
            </form>
            
            <!-- button to delete a selcted note from list of notes --> 
            <button id = "deleteNoteBtn" >Delete selected Note</button>
        </div>
        <%try{ 
    String courseT = (String)session.getAttribute(request.getParameter("actCourseID"));
	ResultSet rs = student.getNotesList(courseT);
%>
        <select id="selectSpecificNoteInNotebook" style="width:100%" size="10" onchange="">
        	<%
			int n=0;
			while(rs.next()){
				session.setAttribute(Integer.toString(n),rs.getString("NOTETITLE"));
			%>
			<option value="<%=rs.getString("NOTETITLE") %>"><%=rs.getString("NOTETITLE") %></option>
			
        	<%n++;
			}
			
			}catch(IllegalStateException ise){
			    out.println(ise.getMessage());
			}
			%>
        </select>
    </div>
 <!-- section for a selected or new note. able read create and change a note -->
    <div id="divDocumentSelected" class="bordered">
        <div><label>Document Selected:</label></div>
        <div>
            <label>Name:</label>
            <!-- name of selected note that is being viewed -->
            <input id="noteTextBox" ></input>
            <!-- button to save any new notes or changes to a note -->
            <button id = "saveBtn"onclick="buttonDocumentSelectedSave_Clicked();">Save</button>
           
        </div>
        <div></div>
        <!-- text are for selected notes contents used for reading and editing and creating a note -->
        <div><textarea id="textareaDocumentSelectedContents" style="width:95%" rows="20"></textarea></div>
    </div>
 
       
        
          
 
    </div>
 </div>

</body>
</html>