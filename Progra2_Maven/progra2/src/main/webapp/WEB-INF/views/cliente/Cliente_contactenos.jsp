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

                <div class="col-md-12">


                    <div class="box" id="contact">
                        <h1>Contactenos</h1>

                        <p class="lead">¿Desea conseguir mas información sobre nuestros productos? ¿Hacer una recomendación?</p>
                        <p>Sientase libre a contactarnos, nuestro servicio  a clientes está funcionando 24/7 para usted.</p>

                        <hr>

                       <form>
                            <div class="row">

                                <div class="col-sm-6">
                                    <div class="form-group">
                                      <label for="tipoConsulta">Tipo de Consulta</label>
                                      <select class="form-control" id="tipoConsulta">
                                        <option>Sobre el servicio en general</option>
                                        <option>Cotización personal</option>
                                        <option>Problema con la página web</option>
                                        <option>Sugerencia</option>
                                        <option>Reclamo</option>
                                      </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="nombreC">Nombre completo *</label>
                                        <input type="text" class="form-control" id="nombreC">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="email">Correo electrónico *</label>
                                        <input type="text" class="form-control" id="email">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="telefono">Teléfono *</label>
                                        <input type="text" class="form-control" id="telefono">
                                    </div>
                                </div>



                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="consulta">Consulta</label>
                                        <textarea id="consulta" class="form-control"></textarea>
                                    </div>
                                </div>

                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> Enviar Mensaje</button>

                                </div>
                            </div>
                            <!-- /.row -->
                        </form>
                       

                        <hr>

                        <div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3900.8608764653454!2d-77.03057788518667!3d-12.121670091417476!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8197792e9a1%3A0x748f5ce9be966dcb!2sPasaje+Tello+215%2C+Lima+15074!5e0!3m2!1sen!2spe!4v1471285926005" width="1060" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-4">
                                <h3><i class="fa fa-map-marker"></i> Oficina principal</h3>
                                <p><strong>Av. La Fontana 1250</strong>
                                    <br>Urb. Santa Patricia
                                    <br>La Molina
                                    <br>Lima
                                    <br>
                                    
                                </p>
                            </div>
                            <!-- /.col-sm-4 -->
                            <div class="col-sm-4">
                                <h3><i class="fa fa-phone"></i> Telefono</h3>
                                <p><strong>+51 2086000</strong>
                                </p>
                            </div>
                            <!-- /.col-sm-4 -->
                            <div class="col-sm-4">
                                <h3><i class="fa fa-envelope"></i> Email</h3>
                                
                                    <li><strong><a href="mailto:">reservas@obaju.com</a></strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
      
      <jsp:include page="Cliente_footer.jsp" flush="true"/>



    </div>

    <script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/modernizr.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/front.js"></script>

	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>

    <script>
        function initialize() {
            var mapOptions = {
                zoom: 15,
                center: new google.maps.LatLng(49.1678136, 16.5671893),
                mapTypeId: google.maps.MapTypeId.ROAD,
                scrollwheel: false
            }
            var map = new google.maps.Map(document.getElementById('map'),
                mapOptions);

            var myLatLng = new google.maps.LatLng(49.1681989, 16.5650808);
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>


</body>

</html>
<%}%>