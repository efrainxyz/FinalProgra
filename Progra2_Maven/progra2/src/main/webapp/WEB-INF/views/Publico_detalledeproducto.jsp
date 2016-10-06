<!DOCTYPE html>
<html lang="en">
<jsp:include page="Publico_head.jsp" flush="true"/>
<body>
    <div id="all">

        <div id="content">
            <div class="container">
                    <div class="row" id="productMain">
                        <div class="col-sm-4">
                        	<div class="box">
	                            <div id="mainImage" >
	                                <img src="<%=request.getContextPath() %>/img/audi_rzero1.jpg" alt="" class="img-responsive">
	                            </div>
								<hr>
								<button class="btn btn-default btn-sm btn-primary" onclick="return scriptInfo(this.form)"><i class="fa fa-pencil"></i> Reservar</button>
								<script>
									function scriptInfo(){
										document.getElementById("reservarInfo").style.display = "block";
									}
								</script>
							</div>
                        </div>
                  <div class="col-sm-8 ">
                     <div class="box">
                      	<div class="content">
                      			<h3>Descripciones Tecnicas</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                   
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
                  <div class="col-sm-12 form-group alert alert-danger" style="display: none;" id="reservarInfo">Usted debe Iniciar Sesión o <a href="Publico_registarcliente.jsp">Registrarse</a> para realizar una reserva.</div>
               </div>
            </div>
        </div>
       
		<jsp:include page="Publico_footer.jsp" flush="true"/>
    </div>
  
    <script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath() %>/js/waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/modernizr.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap-hover-dropdown.js"></script>
    <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/front.js"></script>


</body>

</html>