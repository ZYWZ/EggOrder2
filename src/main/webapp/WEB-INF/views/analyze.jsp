<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calendar Page</title>

<link rel='stylesheet' href='resources/fullcalendar-3.9.0/fullcalendar.css' />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  
<script src='resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='resources/fullcalendar-3.9.0/fullcalendar.js'></script>


<link rel="stylesheet" href="resources/bootstrap-4.1.3-dist/css/bootstrap.min.css"/>

  <link href="resources/dashboard.css" rel="stylesheet">

 <style>
.ul_1 {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: 1px solid #e7e7e7;
    background-color: #f3f3f3;
}

.li_1 {
    float: left;
}

.navigator_1 {
    display: block;
    color: #666;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.navigator_1:hover {
    background-color:  #ddd;
}

.page{
    width: 100%;
    /*height: 50px;*/
    display: none;
    float: left;
    background-color: aliceblue;
}

.page1 {
    display: block;
}

.page2 {

}

.page3 {

}
</style>
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="home">Egg Order System</a>
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
                <a class="nav-link" href="home">
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
                <a class="nav-link active" href="analyze">
                  <span data-feather="bar-chart-2"></span>
                  Analyze <span class="sr-only">(current)</span>
                </a>
              </li>
			</ul>
            
          </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Analyze</h1>
          </div>
             <nav class="nav_1">
			    <ul class="ul_1">
			        <li class="li_1"><a class="navigator_1" id="bbt_button">Booking Peak-Time</a></li>
			        <li class="li_1"><a class="navigator_1" id="rc_button">Rating Contribution</a></li>
			        <li class="li_1"><a class="navigator_1" id="cc_button">Classroom Comparison</a></li>
			    </ul>
			</nav>
<div class="page1 page" id="bbt"><h1 class="h2">bbt</h1></div>

<div class="page2 page" id="rc"><h1 class="h2">rc</h1></div>

<div class="page3 page" id="cc"><h1 class="h2">cc</h1></div>
    
    </main>
	</div>
</div>

<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
<script>
$(document).ready(function() {
    $("#bbt_button").on("click", function() {
        $(".page").css({"display": "none"});
        $("#bbt").css({"display": "block"});
    });
    $("#rc_button").on("click", function() {
        $(".page").css({"display": "none"});
        $("#rc").css({"display": "block"});
    });
    $("#cc_button").on("click", function() {
        $(".page").css({"display": "none"});
        $("#cc").css({"display": "block"});
    })

});
</script>
</body>
</html>


