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

<jsp:include page="Cliente_head.jsp" flush="true"/>

<body>
   
    <div id="all">

        <div id="content">
            <div class="container">

               
                <div class="col-md-3">
                 
                    <div class="panel panel-default sidebar-menu">

                            <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                            	<li >
                                    <a href="<%=request.getContextPath() %>/cliente/Cliente_micuenta.jsp"><i class="fa fa-user"></i>Mi Cuenta</a>
                                </li>
                                <li class="active">
                                    <a href="<%=request.getContextPath() %>/cliente/Cliente_verlistadeorden.jsp"><i class="fa fa-list"></i>Mis Reservas</a>
                                </li>
                               
                                <li>
                                    <a href="<%=request.getContextPath() %>/Logout"><i class="fa fa-sign-out"></i>Cerrar Sesión</a>
                                </li>
                            </ul>
                        </div>
                      

                    </div>
               
                </div>

                <div class="col-md-9" id="customer-orders">
                    <div class="box">
                        <h1>Mis Reservas</h1>

                        <p class="lead">Sus reservas en un solo lugar.</p>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Número de reserva</th>
                                        <th>Fecha</th>
                                        <th>Total</th>
                                        <th>Estado</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>S/. 150.00</td>
                                        <td><span class="label label-info">En entrega</span>
                                        </td>
                                        <td><a href="<%=request.getContextPath() %>/cliente/Cliente_verdetalledeorden.jsp" class="btn btn-primary btn-sm">Ver</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>S/. 150.00</td>
                                        <td><span class="label label-info">En entrega</span>
                                        </td>
                                        <td><a href="<%=request.getContextPath() %>/cliente/Cliente_verdetalledeorden.jsp" class="btn btn-primary btn-sm">Ver</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>S/. 150.00</td>
                                        <td><span class="label label-success">Devuelto</span>
                                        </td>
                                        <td><a href="<%=request.getContextPath() %>/cliente/Cliente_verdetalledeorden.jsp" class="btn btn-primary btn-sm">Ver</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th># 1735</th>
                                        <td>22/06/2013</td>
                                        <td>S/. 150.00</td>
                                        <td><span class="label label-danger">Cancelado</span>
                                        </td>
                                        <td><a href="<%=request.getContextPath() %>/cliente/Cliente_verdetalledeorden.jsp" class="btn btn-primary btn-sm">Ver</a>
                                        </td>
                                    </tr>
                                   
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
<%}%>