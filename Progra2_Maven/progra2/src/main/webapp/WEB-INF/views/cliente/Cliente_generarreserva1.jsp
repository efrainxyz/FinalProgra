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

                <div class="col-md-12" id="checkout">

                    <div class="box">
                        <form method="post" action="checkout2.html">
                            <ul class="nav nav-pills nav-justified">
                                <li class="active"><a href="reserva1"><i class="fa fa-map-marker"></i><br>Recojo y Retorno</a>
                                </li>
                                <li><a href="reserva2"><i class="fa fa-truck"></i><br>Vehículos</a>
                                </li>
                                <li><a href="reserva3"><i class="fa fa-money"></i><br>Cobertura y Opciones</a>
                                </li>
                                <li class="disabled"><a href="reserva4"><i class="fa fa-eye"></i><br>Resumen</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                   <div class="col-sm-12">
                                        <div class="form-group">
                                            <h2>Al reservar con nosotros puedes:</h2>
                                            <li>Sin comisiones por paga con tarjeta.</li>
                                            <li>Sin cargos por modificar tu  reserva.</li>
                                            <li>Atenci&oacute;n al cliente las 24 horas.</li>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">Ciudad de Entrega</label>
                                            <select class="form-control" id="cidudad_entrega"></select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">Ciudad de Devoluci&oacute;n</label>
                                            <select class="form-control" id="cidudad_devolucion"></select>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="fechaRecogida">Fecha de Recogida y Hora</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control form-date" name="fechaRecogida" id="fechaRecogida">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="fechaDevolucion">Fecha de Devoluci&oacute;n y Hora</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control form-date" name="fechaDevolucion" id="fechaDevolucion">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                
                                <!-- /.row -->
                            </div>

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="inicioCli" class="btn btn-default"><i class="fa fa-chevron-left"></i>Cancelar</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Continuar<i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
       


                </div>


            </div>
    
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
  	<!--Para el datetimepicker-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/moment.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/es.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#fechaRecogida').datetimepicker({
                locale:'es',
                minDate: new Date
            });
            $('#fechaDevolucion').datetimepicker({
                useCurrent: false, //Important! See issue #1075
                locale:'es',
            });
            $("#fechaRecogida").on("dp.change", function (e) {
                $('#fechaDevolucion').data("DateTimePicker").minDate(e.date);
            });
            $("#fechaDevolucion").on("dp.change", function (e) {
                $('#fechaRecogida').data("DateTimePicker").maxDate(e.date);
            });
        });
    </script>





</body>

</html>

<%}%>