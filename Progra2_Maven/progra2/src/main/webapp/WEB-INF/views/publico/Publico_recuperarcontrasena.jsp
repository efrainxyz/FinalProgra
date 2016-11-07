<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.0.min.js"></script>
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
                        <h1>Restaurar contrase�a</h1>

                        <p>Escribe la direcci�n e-mail usada al momento de registrarte y te enviaremos tu usuario y contrase�a a dicha direcci�n.</p>
                        <p class="text-muted">Si tiene alguna duda, por favor <a href="Publico_contactenos.jsp">contactenos</a>.</p>

                        <hr>

                        <form id="recuperarContra" name="recuperarContra" action="recuperarContrasena" method="post">
                        	<div class="row">
                        		<div class="col-sm-6">
                                	<div class="form-group">
		                                <label for="correo">Tu direcci�n de correo electr�nico</label>
		                                <input type="text" class="form-control" name="correo" id="correo" maxlength="45" placeholder="Ejemplo: example@gmail.com">
		                            	<p id="result"></p>
		                            </div>
                                </div>
                            </div>
                        	<div class="text-center">
                                <button class="btn btn-primary" id="validate" type="submit"><i class="fa fa-user-md"></i>Enviarme mi contrase�a</button>
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
                            	    $("#result").text(email + " es v�lido.");
                            	    $("#result").css("color", "green");
                            	    return true;
                            	  } else {
                            	    $("#result").text(email + " no es un email v�lido.");
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
