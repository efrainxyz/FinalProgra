<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%Persona user=(Persona) session.getAttribute("usuario");
    	
    %>
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
	<link href="<%=request.getContextPath()%>/resources/css/jquery.dataTables.css" rel="stylesheet">

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.jpg">
	<!-- Jquery UI -->
	<link href="<%=request.getContextPath()%>/resources/css/jquery-ui.min.css" rel="stylesheet">



</head>
<div id="top">
        <div class="container">
            <div class="col-md-6 offer" data-animate="fadeInDown">
                
            </div>
            <div class="col-md-6" data-animate="fadeInDown">
                <ul class="menu">
                    <li><h4 style="color:white;font-size:14px;">Bienvenido: <%=user.getRol().getNombre()%></h4></li>
                    <li><a href="Logout">Cerrar Sesi�n</a>
                    </li>
                </ul>
            </div>
        </div>
 
    </div>


    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="homeAdministrador" data-animate-hover="bounce">
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
                    <li><a href="listarauto">Mantener Auto</a></li>
                  	<li><a href="vistaregpago">Registrar Pago</a></li>
                  	<li><a href="vercomysug">Ver comentario y sugerencias</a></li>
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