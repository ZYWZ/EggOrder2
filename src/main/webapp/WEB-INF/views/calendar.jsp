<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
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
$(function() {
	
	var event = [
        {
	          title: 'Business Lunch',
	          start: '2018-10-03T13:00:00',
	          constraint: 'businessHours',
	          Student: '1111',
	          Classroom: '123456'
	        },
	        {
	          title: 'Meeting',
	          start: '2018-10-13T11:00:00',
	          constraint: 'availableForMeeting', // defined below
	          color: '#257e4a',
	          Student: '1111',
		      Classroom: '123456'
	        },
	        {
	          title: 'Conference',
	          start: '2018-10-18',
	          end: '2018-10-20',
	          Student: '1111',
		      Classroom: '123456'
	        }];
	event.push({
        start: '2018-10-24',
        end: '2018-10-28',
        overlap: false,
        rendering: 'background',
        color: '#ff9f89'
      },
      {
        start: '2018-10-06',
        end: '2018-10-08',
        overlap: false,
        rendering: 'background',
        color: '#ff9f89'
      });
	
/*	var event = [
		{
			
		}
	]*/
	
	
	  // page is now ready, initialize the calendar...

	  $('#calendar').fullCalendar({
		  selectable: true,
		  header: {
			  left:   'month,agendaWeek,agendaDay',
			  center: 'title',
			  right:  'today prev,next',
		  },
		  nowIndicator: true,
		  events: event,
		  eventRender: function(event, element, view){
			    var Student = event.Student; 
			    var Classroom = event.Classroom;			    
	      },
	      eventMouseover: function(event){
	    	    var Student = event.Student; 
			    var Classroom = event.Classroom;
		  }
	  	  /*select: function(startDate, endDate) {
          	alert('selected ' + startDate.format() + ' to ' + endDate.format());
          }*/
	  })

	});
</script>


</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/elec5619">Egg Order System</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign in</a>
        </li>
      </ul>
    </nav>

<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">         
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="home"></span>
                  Dashboard 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="calendar">
                  <span data-feather="calendar"></span>
                  Calendar <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="map"></span>
                  Map
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="users"></span>
                  Profile
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="layers"></span>
                  Comment
                </a>
              </li>         
            <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="bar-chart-2"></span>
                  Analyze
                </a>
              </li>
			</ul>
            
          </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Calendar</h1>
          </div>
          
    <!--     <h3>Bookings</h3>
 			<c:forEach items="${model.bookings}" var="book">
 				<c:out value="${book.studentId}"/> 
 				<i>$<c:out value="${book.classroomId}"/></i> 
 				<c:out value="${book.bookingDate}"/>
 				<c:out value="${book.startTime}"/> 
 				<c:out value="${book.finishTime}"/> 
 				<br><br>
 			</c:forEach>--> 
 			<h3>${result.get(0).getStudentId()}</h3>
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


