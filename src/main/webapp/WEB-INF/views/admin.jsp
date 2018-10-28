<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>

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
</head>
<body>
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/elec5619">Egg Order System</a>
      
    <hr/>
    
    <div id="classrooms">
    <div id="listBox">
  		<table id="classTable">
     		 <thead>
             	 <th>Id</th>
             	 <th>Name</th>
             	 <th>Comment</th>
             	 <th>Booking</th>
             	 <th>Delete</th>
      		</thead>
      		<tbody id="tbody">
     		</tbody>
  		</table>
	</div></div>

    </form>
    </main>
	</div>
      
   <script>
   $(function() {
		var tb = document.getElementById("tbody");
		var classTable = document.getElementById("classTable");
	 	var rooms = ${result};
	 	var matchNum=0;
	  	createTable(tb,rooms);
	  
		function createTable(body,room){
		  /* var sumRating, numRating;  */
		  var Rtable = document.getElementById("classTable");
		  var len = Rtable.rows.length;
		  for (var i = 0; i < len-1; i++) {
		    Rtable.deleteRow(1);
		  }
		  for (var i = 0; i < room.length; i++) {
			  	var roomId = room[i].classroomId;
		    	var newRoom = body.insertRow(i);
		    	var n = document.createTextNode(room[i].classroomId);
				newRoom.insertCell(0).appendChild(n);
				var n = document.createTextNode(room[i].classroomName);
				newRoom.insertCell(1).appendChild(n);
				var btn1 = document.createElement("input");
				btn1.type = "button";
				btn1.id = roomId;
				btn1.value = "Comment";
				btn1.onclick=function (){ 
					view(this.id);
		              };
				newRoom.insertCell(2).appendChild(btn1);
				var btn2 = document.createElement("input");
				btn2.type = "button";
				btn2.id = roomId;
				btn2.value = "Booking";
				btn2.onclick=function (){ 
					book(this.id);
		              };
				newRoom.insertCell(3).appendChild(btn2);
				
				var btn3 = document.createElement("input");
				btn3.type = "button";
				btn3.id = roomId;
				btn3.value = "Delete";
				btn3.onclick=function (){ 
					deleteClassroom(this.id);
		              };
				newRoom.insertCell(4).appendChild(btn3);
		  } 
		}
		
		 function book(id){
			 //跳转 删除booking 页面
	            window.location.replace("calendar/"+id);
	        }
		 function view(id){
			//跳转 删除comment 页面
	            window.location.replace("AdminComment/"+id);
	        } 
		 function deleteClassroom(id){
			 
			 var flag = confirm("Do you want to delete this classroom?");
	        	if(flag){
	        		var myForm = document.createElement("form");
	        		myForm.method = "post";
	        		myForm.action = "./admin/delete/"+id;
	        		var myInput = document.createElement("input");
	        		myInput.setAttribute("booking_id",id);
	        		myForm.appendChild(myInput);
	        		
	        		document.body.appendChild(myForm);
	        		myForm.submit();
	        		document.body.removeChild(myForm);
	        	}else{
	        		
	        	}
		 }
		
	})
	</script>
</body>
</html>