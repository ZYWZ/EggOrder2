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
<title>Map Page</title>

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
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="dashboard">Egg Order System</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search Classroom" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" onclick="searchOnClick(); return false;" href="#">Search</a>
        </li>
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
                <a class="nav-link" href="calendar/1">
                  <span data-feather="calendar"></span>
                  Calendar 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="map">
                  <span data-feather="map"></span>
                  Map <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="profile">
                  <span data-feather="users"></span>
                  Profile
                </a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link" href="comment">
                  <span data-feather="layers"></span>
                  Comment
                </a>
              </li>  -->        
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
            <h1 class="h2">Map</h1>
          </div>
          
    <div id="googleMap" style="width:100%;height:600px;"></div>
    
    <div id="classrooms"></div>
    

<script>

	var classrooms = ${classrooms};
	
	console.log(classrooms);

	var map;

	var markers = [];

	var myLocation;

	buildClassroomsTable(classrooms);

	function searchOnClick() {
		var keyword = document.getElementsByTagName("input")[0].value;
		if (keyword != "") {
			matchedClassrooms = classrooms.filter(function(classroom) {
				if (classroom["classroomName"].toLowerCase().includes(keyword) || classroom["address"].toLowerCase().includes(keyword))
					return classroom;
			});

			updateMarkerOnMap(matchedClassrooms);
			buildClassroomsTable(matchedClassrooms);

		} else {
			initMap();
			buildClassroomsTable(classrooms);
		}

	}

	function buildClassroomsTable(classrooms) {
		var text = "<table><tr><th>Classroom Name</th><th>Classroom Size</th><th>Address</th><th>Actions</th></tr>";

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
			text += "<td>";
			text += "<a value=\"" + classroom["location"] + "\" onclick=\"getDirectionsOnClink(\'"+ classroom["location"] + "\'); return false;\" href=\"#\">Get Directions</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
			text += "<a href=\"ViewComment/"+classroom["classroomId"]+"\">View Comment</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			text += "<a href=\"calendar/"+classroom["classroomId"]+"\">Book it</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			text += "</td>";
			text += "</tr>";
		});
		text += "</table>";

		document.getElementById("classrooms").innerHTML = text;
	}

	function initMap() {
		var mapProp = {
			center : new google.maps.LatLng(-33.88811,151.19426),
			zoom : 15,
		};
		map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

		classrooms.forEach(function(classroom) {
			var marker = makeMarkerForClassroom(classroom, map);
			marker.setAnimation(google.maps.Animation.DROP);
			markers.push(marker);
		});

		putUserLocationInfoWindow(map);
	}

	function parseLat(classroom) {
		return parseFloat(classroom["location"].split(',')[0]);
	}
	function parseLNg(classroom) {
		return parseFloat(classroom["location"].split(',')[1]);
	}

	function updateMarkerOnMap(classrooms) {
		clearMarkers();
		classrooms.forEach(function(classroom) {
			var marker = makeMarkerForClassroom(classroom);
			marker.setAnimation(google.maps.Animation.BOUNCE);
		});
		putUserLocationInfoWindow(map);
	}

	function makeMarkerForClassroom(classroom) {
		var infowindow = new google.maps.InfoWindow({
			content : "<h4>" + classroom["classroomName"] + "</h4>"
					+ "<p>Classroom size: " + classroom["classroomSize"]
					+ "</p><p>Address: " + classroom["address"] + "</p>"
					+ "<a value=\"" + classroom["location"]
					+ "\" onclick=\"getDirectionsOnClink(" + "\'"
					+ classroom["location"] + "\'"
					+ "); return false;\" href=\"#\">Get Directions</a><br>"
					+ "<a href=\"ViewComment/"+classroom["classroomId"]+"\">View Comment</a><br>"
					+ "<a href=\"calendar/"+classroom["classroomId"]+"\">Book it</a>"
		});
		var marker = new google.maps.Marker({
			position : new google.maps.LatLng(parseLat(classroom),
					parseLNg(classroom)),
			map : map,
			title : classroom["classroomName"]
		});
		marker.addListener('click', function() {
			infowindow.open(map, marker);
		});
		return marker;
	}

	function putUserLocationInfoWindow(map) {
		infoWindow = new google.maps.InfoWindow;
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				myLocation = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				infoWindow.setPosition(myLocation);
				infoWindow.setContent('You are here!');
				infoWindow.open(map);
			});
		}

	}

	function getDirectionsOnClink(location) {
		var directionsService = new google.maps.DirectionsService;
		var directionsDisplay = new google.maps.DirectionsRenderer;
		directionsDisplay.setMap(map);
		directionsService.route({
			origin : myLocation,
			destination : {
				lat : parseFloat(location.split(',')[0]),
				lng : parseFloat(location.split(',')[1])
			},
			travelMode : 'WALKING'
		}, function(response, status) {
			if (status === 'OK') {
				directionsDisplay.setDirections(response);
			} else {
				window.alert('Directions request failed due to ' + status);
			}
		});

	}

	function setMapOnAll(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
	}

	function clearMarkers() {
		setMapOnAll(null);
	}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5pmkDGxqdja_kT9ALjpxvrKvhOZQzu5I&callback=initMap"></script>


    
    </main>
	</div>
</div>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>