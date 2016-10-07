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
                    <div class="row" id="productMain">
                        <div class="col-sm-4">
                        	<div class="box">
	                            <div id="mainImage" >
	                                <img src="<%=request.getContextPath() %>/resources/img/audi_rzero1.jpg" alt="" class="img-responsive">
	                            </div>
								<hr>
								<a href="reserva1" class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Reservar</a>
									                           
							</div>
                        </div>
                  <div class="col-sm-8 ">
                     <div class="box">
                      	<div class="content">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                   
                                         <h3> Descripciones Tecnicas	</h3>
                                        
                                            <tr>
                                            	<td><b>Marca</b></td>
                                                <td>Kia</td>
                                            </tr>
                                            <tr>
                                                <td><b>Modelo</b></td>
                                                <td>Picante o similar</td>
                                            </tr>
                                            <tr>
                                                <td><b>Categoria</b></td>
                                                <td>economico</td>
                                            </tr>
                                            <tr>
                                                <td><b>Tipo</b></td>
                                                <td>Mecanico</td>
                                            </tr>
                                            <tr>
                                                <td><b>Combustible</b></td>
                                                <td>Gasolina</td>
                                            </tr>
                                            <tr>
                                                <td><b>Combustible</b></td>
                                                <td>Gasolina</td>
                                            </tr>
                                            <tr>
                                                <td><b>Número de puerta</b></td>
                                                <td>5</td>
                                            </tr>
                                             <tr>
                                                <td><b>capacidad de pasajeros</b></td>
                                                <td>5</td>
                                            </tr>
                                            <tr>
                                                <td><b>Aire acondicionado</b> </td>
                                                <td>si</td>
                                            </tr>
                                            <tr>
                                                <td><b>Descripcion </b></td>
                                                <td>radio CD/MP3, Sistema antirobo, cierre centralizado, espejo retrovisor,frenos hidraulicos , direccion asistida.</td>
                                            </tr>
                                            
                                        </tbody>
                                        
                                    </table>

                                </div>
                                <!-- /.table-responsive -->
                            </div>

                     </div>
                  </div>
                  
               </div>
            </div>
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

</body>

</html>
<%}%>