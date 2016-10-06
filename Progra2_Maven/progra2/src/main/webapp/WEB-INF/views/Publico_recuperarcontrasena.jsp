<!DOCTYPE html>
<html lang="en">
<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
<%String mensaje=(String)request.getAttribute("msj");
String mensaje1=(String)request.getAttribute("msj1");
String mensaje2=(String)request.getAttribute("msj2");%>
<body>
    <jsp:include page="Publico_head.jsp" flush="true"/>
    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <div class="box">
                        <h1>Restaurar contraseña</h1>

                        <p>Escribe la dirección e-mail usada al momento de registrarte y te enviaremos tu usuario y contraseña a dicha dirección.</p>
                        <p class="text-muted">Si tiene alguna duda, por favor <a href="Publico_contactenos.jsp">contactenos</a>.</p>

                        <hr>

                        <form id="recuperarContra" name="recuperarContra" action="<%=request.getContextPath() %>/RecuperarContrasena" method="post">
                        	<div class="row">
                        		<div class="col-sm-6">
                                	<div class="form-group">
		                                <label for="correo">Tu dirección de correo electrónico</label>
		                                <input type="text" class="form-control" name="correo" id="correo" maxlength="45" placeholder="Ejemplo: example@gmail.com">
		                            	<p id="result"></p>
		                            </div>
                                </div>
                            </div>
                        	<div class="text-center">
                                <button class="btn btn-primary" id="validate" type="submit"><i class="fa fa-user-md"></i>Enviarme mi contraseña</button>
                            </div>
                            <br>
                            <div class="row">
                            	<%if(mensaje!=null){%>
									<div class="col-sm-12 form-group alert alert-danger"><%=mensaje%></div>
								<%}%>
	                            <%if(mensaje1!=null){%>
									<div class="col-sm-12 form-group alert alert-success"><%=mensaje1%></div>
								<%}%>
								<%if(mensaje2!=null){%>
									<div class="col-sm-12 form-group alert alert-danger"><%=mensaje2%></div>
								<%}%>
							</div>
		                    <script>
                            function validateEmail(email) {
                            	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                            	  return re.test(email);
                            	}
                            function validate() {
                            	  $("#result").text("");
                            	  var email = $("#correo").val();
                            	  if (validateEmail(email)) {
                            	    $("#result").text(email + " es válido.");
                            	    $("#result").css("color", "green");
                            	    return true;
                            	  } else {
                            	    $("#result").text(email + " no es un email válido.");
                            	    $("#result").css("color", "red");
	
                              	 	return false;
                            	  }
                            }
                            $("#recuperarContra").bind("submit", validate);
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
