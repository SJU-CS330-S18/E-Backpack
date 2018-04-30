<!-- JSP Page to represent the Folder UI. This UI page is a place where the
user can see their current folders.  -->

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
	width: 250px;
	height: 300px;
	background-color: white;
	box-shadow: 10px 10px 5px #333333;
	text-align: center;
	margin: 20px;

	}
	


</style>
   	<!-- Page Title -->  	  
	<head>
		<meta content="text/html; charset=ISO-8859-1"
		http-equiv="content-type">
				<title >Folder Menu</title>
	</head>
	
	
	
	<body>
	<!-- Implement Banner-->
	<div id="banner">
<!--Sidebar navigation Links -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
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


 e-Backpack 
</div>

<!-- Block containing icon and link to Add a new Folder, jumps to AddSubjectFolder.jsp page -->
<div id="holdingblock">
<br>
			<a href="AddSubjectFolder.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJZ4Uesj_ZEC-sLUuTPCI5fBaBfN_iX0Erscqlz9ACtD_pPUIovg"></a>
			<br><br> <a href="AddSubjectFolder.jsp">Add New Folder</a>
</div>

<div id="holdingblock">
<br>
			<tbody>
			<tr>
				<td style="vertical-align: top;"><b>Current Folders:</b><br>
				</td>
				<td style="vertical-align: top;"> <br>
				</td>
			</tr>
			
			<tr>
				<td style="vertical-align: top;">
					<form method="post" action="FolderUI.jsp" name="folder">
					 
					<input id = "folerBtn" value="My Folder" name="folder" type="submit">
					</form>				
						
				</td>
				<td>

				</td>
			</tr>
		</tbody>
			
	</table>
	
</div>




	</body>
</html>