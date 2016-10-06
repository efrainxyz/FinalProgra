<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  

<%Persona user=(Persona) session.getAttribute("usuario");
    if(user==null){
		System.out.println("TAMAAAAAAAAAAAAÑOOO "+user);
		request.getRequestDispatcher("home").forward(request, response);
	}else{System.out.println("TAMAAAAAAAAAAAAÑOOO sinoooo "+user);
%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="Administrador_head.jsp" flush="true"/>

<body>

    <div id="all">

        <div id="content">

            <div class="container">
                <div class="col-md-12">
                    <div id="main-slider">
                        <div class="item">
                            <img src="<%=request.getContextPath() %>/resources/img/main-slider1.jpg" alt="" class="img-responsive">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="<%=request.getContextPath() %>/resources/img/main-slider2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="<%=request.getContextPath() %>/resources/img/main-slider3.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="<%=request.getContextPath() %>/resources/img/main-slider4.jpg" alt="">
                        </div>
                    </div>
                    <!-- /#main-slider -->
                </div>
            </div>


            <div id="hot">

                <div class="box">
                    <div class="container">
                        <div class="col-md-12">
                            <h2>Compañias de prestigio. Amplia gama de coches. ¡Grandes descuentos!</h2>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="product-slider">
                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product1.jpg" alt="" class="img-responsive">
                                         
                                        </div>
                                        <div class="back">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product1.jpg" alt="" class="img-responsive">
                                           
                                        </div>
                                    </div>
                                </div>
                              
                                    <img src="<%=request.getContextPath() %>/resources/img/product1.jpg" alt="" class="img-responsive">
                                
                              
                            </div>
                          
                        </div>

                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            
                                                <img src="<%=request.getContextPath() %>/resources/img/product2.jpg" alt="" class="img-responsive">
                                          
                                        </div>
                                        <div class="back">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product2.jpg" alt="" class="img-responsive">
                                           
                                        </div>
                                    </div>
                                </div>
                               
                                    <img src="<%=request.getContextPath() %>/resources/img/product2.jpg" alt="" class="img-responsive">
                               

                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                                <img src="<%=request.getContextPath() %>/resources/img/product3.jpg" alt="" class="img-responsive">
                                            
                                        </div>
                                        <div class="back">
                                     
                                                <img src="<%=request.getContextPath() %>/resources/img/product3.jpg" alt="" class="img-responsive">
                                      
                                        </div>
                                    </div>
                                </div>
                                
                                    <img src="<%=request.getContextPath() %>/resources/img/product3.jpg" alt="" class="img-responsive">
                            
                    
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product4.png" alt="" class="img-responsive">
                                      
                                        </div>
                                        <div class="back">
                                        
                                                <img src="<%=request.getContextPath() %>/resources/img/product4.png" alt="" class="img-responsive">
                                    
                                        </div>
                                    </div>
                                </div>
                              
                                    <img src="<%=request.getContextPath() %>/resources/img/product4.png" alt="" class="img-responsive">
                        
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product5.jpg" alt="" class="img-responsive">
                                          
                                        </div>
                                        <div class="back">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product5.jpg" alt="" class="img-responsive">
                                 
                                        </div>
                                    </div>
                                </div>
                         
                                    <img src="<%=request.getContextPath() %>/resources/img/product5.jpg" alt="" class="img-responsive">
                         
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                         
                                                <img src="<%=request.getContextPath() %>/resources/img/product6.png" alt="" class="img-responsive">
                                          
                                        </div>
                                        <div class="back">
                                          
                                                <img src="<%=request.getContextPath() %>/resources/img/product6.png" alt="" class="img-responsive">
                                          
                                        </div>
                                    </div>
                                </div>
                              
                                    <img src="<%=request.getContextPath() %>/resources/img/product6.png" alt="" class="img-responsive">
                           
                            </div>
                 
                        </div>
                        <!-- /.col-md-4 -->

                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                           
                                                <img src="<%=request.getContextPath() %>/resources/img/product7.jpg" alt="" class="img-responsive">
                                       
                                        </div>
                                        <div class="back">
                                            
                                                <img src="<%=request.getContextPath() %>/resources/img/product7.jpg" alt="" class="img-responsive">
                                           
                                        </div>
                                    </div>
                                </div>
                               
                                    <img src="<%=request.getContextPath() %>/resources/img/product7.jpg" alt="" class="img-responsive">
                              
                               
                            </div>
                            <!-- /.product -->
                        </div>

                    </div>
                    <!-- /.product-slider -->
                </div>
                <!-- /.container -->

            </div>

        </div>
    
	<jsp:include page="Administrador_footer.jsp" flush="true"/>


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