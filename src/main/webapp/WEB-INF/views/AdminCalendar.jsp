<% String path = request.getContextPath(); 
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
   
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calendar Page</title>

<link rel='stylesheet' href='resources/fullcalendar-3.9.0/fullcalendar.css' />
<link href="resources/dashboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  
<script src='resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='resources/fullcalendar-3.9.0/fullcalendar.js'></script>


<link rel="stylesheet" href="resources/bootstrap-4.1.3-dist/css/bootstrap.min.css"/>
<link href="resources/dashboard.css" rel="stylesheet">


<script>
window.onload = function() {
    var now = new Date();
    var utcString = now.toISOString().substring(0,19);
    var hour = now.getHours();
    var localDatetime = utcString.substring(0,11) + (hour < 10 ? "0" + hour : hour) + utcString.substring(13,19);
    var datetimeField = document.getElementById("myDatetimeField");
    datetimeField.value = localDatetime;
};


function changeBooking(event) {
	
	var temp = document.createElement("form");
	  temp.method = "post";
	  temp.style.display = "none";
	  
	  var bookingID = document.createElement("input");
	  bookingID.name = "bookingID";
	  bookingID.value = event.id;
	  temp.appendChild(bookingID);
	  
	  var studentID = document.createElement("input");
	  studentID.name = "studentID";
	  studentID.value = event.student;
	  temp.appendChild(studentID);
	  
	  var classroomID = document.createElement("input");
	  classroomID.name = "classroomID";
	  classroomID.value = event.classroom;
	  temp.appendChild(classroomID);
	  
	  var startTime = document.createElement("input");
	  startTime.name = "startTime";
	  startTime.value = event.start.format();
	  temp.appendChild(startTime);
	  
	  var finishTime = document.createElement("input");
	  finishTime.name = "finishTime";
	  finishTime.value = event.end.format();
	  temp.appendChild(finishTime);
	  
	  document.body.appendChild(temp);
	  temp.submit();
	  return temp;
}

function deleteBooking(booking_ID){
	var temp = document.createElement("form");
	  temp.method = "post";
	  temp.style.display = "none";
	  
	  var bookingID = document.createElement("input");
	  bookingID.name = "bookingID";
	  bookingID.value = booking_ID;
	  temp.appendChild(bookingID);
	  
	  document.body.appendChild(temp);
	  temp.submit();
	  return temp;
}

$(function() {     
      var event = [];
      var results = ${result};
      console.log(results);
      
      for (var result in results) {
        //  alert("Value:" + results[result].studentId);
          event.push({
        	  id: results[result].id,
        	  title: 'Study',
        	  start: results[result].startTime,
        	  end: results[result].finishTime,
        	  student: results[result].studentId,
        	  classroom: results[result].classroomId,
      	  })
      }
	
	
	  // page is now ready, initialize the calendar...

	  $('#calendar').fullCalendar({
		  selectable: true,
		  header: {
			  left:   'month,agendaWeek,agendaDay',
			  center: 'title',
			  right:  'today prev,next',
		  },
		  editable: true,
	      eventLimit: true,
		  nowIndicator: true,
		  events: event,
		  eventRender: function(event, element, view){
			    var Student = event.student; 
			    var Classroom = event.classroom;			    
	      },
	      eventMouseover: function(event){
	    	    var Student = event.student; 
			    var Classroom = event.classroom;
		  },
		  eventClick: function(eventObj) {
		      alert('Booked by Student : ' + eventObj.student);		     
		      if(confirm("Do you want to delete this booking?")){
		    	  deleteBooking(eventObj.id);
		      }
		  },
		  eventDrop: function(event, delta, revertFunc) {
				
			    if (!confirm("Are you sure about this change?")) {
			      revertFunc();
			    }else{
			    	changeBooking(event);
			    }

			  }
	  	  /*select: function(startDate, endDate) {
          	alert('selected ' + startDate.format() + ' to ' + endDate.format());
          }*/
	  });  
	  
});

$(document).ready(function() {
    $('#notEmptyForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            studentID: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required'
                    }
                }
            }
        }
    });
});
	

</script>


</head>
<body>
<!-- Add booking Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4><span class="glyphicon glyphicon-lock"></span>Add a booking</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>         
        </div>
        <div class="modal-body">
          <form role="form" method="post" id="notEmptyForm">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span>Input your start time</label>
              	<input type="datetime-local" id="myDatetimeField" class="form-control" name="startTime">
            </div>
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span>Input your finish time</label>
              <input type="datetime-local" class="form-control" name="finishTime" placeholder="YYYY-MM-DD HH-MM-SS">
            </div>
            <hr/>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Submit</button>
          </form>
        </div>
      </div>
      
    </div>
  </div> 
<!-- End of Add booking Modal -->

	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="admin">Egg Order System</a>
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="logout">Log out</a>
        </li>
      </ul>
    </nav>

<div class="container-fluid">
      <div class="row">
                
    	
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">             
          	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">        		
            	<h1 class="h2">Admin Calendar for classroom ${classroomID}</h1>          	
          	</div>
          	
 			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add a booking</button>
 			<hr/>		
 			
    		<div id='calendar'></div> 	  
    		
    	</main>
	</div>
</div>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>


