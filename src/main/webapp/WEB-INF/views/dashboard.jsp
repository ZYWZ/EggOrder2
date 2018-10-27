<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard Page</title>

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

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="dashboard">Egg Order System</a>
      <!-- <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" onclick="SearchOnClick()">Search</a>
        </li>
      </ul> -->
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
                <a class="nav-link active" href=dashboard>
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
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
                <a class="nav-link" href="profile">
                  <span data-feather="users"></span>
                  Profile
                </a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="layers"></span>
                  Comment
                </a>
              </li>    -->      
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
            <h1 class="h2">Dashboard</h1>
          </div>
          <form>
    <div id="searchBox">
	 <input type="search" id="searchInput"/>
 	 <input type="button" id="searchBtn" value ="search"/>
 	 <select name="Filter" id="filter" >
 	   	<option selected>All</option>
   	 	<!-- <option>Fisher</option>
    	<option>Fisher2</option>
   	 	<option>Test1</option>
    	<option>Test2</option>
    	<option>Test3</option>
    	<option>Test4</option> -->
  	</select>
<input type="button" id="filterBtn" value="Filter"/>
	</div>
    <hr/>
    
    <div id="classrooms">
    <div id="listBox">
  		<table id="classTable">
     		 <thead>
             	 <th>Id</th>
             	 <th>Name</th>
             	 <th>Address</th>
             	 <th>Room Size</th>
             	 <!-- <th>Room Rate</th> -->
             	 <th>View Comment</th>
             	 <th>Booking</th>
      		</thead>
      		<tbody id="tbody">
     		</tbody>
  		</table>
	</div></div>

    </form>
    </main>
	</div>
</div>

	<script>
	$(function() {
		var tb = document.getElementById("tbody");
		var select = document.getElementById("filter");
	  	var searchBtn = document.getElementById("searchBtn");
	 	var filterBtn = document.getElementById("filterBtn");
		var classTable = document.getElementById("classTable");
	 	var search = document.getElementById("searchInput");	
	 	var rooms = ${result};
	 	var matchNum=0;
	  	createTable(tb,rooms);
	  	createFilter(select,rooms);
	  
	  searchBtn.onclick=function(){
		    var len = classTable.rows.length;
		    var theRoom=[];
		    var j=0;
		    /* for (var i = 0; i < len-1; i++) {
		      tb.childNodes[i+1].setAttribute("class","none");
		    } */
		   
		    if (search.value) {
		    	if(select.value == "All"){
		   	  	createTable(tb,rooms);
		   	  }
		      for (var i = 0; i < classTable.rows.length-1; i++) {
		        var name = classTable.rows[i+1].cells[1].innerHTML;
		        var index = name.indexOf(search.value);
		        if (index>=0) {
		          /* tb.childNodes[i+1].setAttribute("class","yellow");
		          matchNum++; */
		          theRoom[j] = rooms[i];
		          matchNum++;
		          j++;
		        }
		      }
		      if (matchNum==0) {
		        alert("No Match!");
		      }
		      else{
		    	  console.log(matchNum);
		    	  matchNum = 0;
		  	  	createTable(tb,theRoom);
		      }
		    }
		    else {
		      alert("Input Name to Search");
		    }
		  }
	  	filterBtn.onclick=function(){
		    var match=[];
		    var theRoom=[];
		    var rooms = ${result};
		    /* var rate = ${rate}; */
		    var len = classTable.rows.length;
		    for (var i = 0; i < len-1; i++) {
		    	classTable.deleteRow(1);
		    }
		    if (select.value=="All") {
		      createTable(tb,rooms);
		    }
		    else {
		        var j=0;
		        for (var i = 0; i < rooms.length; i++) {
		          if (select.value==rooms[i].address) {
		            match[j]=rooms[i];
		            j++;
		          }
		        }
		        if(search.value){
		          var k=0;
		          for (var i = 0; i < match.length; i++) {
		            var index = match[i].classroomName.indexOf(search.value);
		            if (index>=0) {
		              theRoom[k]=match[i];
		              k++;
		            }
		          }
		          if (theRoom.length) {
		            createTable(tb,theBook);
		            for (var i = 0; i < theBook.length; i++) {
		              tb.childNodes[i+1].setAttribute("class","yellow");
		            }
		          }
		          else {
		            alert("No Match!");
		          }
		        }
		        else {
		          createTable(tb,match);
		        }
		    }
	  	
		}
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
				var l = document.createTextNode(room[i].address);
				newRoom.insertCell(2).appendChild(l);
				var s = document.createTextNode(room[i].classroomSize);
				newRoom.insertCell(3).appendChild(s);
				
				/* for(var j = 0; j < rate.length; j++){
					sumRating = sumRating + rate[j].score;
					numRating ++;
				}
				var aveRating = sumRating/numRating;
				var r = document.createTextNode(rate); */
				/* var r = document.createTextNode(room[i].classroomSize);
				newRoom.insertCell(4).appendChild(r); */
				var btn1 = document.createElement("input");
				btn1.type = "button";
				btn1.id = roomId;
				btn1.value = "View Comment";
				btn1.onclick=function (){ 
					view(this.id);
		              };
				newRoom.insertCell(4).appendChild(btn1);
				var btn2 = document.createElement("input");
				btn2.type = "button";
				btn2.id = roomId;
				btn2.value = "Book This Room";
				btn2.onclick=function (){ 
					book(this.id);
		              };
				newRoom.insertCell(5).appendChild(btn2);
				 console.log(roomId); 
		  } 
		}
		 function book(id){
	            window.location.replace("calendar/"+id);
	        }
		 function view(id){
	            window.location.replace("ViewComment/"+id);
	        } 
		
		
		function createFilter (filter,option){
			var address = [];
			address[0] = option[0].address;
			var have = false;
			var k = 1;
			/* for(var i =0; i < rooms.length;i++){
				for(var j = 0;j<address.length;j++){
					if(address[j] == option[i].address){
						have = true;
						}	
				}
				if(!have){
					adress[k] = option[i].address;
					k++;
					have = false;
				}
			} */
			for(var i =0;i<option.length;i++){
				address[i] = option[i].address;
			}
			
		   
		   
			for(var i2 = 0; i2 <address.length;i2++){
				var option = document.createElement('option'); 
				option.text = address[i2];
				option.value = address[i2];
				filter.add(option, null); 
			}
			
			var opts = document.getElementById('filter').options;
	        var obj = new Object(), index = 0;
	        while (index < opts.length) {
	            if (opts[index].text in obj) opts[index] = null;
	            else {
	                obj[opts[index].text] = opts[index].text;
	                index++;
	            }
	        }
	        obj = null;
		}
	})
	</script>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>