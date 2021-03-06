<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%Persona user=(Persona) session.getAttribute("usuario");%>
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

    <!-- styles -->
    <link href="<%=request.getContextPath()%>/resources/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/owl.carousel.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/owl.theme.css" rel="stylesheet">

    <link href="<%=request.getContextPath()%>/resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <link href="<%=request.getContextPath()%>/resources/css/custom.css" rel="stylesheet">

    <script src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script>

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.jpg">
    
    <!--Para datetimepicker-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <!-- Para el number spinner -->
    <link href="<%=request.getContextPath()%>/resources/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
	<!-- Para el slider-->
    <link href="<%=request.getContextPath()%>/resources/css/slider.css" rel="stylesheet">
	<!-- Jquery UI -->
	<link href="<%=request.getContextPath()%>/resources/css/jquery-ui.min.css" rel="stylesheet">
	<style type="text/css">
	
	* {
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    margin: 0;
    padding: 0;
}
 
body {
    font-size: 16px;
    background: #fff;
    font-family: "Roboto";
}
 
.wrap {
    width: 90%;
    max-width: 1000px;
    margin: 0 20px;
    /*margin: auto;*/
}
 
.formulario h2 {
    font-size: 16px;
    color: #001F3F;
    margin-bottom: 20px;
    margin-left: 20px;
}
 
.formulario > div {
    padding: 20px 0;
    border-bottom: 1px solid #ccc;
}

.formulario input[type="radio"]:checked + label:before {
      display: none; }
    .formulario input[type="radio"]:checked + label {
      padding: 5px 15px;
      background: #FF4136;
      border-radius: 2px;
      color: #fff; }
	
	
	</style>

</head>
<div id="top">
        <div class="container">
            <div class="col-md-6 offer" data-animate="fadeInDown">
                
            </div>
            <div class="col-md-6" data-animate="fadeInDown">
                <ul class="menu">
               <ul class="menu">
                    <li><h4 style="color:white;font-size:14px;">Bienvenido : <%=user.getNombre()+","+user.getApellidoPaterno()+" "+user.getApellidoMaterno() %></h4></li>
                    <li><a href="<%=request.getContextPath()%>/Logout">Cerrar Sesi�n</a>
                    </li>
                </ul>
            </div>
        </div>
 
    </div>


    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="homeCliente" data-animate-hover="bounce">
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
   
            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class=""><a href="inicioCli">Inicio</a>
                    </li>
             
                    <li class=""><a href="vercatalogocliente">Vehiculos</a>
                    </li>
                    <li class=""><a href="micuenta">Mi Cuenta</a>
                    </li>
                    <li class=""><a href="reserva1">Reservar</a>
                    </li>

                </ul>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">

                <div class="navbar-collapse collapse right" id="basket-overview">
                    
                </div>


            </div>

            <div class="collapse clearfix" id="search">

                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>