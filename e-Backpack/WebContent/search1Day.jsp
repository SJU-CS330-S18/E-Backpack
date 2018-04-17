<%@ page language="java" import="java.sql.*,entity.*, java.util.*"%>
<jsp:useBean id="student" class= "entity.Student" scope="session"/> 
<jsp:setProperty name="student" property="*"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="modalStyle.css"/>
<link rel="stylesheet" type="text/css" href="e-BP.css"/>
<head>
<meta content="text/html;
		http-equiv="content-type">
		<meta charset="utf-8">
		<meta name ="viewport" content= "width=device-width, initial -scale=1">
		   <link rel="styleshe" type='text/css' href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bookstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bookstrap/3.3.7/js/bookstrap.min.js"></script>
		  
		  
		  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
		  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepiecker3.min.css">
		  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/booktstrap-datepicker.min.js"></script>
<title>Jump To...</title>
<style type="text/css">
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

</style>        
</head>
<body>



<!-- This title is not the same as the others because of the modal HTML  -->
 <font size="120">e-Backpack </font>

<div class="container">
<div class="row">
		<div class="col-md-4 form-group">
		<label>Jump To</label>
		<div class="input-group input-append date" id ="dateRangePicker">
			<input type="text" class ="form-control" name="date">
			<span class ="input-group-addon add-on"><span class="glyphicon-calendar"></span></span>
</div>
</div>
</div>< /div>

<script>
$(document).ready(function(){
	$('$dateRangePicker')
	.datepicker{(
			format: 'mm/dd/yyyy',
			startDate:'01/01/2018',
			endDate:'12/30/2028'
			)};
			
});
</script>			
       

</body>
</html>