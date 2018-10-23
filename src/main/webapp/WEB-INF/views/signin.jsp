<% String path = request.getContextPath(); 
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  
  <title>EggOrder SigIn-Page</title>

  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&subset=latin" rel="stylesheet" type="text/css">
  <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css">
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

  <!-- DEMO ONLY: Function for the proper stylesheet loading according to the demo settings -->
  <script>function _pxDemo_loadStylesheet(a,b,c){var c=c||decodeURIComponent((new RegExp(";\\s*"+encodeURIComponent("px-demo-theme")+"\\s*=\\s*([^;]+)\\s*;","g").exec(";"+document.cookie+";")||[])[1]||"clean"),d="rtl"===document.getElementsByTagName("html")[0].getAttribute("dir");document.write(a.replace(/^(.*?)((?:\.min)?\.css)$/,'<link href="$1'+(c.indexOf("dark")!==-1&&a.indexOf("/css/")!==-1&&a.indexOf("/themes/")===-1?"-dark":"")+(!d||0!==a.indexOf("resources/assets/css")&&0!==a.indexOf("resources/assets/demo")?"":".rtl")+'$2" rel="stylesheet" type="text/css"'+(b?'class="'+b+'"':"")+">"))}</script>

  <!-- DEMO ONLY: Set RTL direction -->
  <script>"ltr"!==document.getElementsByTagName("html")[0].getAttribute("dir")&&"1"===decodeURIComponent((new RegExp(";\\s*"+encodeURIComponent("px-demo-rtl")+"\\s*=\\s*([^;]+)\\s*;","g").exec(";"+document.cookie+";")||[])[1]||"0")&&document.getElementsByTagName("html")[0].setAttribute("dir","rtl");</script>

  <!-- DEMO ONLY: Load PixelAdmin core stylesheets -->
  <script>
    _pxDemo_loadStylesheet('resources/assets/css/bootstrap.min.css', 'px-demo-stylesheet-bs');
    _pxDemo_loadStylesheet('resources/assets/css/pixeladmin.min.css', 'px-demo-stylesheet-core');
  </script>

  <!-- DEMO ONLY: Load theme -->
  <script>
    function _pxDemo_loadTheme(a){var b=decodeURIComponent((new RegExp(";\\s*"+encodeURIComponent("px-demo-theme")+"\\s*=\\s*([^;]+)\\s*;","g").exec(";"+document.cookie+";")||[])[1]||"clean");_pxDemo_loadStylesheet(a+b+".min.css","px-demo-stylesheet-theme",b)}
    _pxDemo_loadTheme('resources/assets/css/themes/');
  </script>

  <!-- Demo assets -->
  <script>_pxDemo_loadStylesheet('resources/assets/demo/demo.css');</script>
  <!-- / Demo assets -->

  <!-- Pace.js -->
  <script src="resources/assets/pace/pace.min.js"></script>

  <script src="resources/assets/demo/demo.js"></script>

  <!-- Custom styling -->
  <style>
    .page-signin-header {
      box-shadow: 0 2px 2px rgba(0,0,0,.05), 0 1px 0 rgba(0,0,0,.05);
    }

    .page-signin-header .btn {
      position: absolute;
      top: 12px;
      right: 15px;
    }

    html[dir="rtl"] .page-signin-header .btn {
      right: auto;
      left: 15px;
    }

    .page-signin-container {
      width: auto;
      margin: 30px 10px;
    }

    .page-signin-container form {
      border: 0;
      box-shadow: 0 2px 2px rgba(0,0,0,.05), 0 1px 0 rgba(0,0,0,.05);
    }

    @media (min-width: 544px) {
      .page-signin-container {
        width: 350px;
        margin: 60px auto;
      }
    }

    .page-signin-social-btn {
      width: 40px;
      padding: 0;
      line-height: 40px;
      text-align: center;
      border: none !important;
    }

    #page-signin-forgot-form { display: none; }
  </style>
  <!-- / Custom styling -->
