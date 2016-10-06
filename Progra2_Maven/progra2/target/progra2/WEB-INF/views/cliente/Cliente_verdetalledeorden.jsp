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

                <div class="col-md-9" id="customer-order">
                    <div class="box">
                        <h1>Reserva #1735</h1>

                        <p class="lead">La reserva #173 es del <strong>22/06/2013</strong> hasta el <strong>25/06/2013</strong> y actualemente esta <strong>en entrega</strong>.</p>
                     
                        <hr>

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
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="1" class="text-right">subtotal</th>
                                        <th>S/.169.00</th>
                                    </tr>
                                    <tr>
                                        <th colspan="1" class="text-right">IGV 18%</th>
                                        <th>S/.35.00</th>
                                    </tr>
                                    <tr>
                                        <th colspan="1" class="text-right">Total</th>
                                        <th>S/.204.84</th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="row ">
                            <div class="col-md-6 col-sm-6">
                                <h2>Lugar de Recojo</h2>
                                <p>SEDE: AEROPUERTO JORGE CHAVEZ
                                    <br>Ubicación: Callao
                                    <br>Departamento: Lima
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <h2>Lugar de Retorno</h2>
                                <p>SEDE: AEROPUERTO JORGE CHAVEZ
                                    <br>Ubicación: Callao
                                    <br>Departamento: Lima
                            </div>
                            
                            
                        </div>
                        
                        <div class="row ">
                        	<div class="col-md-12" align="right">
                        	
                                <button type="submit"  class="btn btn-primary" style="margin-top:30px;">Cancelar Reserva</button>
                            </div>
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