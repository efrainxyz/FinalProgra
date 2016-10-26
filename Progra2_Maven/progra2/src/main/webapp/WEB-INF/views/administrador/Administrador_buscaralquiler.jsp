<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%Persona user=(Persona) session.getAttribute("usuario");%>
<%if(user==null){
	request.setAttribute("mensaje", "No inicio sesión");
	request.getRequestDispatcher("/publico/Publico_paginaprincipal.jsp").forward(request, response);
}else{%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buscar Alquiler</title>
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
    
    <!-- Scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/modernizr.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/front.js"></script>
    <!-- Para la tabla -->    
	<script src="<%=request.getContextPath()%>/resources/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/table.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script>
    
    
    
</head>
<body alink="purple" vlink="darkblue">
<div class="container-fluid">
            <div class="row">
            	<div class="col-sm-12" style="text-align:left;">
                	<h1>Lista de reservas</h1>
                 </div>
                 <c:choose>
                 <c:when test="${not empty mensaje}"> 
                	 <div class="col-sm-12 alert alert-danger">${mensaje}</div>
                 </c:when>
                 <c:otherwise>
            	<div class="col-sm-12">
            		<br>
					<table id="tabla" class="table table-hover table-bordered">
 						<thead>
 							<tr class="btn-primary">
 								<th style="text-align: center;" valign="middle">C&oacute;digo de Alquiler</th>
					 			<th style="text-align: center;" valign="middle">Cliente</th>
					 			<th style="text-align: center;" valign="middle">Matricula de Auto</th>
					 			<th style="text-align: center;" valign="middle">Fecha de salida</th>
					 			<th style="text-align: center;" valign="middle">Fecha de retorno</th>
					 			<th style="text-align: center;" valign="middle">Monto a pagar</th>
					 			<th style="text-align: center;" valign="middle">Seleccionar</th>
					 		</tr>
						</thead>
 						<tbody>
 							<c:forEach var="listar" items="${listar}">
		 					<tr>
					 			<td style="text-align: center; vertical-align:middle;">${listar.idAlquiler}</td>
					 			<td style="text-align: center; vertical-align:middle;">${listar.persona.nombre}</td>
					 			<td style="text-align: center; vertical-align:middle;">${listar.auto.matricula}</td>
					 			<td style="text-align: center; vertical-align:middle;">${listar.fechaSalida}</td>
					 			<td style="text-align: center; vertical-align:middle;">${listar.fechaRetorno}</td>
					 			<td style="text-align: center; vertical-align:middle;">${listar.montoAPagar}</td>
					 			<td style="text-align: center; vertical-align:middle;">
					 			<button class="btn-large btn btn-primary" type="button" onClick="
					 			window.opener.document.all.idAlquiler.setAttribute('value','${listar.idAlquiler}');
  								window.opener.document.all.dni.setAttribute('value','${listar.persona.dni}');
  								window.opener.document.all.nom.setAttribute('value','${listar.persona.nombre}');
  								window.opener.document.all.apeP.setAttribute('value','${listar.persona.apellidoPaterno}');
  								window.opener.document.all.apeM.setAttribute('value','${listar.persona.apellidoMaterno}');
  								window.opener.document.all.placa.setAttribute('value','${listar.auto.matricula}');
  								window.opener.document.all.marca.setAttribute('value','${listar.auto.modeloAuto.marcaAuto.marca}');
  								window.opener.document.all.modelo.setAttribute('value','${listar.auto.modeloAuto.modelo}');
  								window.opener.document.all.fRe.setAttribute('value','${listar.fechaReserva}');
  								window.opener.document.all.monto.setAttribute('value','${listar.montoAPagar}');
  								window.opener.document.all.montoPagar.setAttribute('value','${listar.montoAPagar}');
  								window.close()"><b>Seleccionar</b></button>
					 			</td>
					 		</tr>
				 			</c:forEach>
			 			</tbody>
  					</table>
  				</div>
  				</c:otherwise>
  				</c:choose>
			</div>
</div>
</body>
</html>
<%}%>