</head>
<body>
  <div class="page-signin-header p-a-2 text-sm-center bg-white">
    <a class="px-demo-brand px-demo-brand-lg text-default" href="index.html"><span class="px-demo-logo bg-primary m-t-0"><span class="px-demo-logo-1"></span><span class="px-demo-logo-2"></span><span class="px-demo-logo-3"></span><span class="px-demo-logo-4"></span><span class="px-demo-logo-5"></span><span class="px-demo-logo-6"></span><span class="px-demo-logo-7"></span><span class="px-demo-logo-8"></span><span class="px-demo-logo-9"></span></span>EggOrder</a>
    <a href="signup" class="btn btn-primary">Sign Up</a>
  </div>

  <!-- Sign In form -->

  <div class="page-signin-container" id="page-signin-form">
    <h2 class="m-t-0 m-b-4 text-xs-center font-weight-semibold font-size-20">Sign In to your Account</h2>

    <form action="signinProcess" class="panel p-a-4" method="POST">
      <fieldset class=" form-group form-group-lg">
        <input type="text" class="form-control" name="student_id" placeholder="StudentId">
      </fieldset>

      <fieldset class=" form-group form-group-lg">
        <input type="password" class="form-control" name="password" placeholder="Password">
      </fieldset>

      <div class="clearfix">
        <a href="adminlogin" class="custom-control custom-checkbox pull-xs-left">
          <!-- <input type="checkbox" class="custom-control-input"> -->
          <!-- <span class="custom-control-indicator"></span> -->
          Admin login
        </a>
        <a href="#" class="font-size-12 text-muted pull-xs-right" id="page-signin-forgot-link">Forgot your password?</a>
      </div>

      <button type="submit" class="btn btn-block btn-lg btn-primary m-t-3">Sign In</button>
    </form>

    <h4 class="m-y-3 text-xs-center font-weight-semibold text-muted">or sign in with</h4>

    <div class="text-xs-center">
      <a href="index.html" class="page-signin-social-btn btn btn-success btn-rounded" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a>&nbsp;&nbsp;&nbsp;
      <a href="index.html" class="page-signin-social-btn btn btn-info btn-rounded" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;&nbsp;
      <a href="index.html" class="page-signin-social-btn btn btn-danger btn-rounded" data-toggle="tooltip" title="Google+"><i class="fa fa-google-plus"></i></a>
    </div>
  </div>

  <!-- / Sign In form -->

  <!-- Reset form -->

  <div class="page-signin-container" id="page-signin-forgot-form" >
    <h2 class="m-t-0 m-b-4 text-xs-center font-weight-semibold font-size-20">Password reset</h2>

    <form action="signin" class="panel p-a-4" >
      <fieldset class="form-group form-group-lg">
        <input type="email" class="form-control" placeholder="Your Email">
      </fieldset>

      <button type="submit" class="btn btn-block btn-lg btn-primary m-t-3">Send password reset link</button>
      <div class="m-t-2 text-muted">
        <a href="#" id="page-signin-forgot-back">&larr; Back</a>
      </div>
    </form>
  </div>

  <!-- / Reset form -->

  <!-- ==============================================================================
  |
  |  SCRIPTS
  |
  =============================================================================== -->

  <!-- jQuery -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="resources/assets/js/bootstrap.min.js"></script>
  <script src="resources/assets/js/pixeladmin.min.js"></script>

  <script>
    // -------------------------------------------------------------------------
    // Initialize DEMO sidebar

    $(function() {
      pxDemo.initializeDemoSidebar();

      $('#px-demo-sidebar').pxSidebar();
      pxDemo.initializeDemo();
    });
  </script>

  <script>
    // -------------------------------------------------------------------------
    // Initialize page components

    $(function() {
      pxDemo.initializeBgsDemo('body', 0, '#000', function(isBgSet) {
        $('h2')[isBgSet ? 'addClass' : 'removeClass']('text-white font-weight-bold');

        $('h4')
          .addClass(isBgSet ? 'text-white' : 'text-muted')
          .removeClass(isBgSet ? 'text-muted' : 'text-white');
      });

      $('#page-signin-forgot-link').on('click', function(e) {
        e.preventDefault();

        $('#page-signin-form').css({ display: 'none' });
        $('#page-signin-forgot-form').css({ display: 'block' });

        $(window).trigger('resize');
      });

      $('#page-signin-forgot-back').on('click', function(e) {
        e.preventDefault();

        $('#page-signin-form').css({ display: 'block' });
        $('#page-signin-forgot-form').css({ display: 'none' });

        $(window).trigger('resize');
      });

      $('[data-toggle="tooltip"]').tooltip();
    });
  </script>
</body>
</html>
