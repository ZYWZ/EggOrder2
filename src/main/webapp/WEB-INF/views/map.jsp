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
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/elec5619">Egg Order System</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" onclick="SearchOnClick()">Search</a>
        </li>
      </ul>
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
                <a class="nav-link" href="map">
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
            <h1 class="h2">Map</h1>
          </div>
          
    <div id="googleMap" style="width:800px;height:400px;"></div>
    
    <div id="classrooms"></div>

<script>
var classrooms = ${classrooms};

buildClassroomsTable(classrooms);

function SearchOnClick() {
	var classroomName = document.getElementsByTagName("input")[0].value;
	console.log(classroomName);
	classrooms.forEach(function(classroom) {
		if (classroom["classroomName"] == classroomName) {
			updateMarkerOnMap(classroom);
			buildClassroomsTable([classroom]);
		}
	});
	
}

function buildClassroomsTable(classrooms) {
	var text = "<table><tr><th>Classroom Name</th><th>Classroom Size</th><th>Address</th></tr>";

	classrooms.forEach(function(classroom) {
		text += "<tr>";
		text += "<td>";
		text += classroom["classroomName"];
		text += "</td>";
		text += "<td>";
		text += classroom["classroomSize"];
		text += "</td>";
		text += "<td>";
		text += classroom["address"];
		text += "</td>";
		text += "</tr>";
	});
	text += "</table>";

	document.getElementById("classrooms").innerHTML = text;
}

function myMap() {
  var mapProp= {
      center:new google.maps.LatLng(-33.8862248,151.1878795),
      zoom:16,
  };
  var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
  classrooms.forEach(function(classroom) {
	  var marker = new google.maps.Marker({position:new google.maps.LatLng(parseLat(classroom),parseLNg(classroom))});
	  marker.setMap(map);
  });
}

function parseLat(classroom) {
	return parseFloat(classroom["location"].split(',')[0]);
}
function parseLNg(classroom) {
	return parseFloat(classroom["location"].split(',')[1]);
}

function updateMarkerOnMap(classroom) {
	var mapProp= {
		center:new google.maps.LatLng(-33.8862248,151.1878795),
		zoom:16,
	};
	var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
	var marker = new google.maps.Marker({position:new google.maps.LatLng(parseLat(classroom),parseLNg(classroom)), animation:google.maps.Animation.BOUNCE});
	marker.setMap(map);
}


</script>



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5pmkDGxqdja_kT9ALjpxvrKvhOZQzu5I&callback=myMap"></script>
    
    </main>
	</div>
</div>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>