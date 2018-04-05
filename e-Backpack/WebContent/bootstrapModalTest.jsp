<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>add Event popup</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
 $(document).ready(function(){
     $("#addEventBtn").click(function(){
         $("#addEventModal").modal("show");
     });
 });
 $("submitBtn2").on("click", function setTest(){
	 var test = $("#addEventModal #Title").val();
	 $(".center #Title").val(test);
 });


</script>
</head>
<body>

<div class="container">
  <h2>Activate Modal with JavaScript</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" id="addEventBtn">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="addEventModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Create New Event</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
						<p class="center">
							<label>Event Title:</label> <input type ="text" id="Title" class="event-title"
								name="Title" value="">
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Description:</label> <textarea rows="10" cols = "30" type ="text"id="descText" class="event-desc"
								name="Description" value=""></textarea>
						</p>
					</div>
					<div class="form-group">
						<p class="center">
							<label>Date:</label> <input type = "text" class="event-date"
								name="Date" value="">
						</p>
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<p class="center"> -->
<!-- 							<label>Start Time</label> <input type = "text" class="event-start" -->
<!-- 								name="Timestart" value=""> -->
<!-- 								<label>AM</label><input type = "radio" id ="endAM" name="startAMPM"> -->
<!-- 								<label>PM</label><input type = "radio" id ="endPM" name="startAMPM"> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<p class="center"> -->
<!-- 							<label>End Time</label> <input type = "text" class="event-end" -->
<!-- 								name="Timeend" value=""> -->
<!-- 								<label>AM</label><input type = "radio" id ="endAM" name="endAMPM"> -->
<!-- 								<label>PM</label><input type = "radio" id ="endPM" name="endAMPM"> -->
							
<!-- 						</p> -->
<!-- 					</div> -->
					<div class="form-group">
						<p class="center">
							<label>Location:</label> <input type = "text" id="Location" class="event-location"
								name="Event Location" value="">
						</p>
					</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id = "submitBtn" onclick = "setTest()">submit</button>
          <button type="button" class="btn btn-default"  id = "submitBtn2" onclick = "setTest()">submit2</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>


</body>
</html>