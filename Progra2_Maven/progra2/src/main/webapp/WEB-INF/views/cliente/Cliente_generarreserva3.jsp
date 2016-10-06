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

 

                <div class="col-md-12" id="checkout">

                    <div class="box">
                        <form method="post" action="checkout4.html">
                          
                           <ul class="nav nav-pills nav-justified">
                                <li class="disabled"><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva1.jsp"><i class="fa fa-map-marker"></i><br>Recojo y Retorno</a>
                                </li>
                                <li class="disabled"><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva2.jsp"><i class="fa fa-truck"></i><br>Vehículos</a>
                                </li>
                                <li class="active"><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva3.jsp"><i class="fa fa-money"></i><br>Cobertura y Opciones</a>
                                </li>
                                <li class="disabled"><a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva4.jsp"><i class="fa fa-eye"></i><br>Resumen</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Cobertura de colisi&oacute;n y robo del Veh&iacute;culo.</h4>
                                            
                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.27.60</p>
                                            <br>

                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_1" value="1">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Cobertura de accidentes personales.</h4>

                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.17.25</p>
                                            <br>

                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_2" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Cobertura de accidentes personales.</h4>

                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.17.25</p>
                                            <br>

                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_3" value="3">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Cobertura de responsabilidad civil.</h4>

                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.34.50</p>
                                            <br>

                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_4" value="4">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Otras opciones -->
                                    
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>GPS</h4>

                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.24.15</p>
                                            <br><br>

                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_5" value="5">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Conductor adicional</h4>

                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.13.80</p>
                     						<br><br>
                     						<div class="box-footer text-center">

                                                <input type="checkbox" name="cob_6" value="6">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Solicitud de servicio de chofer</h4>
		                                            
                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.0.00</p>
                                            <br><br>
								
                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_7" value="7">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Silla para bebe</h4>
                                            <table class="cant">
	                                            <tr>
													<td>Cantidad</td>
													
													<td>
													<select class="form-control col-sm-1" id="sel1">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
													</select>
													</td>
												</tr>
											</table>
			
                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.13.80</p><br>
                                            
                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_5" value="5">
                                            </div>
                                        </div>
                                    </div>
                                                                        
                                    <div class="col-sm-6">
                                        <div class="box">

                                            <h4>Silla para niño</h4>
                                            <table class="cant">
	                                            <tr>
													<td>Cantidad</td>
													<td>
													<select class="form-control col-sm-1" id="sel1">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
													</select>
													</td>
												</tr>
											</table>
			
                                            <p class="pull-right"><strong>Precio por d&iacute;a:</strong> S/.13.80</p>

                                            <div class="box-footer text-center">

                                                <input type="checkbox" name="cob_5" value="5">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                            </div>
                            <!-- /.content -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="<%=request.getContextPath() %>/cliente/Cliente_generarreserva2.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i>Regresar a Vehículos</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Continuar<i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->


                </div>

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






</body>

</html>

<%} %>