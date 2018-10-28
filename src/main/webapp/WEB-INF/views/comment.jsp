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
  
  <script type="text/javascript">
  
  function rate(obj,oEvent){
	
	var imgSrc = 'resources/comment/s0.png'; 
	var imgSrc_2 = 'resources/comment/s1.png';
	if(obj.rateFlag)return;
	var e = oEvent || window.event;
	var target = e.target || e.srcElement; 
	var imgArray = obj.getElementsByTagName("img");
	for(var i=0;i<imgArray.length;i++){
	  imgArray[i]._num = i;
	  imgArray[i].onclick=function(){
	  if(obj.rateFlag) return;
	  obj.rateFlag=true;
	  var node = document.getElementById("text_id");
	  node.value=this._num+1
	  };
	
	}
	if(target.tagName=="IMG"){
	  for(var j=0;j<imgArray.length;j++){
	  if(j<=target._num){
	   imgArray[j].src=imgSrc_2;
	  } else {
	   imgArray[j].src=imgSrc;
	  }
	  }
	} else {
	  for(var k=0;k<imgArray.length;k++){
	  imgArray[k].src=imgSrc;
	  }
	}
	}
  </script>
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
                <a class="nav-link" href="comment">
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
           <h1 class="h2">Comment for classroom ${Id}</h1> 
          </div>
        
 
    
    <p onmouseover="rate(this,event)">
 <img src="resources/comment/s0.png" title="Worst" width="80px" height="80px"/>
 <img src="resources/comment/s0.png" title="bad" width="80px" height="80px"/>
 <img src="resources/comment/s0.png" title="so so" width="80px" height="80px"/>
 <img src="resources/comment/s0.png" title="good" width="80px" height="80px"/>
 <img src="resources/comment/s0.png" title="best" width="80px" height="80px"/>
 </p>
	 <form  method="post">
		 <input type="text" id="text_id"  name="score" readonly="readonly"/>
<!-- 		 <p>Student ID: </p>
		 <input type="text" id="text111"  name="student_id" /> -->
		<!--  <br/>
		 <br/>
		 <div>
		 <p>Classroom ID: </p>
		 <input type="text" name="classroom_id">
		  <select name="classroom_id" id="select1" >
		 <option value="1" selected>classroom1</option>
		 <option value="2" selected>classroom2</option>
		 <option value="3" selected>classroom3</option>
		 </select> 
		 </div> -->
	    <br/>
	    <br/>
        <textarea id="textarea" cols="100" rows="10"  name="comment" placeholder="Talking somthing"></textarea>
	     <br/>
	     <button type="reset" id="but1">reset</button>
	     <button type="submit" id="but2">submit</button>
	</form>
	
	<div lang="en-US" class="gitment-container gitment-comments-container">
        <ul class="gitment-comments-list" id ="cmt_main">
<!--             <li class="gitment-comment">
                <a class='gitment-comment-avatar'>
                </a>
                <div class="gitment-comment-main">
                    <div class="gitment-comment-header">
                        <a class="gitment-comment-name">
                            student_id
                        </a>
                        <span>2018.05.17</span>
                    </div>
                    <div class="gitment-comment-body gitment-markdown"><p>asjfnakjbdsjfbdsjhbfjas</p></div>
                </div>
                </li>
            <li class="gitment-comment">
                <a class="gitment-comment-avatar">
                </a>
                <div class="gitment-comment-main">
                    <div class="gitment-comment-header">
                        <a class="gitment-comment-name">bc</a>
                        <span>2018.05.17</span>
                    </div>
                    <div class="gitment-comment-body gitment-markdown"><p>ajnsfkankfjnsdkfksndkjfnskdnkjnskj</p></div>
                </div>
                </li>
            <li class="gitment-comment">
                <a class="gitment-comment-avatar">
                </a>
                <div class="gitment-comment-main">
                    <div class="gitment-comment-header">
                        <a class="gitment-comment-name">sb</a>
                        <span>2018.05.17</span>
                    </div>
                    <div class="gitment-comment-body gitment-markdown"><p>aksjnfkanfkjndkfnsjdnkfs</p></div>
                </div>
                </li> -->
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
/* $(document).ready(function () {
	var comment = ${comment};
	var str ="";
 	for(i=0;i<comment.length;i++)
		{
 		
		str += "<li class='gitment-comment'><a class='gitment-comment-avatar'></a><div class='gitment-comment-main'><div class='gitment-comment-header'><a class='gitment-comment-name'>"
                          +comment[i].student_id+"&nbsp&nbsp&nbsp&nbsp&nbsp"+
                          "</a><span>   Post time: "
                          +comment[i].post_time+
                          "</span><span style='float:right'>Rating score: "
                          +comment[i].score+
                          "</sapn></div><div class='gitment-comment-body gitment-markdown'><p>"
                          +comment[i].comment+
                          "</p></div></div></li>"
		} 
	$('#cmt_main').html(str)
	
    }); */
 $(document).ready(function () {
	var comment = ${comment};
	var StudentID=${StudentID};
	for(i=0;i<comment.length;i++){
		if(comment[i].student_id==StudentID){
		alert("You have commented this room!");
		window.location.href = "profile";
			/* console.log(StudentID); */
		break;
		}
	}
}); 

/* $(document).ready(function () {
	var comment = ${comment};
	var str ="";
	for(i=0;i<comment.length;i++){
		var num = Number(comment[i].score);
		for(i=0;i<num;i++){
		$('.span1').innerHtml="<img src='resources/comment/s1.png' width='10px' height='10px'/>";
		}
	}
}); */

</script>
</html>
<!--                         <div class="gitment-comment-like-btn">
	                        <div class="clearfix">
								<span class="f-l f-14 va-m">Score: </span>
								<div class="star-bar star-bar-show size-M f-l va-m mr-10">
									<span class="star" style="width:80%"></span>
								</div>
								<strong class="f-l f-14 va-m">4</strong>
							</div>       
                        </div> -->