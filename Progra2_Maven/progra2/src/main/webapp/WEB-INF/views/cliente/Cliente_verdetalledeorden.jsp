<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%Persona user=(Persona) session.getAttribute("usuario");%>
<%if(user==null){
	request.setAttribute("mensaje", "No inicio sesión");
	request.getRequestDispatcher("/publico/Publico_paginaprincipal.jsp").forward(request, response);
}else{%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="Cliente_head.jsp" flush="true"/>
<body>

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-3">
               
                    <div class="panel panel-default sidebar-menu">

                           <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                            	<li>
                                    <a href="micuenta"><i class="fa fa-user"></i>Mi Cuenta</a>
                                </li>
                                <li class="active">
                                    <a href="listarReservas"><i class="fa fa-list"></i>Mis Reservas</a>
                                </li>
                               
                                <li>
                                    <a href="Logout"><i class="fa fa-sign-out"></i>Cerrar Sesión</a>
                                </li>
                            </ul>
</div>
                      

                    </div>
                   
                </div>

                <div class="col-md-9" id="customer-order">
                    <c:if test="${not empty listar}">
                    <c:forEach var="listar" items="${listar}">
                    <div class="box">
                        <h1>Reserva #${listar.idAlquiler}</h1>

                        <p class="lead">
                         La reserva # ${listar.idAlquiler} es del <strong><fmt:formatDate value="${listar.fechaSalida}" pattern="dd/MM/yyyy hh:mm"/></strong>
                         hasta el <strong><fmt:formatDate value="${listar.fechaRetorno}" pattern="dd/MM/yyyy hh:mm"/></strong> y actualmente esta 
                         <c:if test="${listar.estado==0}">
	                     <span class="label label-danger">Eliminado</span>
	                     </c:if>
	                     <c:if test="${listar.estado==1}">
	                     <span class="label label-info">Pendiente</span>
	                     </c:if>
	                     <c:if test="${listar.estado==2}">
	                     <span class="label label-success">Pagado</span>
	                     </c:if>.
	                     </p>
	                     <p><label style="color: red;">*</label><strong>Incluido IGV</strong></p>
                     
                        <hr>
                        <h3>Detalle de Alquiler</h3>
                        
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
                                    	<fmt:formatDate var="fechaR" value="${listar.fechaSalida}" pattern="dd" />
                                    	<fmt:formatDate var="fechaS" value="${listar.fechaRetorno}" pattern="dd" />
                                        <td>Vehículo</td>
                                        <td>S/. ${listar.auto.precioDia*(fechaS-fechaR)} <label style="color: red;">*</label></td>
                                    </tr>
                                    <c:forEach var="listardet" items="${listardet}">
                                    <tr>
                                        <td>${listardet.getRequerimientoEspecial().getNombre()}</td>
                                        <td>S/. ${listardet.getPrecioTotal() } <label style="color: red;">*</label></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="1" class="text-right">subtotal</th>
                                        <th>S/. ${listar.montoAPagar-(listar.montoAPagar*18/100)}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="1" class="text-right">IGV 18%</th>
                                        <th>S/. ${listar.montoAPagar*18/100}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="1" class="text-right">Total</th>
                                        <th>S/. ${listar.montoAPagar}</th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="row ">
                            <div class="col-md-6 col-sm-6">
                                <h2>Lugar de Recojo</h2>
                                <p>SEDE: ${listar.sede1.sede}
                                <br>Ubicación: ${listar.sede1.ubicacion}
                                <br>Departamento: Lima
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <h2>Lugar de Retorno</h2>
                                <p>SEDE: ${listar.sede2.sede}
                                <br>Ubicación: ${listar.sede2.ubicacion}
                                <br>Departamento: Lima
                            </div>
                            
                            
                        </div>
                        
                        <c:if test="${listar.estado!=0}">
                        <div id="dialog" title="Se requiere una confirmación">
						  ¿Está seguro de cancelar su reserva? Luego no podrá deshacer esta acción.
						</div>
                        <div class="row ">
                        	<div class="col-md-12" align="right">
                        	
                                <a href="cancelarreserva?idAlquiler=${listar.idAlquiler}" type="button" class="btn btn-primary confirmar" style="margin-top:30px;">Cancelar Reserva</a>
                            </div>
                       	</div>
                       	</c:if>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>

            </div>
            <!-- /.container -->
        </div>
   <jsp:include page="Cliente_footer.jsp" flush="true"/>


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
	$(document).ready(function() {
	    $("#dialog").dialog({
	      autoOpen: false,
	      modal: true
	    });
	  });

	  $(".confirmar").click(function(e) {
	    e.preventDefault();
	    var targetUrl = $(this).attr("href");

	    $("#dialog").dialog({
	      buttons : {
	        "Aceptar" : function() {
	          window.location.href = targetUrl;
	        },
	        "Cancelar" : function() {
	          $(this).dialog("close");
	        }
	      }
	    });

	    $("#dialog").dialog("open");
	  });
	</script>
</body>

</html>
<%}%>