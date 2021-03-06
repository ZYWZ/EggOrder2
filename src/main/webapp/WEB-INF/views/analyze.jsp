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

<!-- Google Chart -->
<script language="JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src='resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='resources/fullcalendar-3.9.0/fullcalendar.js'></script>
<script src='resources/js/analyze.js'></script>



<link rel="stylesheet" href="resources/bootstrap-4.1.3-dist/css/bootstrap.min.css"/>
<link rel='stylesheet' href='resources/fullcalendar-3.9.0/fullcalendar.css' />
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
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="dashboard">Egg Order System</a>
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
			        <li class="li_1"><button class="navigator_1" id="bbt_button">Booking Peak-Time</button></li>
			        <li class="li_1"><button class="navigator_1" id="rc_button">Rating Contribution</button></li>
			        <li class="li_1"><button class="navigator_1" id="cc_button">Classroom Comparison</button></li>
			    </ul>
			</nav>
<div class="page1 page" id="bbt_chart"><h1 class="h2"></h1></div>

<div class="page2 page" id="rc_chart"><h1 class="h2"></h1>
<a>ClassroomId</a>
<select id=cid>
       <option value=1>1</option>
       <option value=2>2</option>
       <option value=3>3</option>
       <option value=4>4</option>
       <option value=5>5</option>
       <option value=6>6</option>
       <option value=7>7</option>
       <option value=8>8</option>
       <option value=9>9</option>
</select>
<button id="rc_show_button">Show</button>
<div id="rc_showchart"><h1 class="h2"></h1></div>
</div>

<div class="page3 page" id="cc_chart"><h1 class="h2"></h1></div>
    
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
        $("#bbt_chart").css({"display": "block"});
    });
    $("#rc_button").on("click", function() {
        $(".page").css({"display": "none"});
        $("#rc_chart").css({"display": "block"});
    });
    $("#cc_button").on("click", function() {
        $(".page").css({"display": "none"});
        $("#cc_chart").css({"display": "block"});
    })

});
</script>
<script>

$(document).ready(function () {
    $("#bbt_button").click(function (event) {
          event.preventDefault();
       	  var bbt_list=${BBT};
          var data = [
        	['Time',  'Booking Number'],
            ['08:00',  Number(bbt_list[0])],
            ['09:00',  Number(bbt_list[1])],
            ['10:00',  Number(bbt_list[2])],
            ['11:00',  Number(bbt_list[3])],
            ['12:00',  Number(bbt_list[4])],
            ['13:00',  Number(bbt_list[5])],
            ['14:00',  Number(bbt_list[6])],
            ['15:00',  Number(bbt_list[7])],
            ['16:00',  Number(bbt_list[8])],
            ['17:00',  Number(bbt_list[9])],
            ['18:00',  Number(bbt_list[10])],
            ['19:00',  Number(bbt_list[11])],
            ['20:00',  Number(bbt_list[12])]
          ];
         draw_firChart(data)
    })
});

$(document).ready(function () {
    $('#rc_show_button').click(function (event) {
          event.preventDefault();
          var rc_list =${RC};
          var cid = $('#cid').val();
           for(i=0;i<rc_list.length;i++){
        	  if(Number(rc_list[i][0])==Number(cid)){
        		  var rc = new Array();
        		  rc[0] = ['score', 'number'];
        		  rc[1]=['1', rc_list[i][1]];
        		  rc[2]=['2', rc_list[i][2]];
        		  rc[3]=['3', rc_list[i][3]];
        		  rc[4]=['4', rc_list[i][4]];
        		  rc[5]=['5', rc_list[i][5]];
        		  
        		  draw_secChart(rc)
        	  }
          }
    })
});

$(document).ready(function () {
    $("#cc_button").click(function (event) {
          event.preventDefault();
          var cc_list=${CC};
          var cc = new Array();
          cc[0]=['ClassroomID','Score'];
          for(i=0;i<cc_list.length;i++){
        	  cc[i+1] = cc_list[i];
          }
          var data = cc;
		draw_thirdChart(data)
    })
});

function draw_firChart(data) {
    var real_data = google.visualization.arrayToDataTable(data);
    var options = {
        title: 'Booking Peak-Time',
        curveType: 'function',
        legend: { position: 'bottom'},
        width:1100,
        height:600
    };
    var chart = new google.visualization.LineChart(document.getElementById('bbt_chart'));

    chart.draw(real_data, options);
}

function draw_secChart(data) {
    var real_data = google.visualization.arrayToDataTable(data);
    var options = {
        title: 'Rating Contribution',
        legend: { position: 'bottom'},
        width:1100,
        height:600
    };
    var chart = new google.visualization.BarChart(document.getElementById('rc_showchart'));

    chart.draw(real_data, options);
}

function draw_thirdChart(data) {
    var real_data = google.visualization.arrayToDataTable(data);
    var options = {
        title: 'Classroom Comparison',
        legend: { position: 'bottom'},
        width:1100,
        height:600
    };
    var chart = new google.visualization.ColumnChart(document.getElementById('cc_chart'));

    chart.draw(real_data, options);
}
</script>
</body>
</html>


