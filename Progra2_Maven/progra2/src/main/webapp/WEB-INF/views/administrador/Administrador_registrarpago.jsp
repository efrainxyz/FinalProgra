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
            		<c:if test="${not empty mensaje }">
	          			<div class="col-sm-12 form-group alert alert-success"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>${mensaje}</div>
	              	</c:if>
	              	<c:if test="${not empty mensaje2}">
	          			<div class="col-sm-12 form-group alert alert-danger"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>${mensaje2}</div>
	              	</c:if> 
            		<h1>Registro de pago</h1>
            		<p class="lead">Por favor complete los campos para realizar el registro del pago de una reserva.</p>
            		<hr>
            		
            		<form name="formbuscarAlquiler" target="Buscar Alquiler" action="buscaralquiler" method="get" onSubmit="window.open('','Buscar Alquiler','toolbar=no,location=no,menubar=no,scrollbars=yes,height=600,width=900')">
            			<div class="row">
            				<div class="col-sm-6 col-md-3">
            					<div class="form-group">
                                    <select class="form-control" id="criterio" name="criterio">
                                    	<option value="1">DNI</option>
                                    	<option value="2">Código de alquiler</option>
                                    </select>
                                </div>
            				</div>
            				<div class="col-sm-6 col-md-3">
            					<div class="form-group">
	            					<input type="number" class="form-control" min="0" onkeypress="return isNumber(event)" id="criterioBusqueda" name="criterioBusqueda" placeholder="Ingrese el criterio de búsqueda" required>
            					</div>
            				</div>
            				<div class="col-sm-6 col-md-3">
            					<div class="form-group">
	            					<button class="btn-large btn btn-primary" type="submit" id="botonCriterio" onclick="return verificarCriterio();"><b>Buscar</b></button>
            					</div>
            				</div>
            			
            			</div>
            			</form>
            			
            			<form name="regPago" action="registrarpago" method="post">
            			<div class="row">
            			
	            			<div class="col-sm-6">
	            				<h3>Detalle de la Reserva</h3>
		            			<div class="table-responsive">
		                            <table class="table">
		                                <tbody>
		                                	<tr>
		                                        <th>Código de reserva</th>
		                                        <td><input class="form-control input-sm" type="text" name="idAlquiler" id="codRe" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>DNI</th>
		                                        <td><input class="form-control input-sm" type="text" name="dni" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Nombre</th>
		                                        <td><input class="form-control input-sm" type="text" name="nom" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Apellido Paterno</th>
		                                        <td><input class="form-control input-sm" type="text" name="apeP" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Apellido Materno</th>
		                                        <td><input class="form-control input-sm" type="text" name="apeM" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Matricula</th>
		                                        <td><input class="form-control input-sm" type="text" name="placa" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Marca de Auto</th>
		                                        <td><input class="form-control input-sm" type="text" name="marca" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Modelo de Auto</th>
		                                        <td><input class="form-control input-sm" type="text" name="modelo" value="" readonly></td>
		                                    </tr>
		                                    <tr>
		                                        <th>Fecha de Reserva</th>
		                                        <td><input class="form-control input-sm" type="text" name="fRe" value="" readonly></td>
		                                    </tr>
		                                    <tr class="total">
		                                        <th>Monto a Pagar</th>
		                                        <td><input class="form-control input-sm" type="text" name="monto" value="" readonly></td>
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
	                                	<input type="number" class="form-control" id="montoIngresar" name="montoIngresar">
	                                </div>
	                            </div>
	                            <div class="col-sm-12">
	                                <div class="form-group">
	                                	<label for="monto_pagar">Monto a pagar</label>
	                                    <input type="text" class="form-control" id="montoPagar" name="montoPagar" value="" readonly>
	                                </div>
	                            </div>
								<div class="col-sm-12">
	                                <div class="form-group">
	                                    <label for="vuelto">Vuelto</label>
	                                    <input type="text" class="form-control" id="vuelto" name="vuelto" value="" readonly>
	                                </div>
	                            </div>
	                            <div class="col-sm-12">
	                            	<div class="form-group pull-right">
		                            	<button type="button" onclick="return calcularVuelto();" class="btn btn-primary">Calcular</button>
	                            	</div>
	                            </div>
	                            
	            			</div>
	            			
                    	</div>
                    	<div class="box-footer">
                                <div class="pull-left">
                                    <a href="Administrador_paginaprincipal.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i>Cancelar</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" onclick="return verificarRegPago();" class="btn btn-primary">Registrar Pago
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
    <script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
	<script>
	function calcularVuelto(){
		var montoIn= parseFloat($("#montoIngresar").val());
		var montoPa= parseFloat($("#montoPagar").val());
		var vueltoPago=0;
		
		if(isNaN(montoPa)){
			custom_alert("Primero debe realizar la búsqueda de su alquiler.", "Alerta");
		} else if (isNaN(montoIn)){
			custom_alert("Por favor ingrese un valor a Monto a Ingresar.", "Alerta");
		} else if (montoPa>montoIn){
			custom_alert("El monto a Ingresar debe ser mayor o igual al monto a Pagar.", "Alerta");
		} else {
			vueltoPago= montoIn - montoPa;
			$("#vuelto").attr("value",parseFloat(vueltoPago).toFixed(2));
		}
	}
	</script>
	<script>
	function verificarCriterio(){
		var tipoCriterio= $("#criterio").val();
		var criterio= $("#criterioBusqueda").val();
		console.log(tipoCriterio);
		console.log(criterio);
		
		if(tipoCriterio==1){
			if(criterio.length<8 || criterio.length>8){				
				custom_alert("El DNI debe tener 8 dígitos.", "Alerta");
				return false;
			}
			
		} 
		return true;
	}
	</script>
	<script>
	function verificarRegPago(){
		console.log("llega?")
		var codAlquiler= $("#codRe").val();
		var montoIn= $("#montoIngresar").val();
		var montoPa= $("#montoPagar").val();
		var vuelto= $("#vuelto").val();
		console.log(codAlquiler);
		console.log(montoIn)
		console.log(montoPa)
		
		if(codAlquiler==""){
			custom_alert("Usted debe buscar su alquiler y luego calcular su pago.", "Alerta");
			return false;			
		}  else if (montoIn==""){
			custom_alert("Usted debe ingresar su monto a pagar y calcular el pago.", "Alerta");
			return false;		
		} else if (montoPa=="" || vuelto==""){
			custom_alert("Por favor calcule el pago.", "Alerta");
			return false;		
		}
	
		return true;
	}
	</script>
	<script>
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	</script>
	<!-- Metodo reutilizable para alertas con JQUERYUI -->
	<script> 
	function custom_alert(output_msg, title_msg)
	{
	    if (!title_msg)
	        title_msg = 'Alert';

	    if (!output_msg)
	        output_msg = 'No Message to Display.';

	    $("<div></div>").html(output_msg).dialog({
	        title: title_msg,
	        resizable: false,
	        modal: true,
	        buttons: {
	            "Ok": function() 
	            {
	                $( this ).dialog( "close" );
	            }
	        }
	    });
	}
	</script>
</body>

</html>

<%}%>