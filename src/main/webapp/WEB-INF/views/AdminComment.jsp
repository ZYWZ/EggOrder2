<% String path = request.getContextPath(); 
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE html>

<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Comment Page</title>

<link href="resources/dashboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  


<link rel="stylesheet" href="resources/bootstrap-4.1.3-dist/css/bootstrap.min.css"/>
  <link href="resources/dashboard.css" rel="stylesheet">
  <link href="resources/comment/comment.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="home">Egg Order System</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
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
                <a class="nav-link active" href="dashboard">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="calendar">
                  <span data-feather="file"></span>
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
           <h1 class="h2">Comment for classroom ${Id}</h1> 
          </div>
        
 
    
  
	
	<div lang="en-US" class="gitment-container gitment-comments-container">
        <ul class="gitment-comments-list" id ="cmt_main">

        </ul>
    </div>
	
    </main>
	</div>
</div>
</body>
<style>
#text_id
{
display:none;
}
</style>
<script>
$(document).ready(function () {
	var comment = ${comment};
	var str ="";
 	for(i=0;i<comment.length;i++)
		{
 		str += "<li class='gitment-comment'><a class='gitment-comment-avatar'></a><div class='gitment-comment-main'><div class='gitment-comment-header'><a class='gitment-comment-name'>"
            +comment[i].student_id+"&nbsp&nbsp&nbsp&nbsp&nbsp"+
            "</a><span> Post time: "
            +comment[i].post_time+
            "</span><span style='float:right'>Rating score: "
            +comment[i].score+
            "</sapn></div><div class='gitment-comment-body gitment-markdown'><p>"
            +comment[i].comment+
            "</p><form method='post'><input type='text' name = 'studentID' value="
            +comment[i].student_id+
            " style='display:none'><button type='submit' name='delete'>delete</button></form></div></div></li>"
		} 
	$('#cmt_main').html(str)
    });

</script>
</html>
