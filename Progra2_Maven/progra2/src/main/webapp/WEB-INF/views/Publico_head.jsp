<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        Obaju 
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <link href="<%=request.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/owl.carousel.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/owl.theme.css" rel="stylesheet">

    <link href="<%=request.getContextPath()%>/resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <link href="<%=request.getContextPath()%>/resources/css/custom.css" rel="stylesheet">

    <script src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script>

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.jpg">
    <!-- Para el number spinner -->
    <link href="<%=request.getContextPath()%>/resources/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
	<!-- Para el slider-->
    <link href="<%=request.getContextPath()%>/resources/css/slider.css" rel="stylesheet">



</head>
<div id="top">
        <div class="container">
            <div class="col-md-6 offer" data-animate="fadeInDown">
                
            </div>
            <div class="col-md-6" data-animate="fadeInDown">
                <ul class="menu">
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Iniciar Sesión</a>
                    </li>
                    <li><a href="registrarse">Registrarse</a>
                    </li>
                    <li><a href="contactenos">Contactenos</a>
                    </li>
                </ul>
            </div>
        </div>
         <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">Iniciar Sesión</h4>
                    </div>
                    <div class="modal-body">
                        <form action="iniciarSesion" method="post">
                            <div class="form-group">
                                <input type="number" class="form-control" name="dni" id="email-modal" placeholder="DNI">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="contrasena" id="password-modal" placeholder="Contraseña">
                            </div>

                            <p class="text-center">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-sign-in"></i>Ingresar</button>
                            </p>

                        </form>
						<p class="text-center text-muted"><a href="#"><strong>¿Olvidaste tu contraseña?</strong></a></p>
                        <p class="text-center text-muted">¿Aún no estás registrado? <a href="#"><strong>Registrate aquí. </strong></a>Es rápido y fácil, no te tomará mucho tiempo.</p>

                    </div>
                </div>
            </div>
        </div>

    </div>



    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="<%=request.getContextPath()%>/publico/Publico_paginaprincipal.jsp" data-animate-hover="bounce">
                    <img src="<%=request.getContextPath()%>/resources/img/logo.png" alt="Obaju logo" class="hidden-xs">
                    <img src="<%=request.getContextPath()%>/resources/img/logo-small.png" alt="Obaju logo" class="visible-xs"><span class="sr-only">Obaju </span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                   
               
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class=""><a href="<%=request.getContextPath()%>/publico/Publico_paginaprincipal.jsp">Inicio</a>
                    </li>
                    <li class="nav navbar-nav navbar-left">
                        <a href="nosotros">Nosotros</a>
                    </li>
                    <li class="nav navbar-nav navbar-left">
                        <a href="<%=request.getContextPath()%>/publico/Publico_catalogodeproductos.jsp">Vehiculos</a>
                    </li>
                   
                </ul>

            </div>

        </div>
      
    </div>