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
<title>Profile Page</title>

<link rel='stylesheet' href='resources/fullcalendar-3.9.0/fullcalendar.css' />
<link href="resources/dashboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  
<script src='resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='resources/fullcalendar-3.9.0/fullcalendar.js'></script>
<link rel='stylesheet' href='resources/dashboardTable.css' />


<link rel="stylesheet" href="resources/bootstrap-4.1.3-dist/css/bootstrap.min.css"/>
  <link href="resources/dashboard.css" rel="stylesheet">
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(odd) {
    background-color: #dddddd;
}

p {
	font-family: arial, sans-serif;
	font-size: 15px;
}
</style>

</head>
<body>


<!-- Add booking Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4><span class="glyphicon glyphicon-lock"></span>Cancel this booking</h4>   
        </div>
        <div class="modal-body">
          <form role="form" method="post" id="deleteForm">
            <div class="form-group">
              <label>Do you really want to cancel this booking?</label>
            </div>
            <hr/>
            
            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Yes</button>
          </form>
        </div>
      </div>
      
    </div>
  </div> 
<!-- End of Add booking Modal -->


	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="home">Egg Order System</a>
      </ul>
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="logout">Log out</a>
        </li>
      </ul>
    </nav>

<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">         
              <li class="nav-item">
                <a class="nav-link" href="dashboard">
                  <span data-feather="home"></span>
                  Dashboard 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="calendar">
                  <span data-feather="calendar"></span>
                  Calendar
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="map">
                  <span data-feather="map"></span>
                  Map
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="profile">
                  <span data-feather="users"></span>
                  Profile <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="layers"></span>
                  Comment
                </a>
              </li>         
            <li class="nav-item">
                <a class="nav-link" href="analyze">
                  <span data-feather="bar-chart-2"></span>
                  Analyze
                </a>
              </li>
			</ul>
            
          </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 id="user_name_profile">Profile</h1>
          </div>
    <div>
    
    <h4 id ="profile_name">Name:${profile_name}</h4>
    <h4 id = "profile_birthday">Birthday:${profile_birthday}</h4>
    <h4 id = "profile_email">Email:${profile_email}</h4>
    </div>
    <div id="listBox">
    <table>
     		 <thead>
     		 <tr>New Booking</tr>
             	 <th>Room ID</th>
             	 <th>Booking Date</th>
             	 <th>Start Time</th>
             	 <th>End Time</th>
             	 <th>Cancel</th>
      		</thead>
      		<tbody id="newBooking">
     		</tbody>
  		</table>
    </div>
    <div id="listBox">
    <table>
     		 <thead>
     		 <tr>Old Booking</tr>
             	 <th>Room ID</th>
             	 <th>Booking Date</th>
             	 <th>Start Time</th>
             	 <th>End Time</th>
             	 <th>Comment</th>
      		</thead>
      		<tbody id="oldBooking">
     		</tbody>
  		</table>
    </div>
    
    <script>
    
    $(function() {
    	/* var booking = ${result} */
    	var j = 0, k = 0;
    	/* var oldBooking, newBooking; */
    	
    	
		var oldBookingTable = document.getElementById("oldBooking"); 
		var newBookingTable = document.getElementById("newBooking"); 
		
  		/* for(var i = 0; i < booking.length;i++){
  			var result = booking[i].bookingDate;
  			/* if(result < currentTime){
  				oldBooking[j] = booking[i]
  				j++;
  			}
  			else{
  				newBooking[k] = booking[i];
  				k++;
  			} */
  			/* oldBooking = booking;
  		} */ 
  		
  		
  		var oldBooking = ${oldBooking}; 
  		createOldBookingTable(oldBookingTable,oldBooking);
  		createNewBookingTable(newBookingTable,newBooking);
  		
  		function createOldBookingTable(body,booking){
  			
  			var oldTable = document.getElementById("oldBooking"); 
  			var oldLen = oldTable.rows.length;
  			for (var i = 1; i < oldLen-1; i++) {
  				oldTable.deleteRow(1);
  		 	}	
  			for (var i = 0; i < oldBooking.length; i++) {
			  	var oldBookingId = oldBooking[i].id;
		    	var newLine = body.insertRow(i);
		    	var n = document.createTextNode(oldBooking[i].classroomId);
		    	newLine.insertCell(0).appendChild(n);
				var n = document.createTextNode(oldBooking[i].bookingDate);
				newLine.insertCell(1).appendChild(n);
				var l = document.createTextNode(oldBooking[i].startTime);
				newLine.insertCell(2).appendChild(l);
				var s = document.createTextNode(oldBooking[i].finishTime);
				newLine.insertCell(3).appendChild(s);
				var btn = document.createElement("input");
				btn.type = "button";
				btn.id = oldBooking[i].id;
				btn.value = "Comment";
				btn.onclick=function (){ 
					 view(this.id);
		              };
		        newLine.insertCell(4).appendChild(btn);
		        console.log(i);
		  } 
  		}
		function view(id){
			 window.location.replace("comment/"+id);
		}
  		  
  		
  		
    function createNewBookingTable(body,booking){
    	 var newBooking = ${newBooking};
  		 var newTable = document.getElementById("newBooking");
  		 var newLen = newTable.rows.length;
  		 var newBooking;
  		 var j=0;
  		 for (var i = 0; i < newLen-1; i++) {
  			newTable.deleteRow(1);
  		  }
  		
  		 
  		for (var i = 0; i < newBooking.length; i++) {
			  	var newBookingId = newBooking[i].id;
		    	var newLine = body.insertRow(i);
		    	var n = document.createTextNode(newBooking[i].classroomId);
		    	newLine.insertCell(0).appendChild(n);
				var n = document.createTextNode(newBooking[i].bookingDate);
				newLine.insertCell(1).appendChild(n);
				var l = document.createTextNode(newBooking[i].startTime);
				newLine.insertCell(2).appendChild(l);
				var s = document.createTextNode(newBooking[i].finishTime);
				newLine.insertCell(3).appendChild(s);
				var btn = document.createElement("input");
				btn.type = "button";
				btn.id =newBooking[i].id;
				btn.line = i;
				btn.value = "Cancel";
				btn.type = "button";
				btn.onclick=function (){ 
					 cancel(this.id,this.line);
		              }; 
		              newLine.insertCell(4).appendChild(btn);
		  } 
  		}
    
    	function cancel(id,line){
    		
    		var flag = confirm("Do you want to cancel this booking?");
        	if(flag){
        		var myForm = document.createElement("form");
        		myForm.method = "post";
        		myForm.action = "./profile/delete/"+id;
        		var myInput = document.createElement("input");
        		myInput.setAttribute("booking_id",id);
        		myForm.appendChild(myInput);
        		
        		document.body.appendChild(myForm);
        		myForm.submit();
        		document.body.removeChild(myForm);
        	}else{
        		
        	}

    		
    		/* var newTable = document.getElementById("newBooking");
    		newTable.deleteRow(line); */
		} 
    })
    
    </script>

    
    </main>
	</div>
</div>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>