<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  
  <title>EggOrder SigUp-Page</title>

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
    .page-signup-header {
      box-shadow: 0 2px 2px rgba(0,0,0,.05), 0 1px 0 rgba(0,0,0,.05);
    }

    .page-signup-header .btn {
      position: absolute;
      top: 12px;
      right: 15px;
    }

    html[dir="rtl"] .page-signup-header .btn {
      right: auto;
      left: 15px;
    }

    .page-signup-container {
      width: auto;
      margin: 30px 10px;
    }

    .page-signup-container form {
      border: 0;
      box-shadow: 0 2px 2px rgba(0,0,0,.05), 0 1px 0 rgba(0,0,0,.05);
    }

    @media (min-width: 544px) {
      .page-signup-container {
        width: 350px;
        margin: 60px auto;
      }
    }

    .page-signup-social-btn {
      width: 40px;
      padding: 0;
      line-height: 40px;
      text-align: center;
      border: none !important;
    }
  </style>
  <!-- / Custom styling -->
</head>
<body>
  <div class="page-signup-header p-a-2 text-sm-center bg-white">
    <a class="px-demo-brand px-demo-brand-lg text-default" href="index.html"><span class="px-demo-logo bg-primary m-t-0"><span class="px-demo-logo-1"></span><span class="px-demo-logo-2"></span><span class="px-demo-logo-3"></span><span class="px-demo-logo-4"></span><span class="px-demo-logo-5"></span><span class="px-demo-logo-6"></span><span class="px-demo-logo-7"></span><span class="px-demo-logo-8"></span><span class="px-demo-logo-9"></span></span>Eggorder</a>
    <a href="signin" class="btn btn-primary">Sign In</a>
  </div>

  <div class="page-signup-container">
    <h2 class="m-t-0 m-b-4 text-xs-center font-weight-semibold font-size-20">Create an Account</h2>

    <form action="signupProcess" class="panel p-a-4" method="post">
      <fieldset class="form-group form-group-lg">
        <input type="text" class="form-control" name="student_id" placeholder="StudentId">
      </fieldset>

      <fieldset class="form-group form-group-lg">
        <input type="password" class="form-control" name="password" placeholder="Password">
        <small class="text-muted">Minimum 6 characters</small>
      </fieldset>
    
      <fieldset class="form-group form-group-lg">
        <input type="text" class="form-control" name="fullname" placeholder="Full Name">
      </fieldset>

      <fieldset class="form-group form-group-lg">
        <input type="text" class="form-control" name="birthdate" placeholder="Birthdate">
      </fieldset>

      <fieldset class="form-group form-group-lg">
        <input type="email" class="form-control" name="email" placeholder="Email">
      </fieldset>



<!--       <label class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input">
        <span class="custom-control-indicator"></span>
        I agree with the <a href="#" target="_blank">Terms and Conditions</a>
      </label> -->

      <button type="submit" class="btn btn-block btn-lg btn-primary m-t-3">Sign Up</button>
    </form>

    <h4 class="m-y-3 text-xs-center font-weight-semibold text-muted">or sign up with</h4>

    <div class="text-xs-center">
      <a href="index.html" class="page-signup-social-btn btn btn-success btn-rounded" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a>&nbsp;&nbsp;&nbsp;
      <a href="index.html" class="page-signup-social-btn btn btn-info btn-rounded" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;&nbsp;
      <a href="index.html" class="page-signup-social-btn btn btn-danger btn-rounded" data-toggle="tooltip" title="Google+"><i class="fa fa-google-plus"></i></a>
    </div>
  </div>

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

      $('[data-toggle="tooltip"]').tooltip();
    });
  </script>
</body>
</html>
