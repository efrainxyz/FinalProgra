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

                <div class="col-md-3">
                    
                    <div class="panel panel-default sidebar-menu">

                           <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                            	<li class="active">
                                    <a href="micuenta"><i class="fa fa-user"></i>Mi Cuenta</a>
                                </li>
                                <li>
                                    <a href="listarReservas"><i class="fa fa-list"></i>Mis Reservas</a>
                                </li>
                               
                                <li>
                                    <a href="Logout"><i class="fa fa-sign-out"></i>Cerrar Sesión</a>
                                </li>
                            </ul>
</div>
                      

                    </div>
                      </div>

                <div class="col-md-9">
                    <div class="box">
                        <h1>Mi Cuenta</h1>
                        <p class="lead">Cambie sus datos personales o su contraseña aqui.</p>
                        
                        <h3>Cambiar la contraseña</h3>

                        <form>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_old">Contraseña Actual</label>
                                        <input type="password" class="form-control" id="password_old" placeholder="Ingrese su contraseña actual">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_1">Contraseña Nueva</label>
                                        <input type="password" class="form-control" id="password_1" placeholder="Ingrese su contraseña nueva">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_2">Repetir Contraseña Nueva</label>
                                        <input type="password" class="form-control" id="password_2" placeholder="Ingrese de nuevo su contraseña">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="col-sm-12 text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>Guardar la nueva clave</button>
                            </div>
                        </form>

                        <hr>

                        <h3>Detalles personales</h3>
                        <form>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="nombre">Nombres</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese sus nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="apeMat">Apellido Materno</label>
                                        <input type="text" class="form-control" id="apePat" name="apeMat" placeholder="Ingrese su Apellido Paterno">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="apePat">Apellido Paterno</label>
                                        <input type="text" class="form-control" id="apePat" name="apePat" placeholder="Ingrese su Apellido Materno">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="correo">Correo electronico</label>
                                        <input type="text" class="form-control" id="correo" name="correo" placeholder="Ejempo: ejemplo@gmail.com">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="row">

                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Guardar cambios</button>

                                </div>
                            </div>
                        </form>
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