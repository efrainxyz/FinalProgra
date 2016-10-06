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
	            <div class="content">
	                         <!-- Recomendador -->       
		              		<div class="col-md-3">
		                 		<div class="panel panel-default sidebar-menu">
									<div class="panel-heading">
			                           <h2 class="panel-title">Recomendador</h2>
			                        </div>
			
			                        <div class="panel-body">
			                            <form id="recomendador" name="recomendador" method="post" action="<%=request.getContextPath() %>/Recomendador">
			                               <div class="form-group">
				                               <h5>Tipo de Viaje:</h5>
				                               <select class="form-control" id="tipoViaje">
				                               		<option>Tipo 1</option>
				                               </select>
				                               <h5>N&uacutemero de Pasajeros:</h5>
				                               <input type="text" class="form-control" name="nroPasa" id="nroPasa">
				                               <h5>Precio por d&iacute;a:</h5>
				                               <b>28 </b><input type="text" class="span2" value="" data-slider-min="28" data-slider-max="140" data-slider-step="1" data-slider-value="[50,100]" id="precioDia"><b> 140</b>
				                           </div>
			                                  <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Buscar</button>
			                            </form>
			                          </div>
		                         </div>
		                    </div> 
	
		                    <div class="col-md-9">
		                        <div class="row-product pagination__list">
		                        			<%for (int i=0;i<56;i++){ %>
	                                        <div class="col-md-4 col-sm-6 pagination__item">
	                                            <div class="product">
	                                                <div class="flip-container">
	                                                    <div class="flipper">
	                                                        <div class="front">
	                                                            <a href="Cliente_detalledeproducto.jsp">
	                                                                <img src="<%=request.getContextPath() %>/img/audi2.jpg" alt="" class="img-responsive">
	                                                            </a>
	                                                        </div>
	                                                        <div class="back">
	                                                            <a href="Cliente_detalledeproducto.jsp">
	                                                                <img src="<%=request.getContextPath() %>/img/audi2.jpg" alt="" class="img-responsive">
	                                                            </a>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <a href="Cliente_detalledeproducto.jsp" class="invisible">
	                                                    <img src="<%=request.getContextPath() %>/img/audi2.jpg" alt="" class="img-responsive">
	                                                </a>
	                                                <div class="text">
	                                                    <h3><a href="Cliente_detalledeproducto.jsp">Audi RZero</a></h3>
	                                                    <p class="price">
	                                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>5
	                                                    <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> 3
	                                                    </p>
	                                                    <p class="price">Desde $81.23</p>
	                                                    <p class="buttons">
	                                                        <a href="Cliente_detalledeproducto.jsp" class="btn btn-primary">Ver Detalle</a>
	                                                    </p>
	                                                </div>
	                                                <!-- /.text -->
	                                            </div>
	                                            <!-- /.product -->
	                                        </div>
	                                        <%} %>
											
	                             </div>
		                   </div>
		                                
				</div>
				</div>
			
           
        </div>
	
	<jsp:include page="Cliente_footer.jsp" flush="true"/>
    </div>

    <script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath() %>/js/waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/modernizr.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/front.js"></script>
    <!-- Para el touchspin -->
	<script src="<%=request.getContextPath()%>/js/jquery.bootstrap-touchspin.min.js"></script>
    <script>
        $("input[name='nroPasa']").TouchSpin({
            min: 1,
            max: 20,
            boostat: 5,
            maxboostedstep: 10,
            initval:1
        });
    </script>
    <!--Para el Slider -->
    <script src="<%=request.getContextPath()%>/js/bootstrap-slider.js"></script>
    <script>
        $("#precioDia").slider({});
    </script>
    <!-- Para la paginacion... -->
    <script src="<%=request.getContextPath()%>/js/jQuery.paginate.js"></script>
    <script>
    $('.pagination__list').paginate({
    	  items_per_page: 6
    });


    </script>
  

</body>

</html>
<% }%>