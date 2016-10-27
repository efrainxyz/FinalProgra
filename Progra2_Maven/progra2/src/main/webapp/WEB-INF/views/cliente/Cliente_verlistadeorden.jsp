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

                <div class="col-md-9" id="customer-orders">
                    <div class="box">
	                    <c:if test="${not empty mensaje1}">
		          			<div class="col-sm-12 form-group alert alert-success"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>${mensaje1}</div>
		              	</c:if>
		              	<c:if test="${not empty mensaje}">
		          			<div class="col-sm-12 form-group alert alert-danger"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>${mensaje}</div>
		              	</c:if> 
                        <h1>Mis Reservas</h1>

                        <p class="lead">Sus reservas en un solo lugar.</p>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Número de reserva</th>
                                        <th>Fecha de reserva</th>
                                        <th>Total</th>
                                        <th>Estado</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty lista }">
                                   <c:forEach var="lista" items="${lista}">
	                                    <tr>
	                                        <th># ${lista.idAlquiler}</th>
	                                        <td><fmt:formatDate value="${lista.fechaReserva}" pattern="dd/MM/yyyy"/></td>
	                                        <td>S/. ${lista.montoAPagar}</td>
	                                        <c:if test="${lista.estado==0}">
	                                        <td><span class="label label-danger">Eliminado</span></td>
	                                        </c:if>
	                                        <c:if test="${lista.estado==1}">
	                                        <td><span class="label label-info">Pendiente</span></td>
	                                        </c:if>
	                                        <c:if test="${lista.estado==2}">
	                                        <td><span class="label label-success">Pagado</span></td>
	                                        </c:if>
	                                        <td><a href="verdetalleorden?idAlquiler=${lista.idAlquiler}" class="btn btn-primary btn-sm">Ver</a>
	                                        </td>
	                                    </tr>
                                   </c:forEach>
                                  </c:if> 
                                  <c:if test="${empty lista }">
                                  <tr>
	                              	<th colspan="4">USTED NO HA REALIZADO NINGUNA RESERVA.</th>
	                              </tr>
	                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
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

</body>

</html>
<%}%>