<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="e-BP.css"/>

<style>
<!-- creating tables design -->
table.GeneratedTable {
	width: 100%;
	background-color: #000000;
	border-collapse: collapse;
	border-width: 1px;
	border-color: #000000;
	border-style: solid;
	color: #ffffff;
}

table.GeneratedTable td, table.GeneratedTable th {
	border-width: 1px;
	border-color: #000000;
	border-style: solid;
	padding: 3px;
}

table.GeneratedTable thead {
	background-color: #000000;
}


<!-- creating banners design -->
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

<!-- script to delete row -->
<script>
	function SomeDeleteRowFunction(o) {
		//no clue what to put here?
		var p = o.parentNode.parentNode;
		p.parentNode.removeChild(p);
	}
</script>
<html>
<body>

<!-- adding banner to page -->
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
	<p style="text-align: center;">Folder Name</p>

	<p>
		​Files&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="ImportFile" type="button" value="Import" />
	</p>


	<table class="GeneratedTable">

		<tbody>
			<%//insert while loop for ever file in folder %>
    <tr>
    <!-- area where pulling file info an placing on page should happen -->
    <!-- sprint 4 task-->
    <td>FileName</td>
    <td>Date</td>
    <td>Type</td>
    <td>Size</td>
    <td><input name="DownloadFile" type="button" value="Download" /></td>
    <td><input type="button" value="X" onclick="SomeDeleteRowFunction(this)"></td>
    </tr>
    </tbody>
  
		
	</table>



	<p>&nbsp;</p>

	<p style="text-align: center;">&nbsp;</p>
</body>
</html>
