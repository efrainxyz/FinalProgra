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
	                                <img src="${bean.imagen}" alt="" class="img-responsive">
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
                                                <td>${bean.modeloAuto.marcaAuto.marca}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Modelo</b></td>
                                                <td>${bean.modeloAuto.modelo}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Transmision</b></td>
                                                <td>${bean.transmision}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Combustible</b></td>
                                                <td>${bean.combustibleAuto}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Número de puerta</b></td>
                                                <td>${bean.nroPuertas}</td>
                                            </tr>
                                             <tr>
                                                <td><b>Capacidad de pasajeros</b></td>
                                                <td>${bean.nroPasajeros}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Aire acondicionado</b> </td>
                                                <td>${bean.aireacondicionado}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Descripcion </b></td>
                                                <td>${bean.descripcion}</td>
                                            </tr>
                                            
                                        </tbody>
                                        
                                    </table>

                                </div>
                                <!-- /.table-responsive -->
                            </div>

                     </div>
                  </div>
                  <div class="col-sm-12 form-group alert alert-danger" style="display: none;" id="reservarInfo">Usted debe <a href="#" data-toggle="modal" data-target="#login-modal">Iniciar Sesión</a> o <a href="registrarse">Registrarse</a> para realizar una reserva.</div>
               </div>
            </div>
        </div>
       
		<jsp:include page="Publico_footer.jsp" flush="true"/>
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