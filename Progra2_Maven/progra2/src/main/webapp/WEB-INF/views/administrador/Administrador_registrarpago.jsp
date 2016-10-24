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
<!DOCTYPE html>
<html lang="en">

<jsp:include page="Administrador_head.jsp" flush="true"/>

<body>
    

    <div id="all">        
        <div class="content">
        	<div class="container">
            	<div class="col-sm-12">
            		
            		<div class="box" id="registrarPago">
            		
            		<h1>Registro de pago</h1>
            		<p class="lead">Por favor complete los campos para realizar el registro del pago de una reserva.</p>
            		<hr>
            		
            		<form name="formbuscarAlquiler" target="Buscar Alquiler" action="buscaralquiler" method="get" onSubmit="window.open('','Buscar Alquiler','toolbar=no,location=no,menubar=no,scrollbars=yes,height=600,width=900')">
            			<div class="row">
            				<div class="col-sm-6 col-md-3">
            					<div class="form-group">
                                    <select class="form-control" id="criterio" name="criterio">
                                    	<option value="1">DNI</option>
                                    	<option value="2">Código de reserva</option>
                                    </select>
                                </div>
            				</div>
            				<div class="col-sm-6 col-md-3">
            					<div class="form-group">
	            					<input type="text" class="form-control" id="criterioBusqueda" name="criterioBusqueda" placeholder="Ingrese el criterio de búsqueda" required>
            					</div>
            				</div>
            				<div class="col-sm-6 col-md-3">
            					<div class="form-group">
	            					<button class="btn-large btn btn-primary" type="submit" id="botonCriterio"><b>Buscar</b></button>
            					</div>
            				</div>
            			
            			</div>
            			
            			<div class="row">
            			
	            			<div class="col-sm-6">
	            				<h3>Detalle de la Reserva</h3>
		            			<div class="table-responsive">
		                            <table class="table">
		                                <tbody>
		                                	<tr>
		                                        <th>Código de reserva</th>
		                                        <td><input class="form-control input-sm" type="text" name="codRe"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>DNI</th>
		                                        <td><input class="form-control input-sm" type="text" name="dni"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Nombre</th>
		                                        <td><input class="form-control input-sm" type="text" name="nom"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Apellido Paterno</th>
		                                        <td><input class="form-control input-sm" type="text" name="apeP"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Apellido Materno</th>
		                                        <td><input class="form-control input-sm" type="text" name="apeM"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Placa</th>
		                                        <td><input class="form-control input-sm" type="text" name="placa"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Marca de Auto</th>
		                                        <td><input class="form-control input-sm" type="text" name="marca"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Modelo de Auto</th>
		                                        <td><input class="form-control input-sm" type="text" name="modelo"></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Detalle</th>
		                                        <td><input class="form-control input-sm" type="text" name="det"></td>
		                                    </tr>
		                                    <tr class="total">
		                                        <th>Monto a Pagar</th>
		                                        <td><input class="form-control input-sm" type="text" name="monto"></td>
		                                    </tr>
		                                </tbody>
		                            </table>
		                        </div>
	            			</div>
	            			
	            			<div class="col-sm-6">
	            				<h3>Detalle del pago</h3>
	            				<div class="col-sm-12">
	                            	<div class="form-group">
	                                	<label for="monto_ingresar">Monto a ingresar</label>
	                                	<input type="text" class="form-control" id="monto_ingresar">
	                                </div>
	                            </div>
	                            <div class="col-sm-12">
	                                <div class="form-group">
	                                	<label for="monto_pagar">Monto a pagar</label>
	                                    <input type="text" class="form-control" id="monto_pagar" disabled>
	                                </div>
	                            </div>
								<div class="col-sm-12">
	                                <div class="form-group">
	                                    <label for="vuelto">Vuelto</label>
	                                    <input type="text" class="form-control" id="vuelto" disabled>
	                                </div>
	                            </div>
	            			</div>
	            			
                    	</div>
                    	<div class="box-footer">
                                <div class="pull-left">
                                    <a href="Administrador_paginaprincipal.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i>Cancelar</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Registrar Pago
                                    </button>
                                </div>
                        </div>
                    </form>
            		
 				
					
					
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

</body>

</html>

<%}%>