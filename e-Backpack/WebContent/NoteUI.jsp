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
	height: 600px;
	background-color: white;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
	margin-left: 25%;

	}
 
.bordered {
    border: 1px solid;
}
 
.number {
    width: 64px;
}
</style>
<body>

<div id="banner">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
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
            <label>NoteBook:</label>
            <input id="inputNootbookName" ></input>
        </div>
     
    </div>
 
    <div id="divNoteList" class="bordered">
        <label>Notes:</label>
        <div>
            <button >New</button>     
            <button >Remove Selected</button>
        </div>
        <select id="selectDocumentsInProject" style="width:100%" size="10" onchange=""></select>
    </div>
 
    <div id="divDocumentSelected" class="bordered">
        <div><label>Document Selected:</label></div>
        <div>
            <label>Name:</label>
            <input id="inputDocumentSelectedName" onchange="inputDocumentSelectedName_Changed(this);"></input>
            <button onclick="buttonDocumentSelectedSave_Clicked();">Save</button>
           
        </div>
        <div></div>
        <div><textarea id="textareaDocumentSelectedContents" style="width:95%" rows="20" onchange="textareaDocumentSelectedContents_Changed(this);" onkeyup="textareaDocumentSelectedContents_CursorMoved(this);" onmouseup="textareaDocumentSelectedContents_CursorMoved(this);"></textarea></div>
    </div>
 
       
        
          
 
    </div>
 </div>

</body>
</html>