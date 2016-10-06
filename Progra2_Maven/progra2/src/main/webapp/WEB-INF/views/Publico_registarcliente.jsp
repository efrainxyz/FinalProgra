<!DOCTYPE html>
<html lang="en">
<body>
    <jsp:include page="Publico_head.jsp" flush="true"/>
    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <div class="box">
                        <h1>Nueva cuenta</h1>

                        <p>Al tener una cuenta con nosotros puedes:</p>
                        <li>Lograr acceso a ofertas exclusivas.</li>
                        <li>Gestionar todas sus reservas en un mismo lugar.</li>
                        <li>Guardar los datos de pago y del conductor para sus próximas reservas.</li>
                        <br>
                        <p class="text-muted">Si tiene alguna duda, por favor <a href="Publico_contactenos.jsp">contactenos</a>.</p>

                        <hr>

                        <form id="form" name="form" method="post" action="#">
                        	<div class="row">
                        		<div class="col-sm-6">
	                                <div class="form-group">
		                                <label for="usuario">DNI (*)</label>
		                                <input type="number" class="form-control" name="usuario" id="usuario" placeholder="Ingrese su DNI (usuario)">
		                            </div>
                                </div>
                                <div class="col-sm-6">
	                                <div class="form-group">
		                                <label for="contra1">Contraseña (*)</label>
		                                <input type="password" class="form-control" name="contra1" id="contra1" maxlength="15" placeholder="Ingrese su contraseña">
		                            </div>
                                </div>
                                <div class="col-sm-6">
	                                <div class="form-group">
		                                <label for="contra2">Repita su contraseña (*)</label>
		                                <input type="password" class="form-control" name="contra2" id="contra2" maxlength="15" placeholder="Ingrese su contraseña">
		                            </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
		                                <label for="nombre">Nombres (*)</label>
		                                <input type="text" class="form-control" name="nombre" id="nombre" maxlength="45" placeholder="Ingrese sus nombres">
		                            </div>
                                </div>
                                <div class="col-sm-6">
                                	<div class="form-group">
		                                <label for="apePat">Apellido Paterno (*)</label>
		                                <input type="text" class="form-control" name="apePat" id="apePat" maxlength="45" placeholder="Ingrese su apellido paterno">
		                            </div>
                                </div>
                                <div class="col-sm-6">
                                	<div class="form-group">
		                                <label for="apeMat">Apellido Materno (*)</label>
		                                <input type="text" class="form-control" name="apeMat" id="apeMat" maxlength="45" placeholder="Ingrese su apellido materno">
		                            </div>
                                </div>
                                <div class="col-sm-6">
                                	<div class="form-group">
		                                <label for="correo">Correo (*)</label>
		                                <input type="text" class="form-control" name="correo" id="correo" maxlength="45" placeholder="Ejemplo: example@gmail.com">
		                            </div>
                                </div>
                            </div>
                        	<div class="text-center">
                                <button class="btn btn-primary" onclick="return validar(this.form)" type="submit"><i class="fa fa-user-md"></i> Crear Cuenta</button>
                            </div>
                            <br>
                            <div class="row">
                            <div class="col-sm-12 form-group alert alert-danger" style="display: none;" id="errorRegistrar1">Por favor complete todos los campos.</div>
		                 	<div class="col-sm-12 form-group alert alert-danger" style="display: none;" id="errorRegistrar2">Las contraseñas escritas no coinciden.</div>
		                 	<div class="col-sm-12 form-group alert alert-danger" style="display: none;" id="errorRegistrar3">El DNI tiene que tener 8 carácteres. Ejemplo:75228582.</div>
                            </div>
                            <script>
								function validar(){
									//El primero evalua si los campos están vacios
									//El segundo si las contraseñas ingresadas son iguales
									//El tercero si los usuarios tienen 8 caracteres
									if(form.usuario.value==""||form.contra1.value==""||form.contra2.value==""||form.nombre.value==""||form.apePat.value==""||form.apeMat.value==""||form.correo.value==""){
										document.getElementById("errorRegistrar1").style.display = "block";
										document.getElementById("errorRegistrar2").style.display = "none";
										document.getElementById("errorRegistrar3").style.display = "none";
										return false;
									}else if(form.contra1.value!==form.contra2.value){
										document.getElementById("errorRegistrar1").style.display = "none";
										document.getElementById("errorRegistrar2").style.display = "block";
										document.getElementById("errorRegistrar3").style.display = "none";
										return false;
																
									}else if (form.usuario.value<=10000000 || form.usuario.value>=99999999){
										document.getElementById("errorRegistrar1").style.display = "none";
										document.getElementById("errorRegistrar2").style.display = "none";
										document.getElementById("errorRegistrar3").style.display = "block";
										return false;
																
									} else {
										document.getElementById("errorRegistrar1").style.display = "none";
										document.getElementById("errorRegistrar2").style.display = "none";
										document.getElementById("errorRegistrar3").style.display = "none";
										return true;
									}
								}
							</script>
	
                        </form>
                    </div>
                </div>
			</div>
            <!-- /.container -->
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
