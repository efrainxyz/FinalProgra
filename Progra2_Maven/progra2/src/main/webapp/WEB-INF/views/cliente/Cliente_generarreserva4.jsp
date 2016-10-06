<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%Persona user=(Persona) session.getAttribute("usuario");%>
<%if(user==null){
	request.setAttribute("mensaje", "No inicio sesión");
	request.getRequestDispatcher("/publico/Publico_paginaprincipal.jsp").forward(request, response);
}else{%>
<!DOCTYPE html>
<html lang="es">


<jsp:include page="Cliente_head.jsp" flush="true"/>


<body>


    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-9" id="checkout">

                    <div class="box">
                        <form method="post" action="checkout4.html">
                            
                            <ul class="nav nav-pills nav-justified">
                                <li><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva1.jsp"><i class="fa fa-map-marker"></i><br>Recojo y Retorno</a>
                                </li>
                                <li><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva2.jsp"><i class="fa fa-truck"></i><br>Vehículos</a>
                                </li>
                                <li><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva3.jsp"><i class="fa fa-money"></i><br>Cobertura y Opciones</a>
                                </li>
                                <li class="active"><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva4.jsp"><i class="fa fa-eye"></i><br>Resumen</a>
                                </li>
                            </ul>

                            <div class="content">
                            	<div class="row">
                            		<div class="col-sm-12">
	                            		<p class="form-group">Tipo de pago</p>
	                            		<label class="form-group radio-inline">
									      <input type="radio" name="tipo_pago" id="tp_1" checked>Tarjeta
									    </label>
									    <label class="form-group radio-inline">
									      <input type="radio" name="tipo_pago" id="tp_1">Efectivo
									    </label>
	                            		<div class="form-group" id="p_tarjeta">
	                            			<div class="row">
	                            				<div class="col-sm-6">
			                                        <div class="form-group">
			                                            <label for="ti_tarjeta">Tipo de tarjeta</label>
			                                            <select class="form-control" id="ti_tarjeta"></select>
			                                        </div>
			                                    </div>
		                            			<div class="col-sm-6">
		                                        	<div class="form-group">
		                                            <label for="nro_tarjeta">Número de tarjeta</label>
		                                            <input type="text" class="form-control" id="nro_tarjeta">
		                                        	</div>
	                                    		</div>
	                            			</div>
	                            			<div class="row">
	                            				<div class="col-sm-6">
			                                        <div class="form-group">
			                                            <label for="ti_tarjeta">Fecha Expiracion</label>
			                                            <input class="form-control" id="fec_exp"></select>
			                                        </div>
			                                    </div>
		                            			<div class="col-sm-6">
		                                        	<div class="form-group">
		                                            <label for="cvs">Cvs</label>
		                                            <input type="text" class="form-control" id="cvs">
		                                        	</div>
	                                    		</div>
	                            			</div>
	                            		</div>
	                            				
                            		</div>
                            	</div>
                               	<div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="direccion">Dirección fija o temporal/Nombre del hotel (*)</label>
                                            <input type="text" class="form-control" id="direccion">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="celular">Celular (*)</label>
                                            <input type="text" class="form-control" id="celular">
                                        </div>
                                    </div>
                               	</div>
                               	<div class="row">
                               		<div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="distr">Distrito (*)</label>
                                            <select class="form-control" id="distr"></select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="nro_licencia">Número de licencia de conducir (*)</label>
                                            <input type="text" class="form-control" id="nro_licencia">
                                        </div>
                                    </div>
                                </div>
                               	<div class="row">
                               		<div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="aerolinea">Aerolínea</label>
                                            <input type="text" class="form-control" id="aerolinea">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="nro_vuelo">Número de vuelo</label>
                                            <input type="text" class="form-control" id="nro_vuelo">
                                        </div>
                                    </div>
                                    </div>
                               	<div class="row">
                               		<div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="comentario">Requerimientos adicionales/comentario</label>
                                            <textarea id="comentario" class="form-control"></textarea>
                                        </div>
                                    </div>
                               	</div>
                            </div>
                            <!-- /.content -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva3.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i>Regresar a coberturas y opciones</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Reservar<i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3">

                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>Resumen de reserva</h3>
                        </div>
                        <blockquote>
							<p><strong>TU RESERVA</strong></p>
						</blockquote>
                        <p><strong>Recojo:</strong> 28/08/2016 8:00PM</p>
                        <p>LIMA - OFICINA AEROPUERTO</p>
                        <P><strong>Devolución:</strong> 05/09/2016 10:00AM</p>
                        <p>LIMA - OFICINA AEROPUERTO</p>
						
						<blockquote>
							<p><strong>VEHÍCULO SELECCIONADO</strong></p>
						</blockquote>
						<p><strong>Categoría:</strong> Hyundai i10</p>
						<p><strong>Precio por día:</strong> S/. 128.64</p>
						
						<blockquote>
							<p><strong>CALCULO DE TARIFA</strong></p>
						</blockquote>
						<p>La tarifa es por día.</p>
                        <div class="table-responsive">
                            <table class="table">
                            	<thead>
                                    <tr>
                                        <th>Servicio</th>
                                        <th>Precio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<tr>
                                        <td>Vehículo</td>
                                        <td>S/. 128.64</td>
                                    </tr>
                                    <tr>
                                        <td>Cobertura y Opciones</td>
                                        <td>S/. 41.00</td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                    <tr>
                                        <td>Subtotal</td>
                                        <td>S/. 169.00</td>
                                    </tr>
                                    <tr>
                                        <td>IGV</td>
                                        <td>/. 35.20</td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <th>S/. 204.84</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
     
<jsp:include page="Cliente_footer.jsp" flush="true"/>
     

    </div>

    <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath()%>/js/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/modernizr.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/front.js"></script>
    <!-- Script para hacerle toggle según el tipo de pago -->
    <script>
	    $("[name=tipo_pago]").change(function(){
	  	  $("#p_tarjeta").toggle($("[name=tipo_pago]").index(this)===0);
	  	  $("#p_efectivo").toggle($("[name=tipo_pago]").index(this)===1);
	  	});
    </script>






</body>

</html>

<% }%>