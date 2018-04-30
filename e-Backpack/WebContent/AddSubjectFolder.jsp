<!-- JSP Page to represent Add folder UI. This UI page is a place where the
user can input information to be able to add a new folder under their account  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>
 
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
  padding: 0,0,0,0;
}

/* DIV element used throughout the project to hold other elements, and add contrast from background */
#holdingblock{
	display: inline-block;
	vertical-align: top;
	width: 810px;
	height: 300px;
	background-color: white;
	text-align: center;
	margin-left: 25%;

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

<%-- Additional checking to ensure user is logged in--%>
<script>function myFunction() {
    var x = document.getElementById("pass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
        
    }
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Folder</title>
<body>
<!-- Implement Banner-->
<div id="banner">
<!--Sidebar navigation Links -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="folderMenu.jsp">Folder Menu</a>
  <a href="updateProfile.jsp">Update Profile</a>
  <a href="userMenu.jsp">Menu</a>
  <td align="right" width="690"><a href="Logout.jsp">Logout</a></td></tr><br>
</div>

<span style="font-color: white;font-size:45px;cursor:pointer; " onclick="openNav()">&#9776;</span>

<script>
<!-- Javascript element to control sidebar menu, where user can navigate to other pages-->
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

<%-- Container to add a new folder with elements being typed in. The action after is to go to
	AddSubjectFolder_action.jsp. This add action page interacts with the student bean. --%>
<div id ="holdingblock">
 <center>
<div id="inputFields" >
	<div class="modal-content">
		<button id="addEvenFolderBtn" class="button">Add Folder</button>
		<label>Leave options blank if they don't apply</label> 
					<div class="form-group">
						<p class="center">
							<label>Folder subject:</label> <input class="event-info"
								name="Title" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Teacher:</label> <input class="event-info"
								name="Time" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Class Time:</label> <input class="event-info"
								name="Date" value="">
						</p> 
					</div>
			 		</form> 
	</div>
</div>
</center>
<script src = "modalFunc.js"></script>
</body>
</html>