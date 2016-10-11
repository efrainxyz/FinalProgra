	
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
<html lang="en">

<jsp:include page="Administrador_head.jsp" flush="true"/>

<body>
    

    <div id="all">        
        <div class="content">
            <div class="container">
                <div class="col-sm-12">
                    
                    <div class="box" id="mantenerAuto">
                    
                    <h1>Agregar un auto</h1>
                    <hr>
                    <form action="agregarAuto">
                    <input type="hidden" name="accion" value="agregar">
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="matricula">Matrícula</label>
                                    <input type="text" class="form-control" id="matricula" name="matricula" maxlength="7" placeholder="Ejemplo: IH8-PPL">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="nro_pasajero">Número de pasajeros</label>
                                    <input type="number" class="form-control" id="nro_pasajero" name="nroPasajero" min="1" max="99" placeholder="Ingrese el número de pasajeros">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="nro_puertas">Número de puertas</label>
                                    <input type="number" class="form-control" id="nro_puertas" name="nroPuertas" min="1" max="9" placeholder="Ingrese el número de puertas">
                                </div>
                            </div> 
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="aire_acon">¿Tiene Aire Acondicionado?</label>
                                    <select class="form-control" id="aire_acon" name="aireacondicionado">
                                        <option value="si">Sí</option>
                                        <option value="no">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="precio_dia">Precio por día</label>
                                    <input type="text" class="form-control" id="precio_dia" name="precioDia" maxlength="45" placeholder="Ejemplo:  85.20">
                                </div>
                            </div> 
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="ubicacion">Ubicación del auto (Sede)</label>
                                   
                                    <select class="form-control" id="sede" name="idSede">
                                        <option>Seleccione</option>
                                        <c:if test="${not empty listarsede}">
		        							<c:forEach var="listarsede" items="${listarsede}">
	               		 						<option value="${listarsede.idSede}">${listarsede.sede}</option>	        		
								        	</c:forEach>
							        	</c:if>
                                    </select>
                                   
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="marca_auto">Marca de Auto</label>
                                    <select class="form-control" id="marca_auto" onchange="listarModelo();">
                                        <c:if test="${not empty listarmarcaauto}">
		        							<c:forEach var="listarmarcaauto" items="${listarmarcaauto}">
	               		 						<option value="${listarmarcaauto.idMarcaAuto}">${listarmarcaauto.marca}</option>	        		
								        	</c:forEach>
							        	</c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="modelo_auto">Modelo de Auto</label>
                                    <select class="form-control" id="modelo_auto" name="idModeloAuto">
                                        <option>Seleccione</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="categoria_auto">Categoría de Auto</label>
                                  	<select class="form-control" id="aire_acon" name="categoriaAuto">
                                        <option value="auto">Auto</option>
                                        <option value="camioneta">Camioneta</option>
                                        <option value="vans">Vans</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="tipo_viaje">Tipo de Viaje</label>
                                    <select class="form-control" id="tipo_viaje" name="idTipoViajeAuto">
                                       <c:if test="${not empty listartipoviaje}">
		        							<c:forEach var="listartipoviaje" items="${listartipoviaje}">
	               		 						<option value="${listartipoviaje.idTipoViajeAuto}">${listartipoviaje.tipo}</option>	        		
								        	</c:forEach>
							        	</c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="transmision">Transmisión</label>
                                    <select class="form-control" id="transmision" name="transmision">
                                        <option>Seleccione</option>
                                        <option value="transmision">Transmisión</option>
                                        <option value="mecanico">Mecánico</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="combustible">Combustible</label>
                                    <select class="form-control" id="combustible" name="combustibleAuto">
                                        <option>Seleccione</option>
                                        <option value="gas">Gas</option>
                                        <option value="gasolina">Gasolina</option>
                                    </select>
                                </div>
                            </div>
                              
                              
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="transmision">Año</label>
                                    <input type="number" class="form-control" id="year" name="year" maxlength="4"  placeholder="Ejemplo: 2006">
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="combustible">Foto</label>
                                   <input type="text" class="form-control" id="imagen" name="imagen"  placeholder="Ejemplo: Www.imagenes/image.png">
                                </div>
                            </div>  
                              
                              
                              
                            <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="descripcion_auto">Descripción</label>
                                        <textarea id="descripcion_auto" class="form-control" name="descripcion" maxlength="500" placeholder="Límite de 500 carácteres"></textarea>
                                    </div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <div class="box-footer">
                                <div class="pull-left">
                                    <a href="Administrador_mantenerauto.jsp" class="btn btn-default"><i class="fa fa-chevron-left"></i>Cancelar</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Agregar Auto
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
<script src="<%=request.getContextPath()%>/resources/js/auto.js"></script>
</body>

</html>
<%}%>