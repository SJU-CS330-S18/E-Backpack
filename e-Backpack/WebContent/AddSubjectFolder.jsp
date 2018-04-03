<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
</head>
<body>

<button id="modalBtn" class="button">Click Here</button>



<div id="SimpleModal" class="modal">
	<div class="modal-content">
		<span class="closeBtn">&times;</span>
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

<script src = "modalFunc.js"></script>
</body>
</html>