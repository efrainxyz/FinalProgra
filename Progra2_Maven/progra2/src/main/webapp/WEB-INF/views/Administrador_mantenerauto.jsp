<%@page import="proyectofinal.progra2.bean.Persona"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
 <%@include file="Administrador_head.jsp"  %>
	

<body>
    

    <div id="all">        
        <div class="content">
        	<div class="container">
            	<div class="col-sm-12">
            		
            		<div class="box" id="mantenerAuto">
            		
            		<h1>Lista de Autos</h1>
 
					<table id="tabla" class="table table-hover table-bordered">
						
	 					<thead>
	 						<tr class="btn-primary">
	 							<th style="text-align: center;" valign="middle">Matrícula</th>
						 		<th style="text-align: center;" valign="middle">Marca de Auto</th>
						 		<th style="text-align: center;" valign="middle">Modelo de Auto</th>
						 		<th style="text-align: center;" valign="middle">Transmisión</th>
						 		<th style="text-align: center;" valign="middle">Tipo de Viaje</th>
						 		<th style="text-align: center;" valign="middle">Combustible</th>
						 		<th style="text-align: center;" valign="middle">Número de pasajeros</th>
						 		<th style="text-align: center;" valign="middle">Número de puertas</th>
						 		<th style="text-align: center;" valign="middle">Modificar</th>
						 		<th style="text-align: center;" valign="middle">Eliminar</th>
						 			
						 	</tr>
						</thead>
						
	 					<tbody>
	 					<c:if test="${not empty listarjsp}">
	        				<c:forEach var="listarjsp" items="${listarjsp}">
			 				<tr>
								<td style="text-align: center; vertical-align:middle;">${listarjsp.matricula}</td>
								<td style="text-align: center; vertical-align:middle;">${listarjsp.modeloAuto.marcaAuto.marca}</td>
		 						<td style="text-align: center; vertical-align:middle;">${listarjsp.modeloAuto.modelo}</td>
		 						<td style="text-align: center; vertical-align:middle;">${listarjsp.transmisionAutoId}</td>
		 						<td style="text-align: center; vertical-align:middle;">${listarjsp.tipoViajeAuto.tipo}</td>
		 						<td style="text-align: center; vertical-align:middle;">${listarjsp.combustibleAuto}</td>
								<td style="text-align: center; vertical-align:middle;">${listarjsp.nroPasajeros}</td>
								<td style="text-align: center; vertical-align:middle;">${listarjsp.nroPuertas}</td>
		 						<td style="text-align: center; vertical-align:middle;"><button class="btn-large btn btn-primary" type="button" onClick="location.href='Administrador_modificarauto.jsp'"><b>Modificar</b></button></td>
		 						<td style="text-align: center; vertical-align:middle;"><button class="btn-large btn btn-danger" type="button"><b>Eliminar</b></button>
						 			
		 					</tr>
					 		</c:forEach>
	        			</c:if>
				 		</tbody>
				 	
					</table>
	  				<br>
	  				<button class="btn-large btn btn-primary" onclick="location.href='Administrador_agregarauto.jsp'">Agregar Auto</button>
	               					
					
              		</div>
             
           		</div>
        	</div>
   		</div>

    </div>
   
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




</body>
 <%@include file="Administrador_footer.jsp"  %>
</html>
