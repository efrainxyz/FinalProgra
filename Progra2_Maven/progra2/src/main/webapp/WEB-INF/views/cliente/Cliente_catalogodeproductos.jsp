<%@page import="proyectofinal.progra2.bean.Persona"%>
<%@page import="proyectofinal.progra2.bean.Rol"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%Persona user=(Persona) session.getAttribute("usuario");
    if(user==null){
		System.out.println("TAMAAAAAAAAAAAAÑOOO "+user);
		request.getRequestDispatcher("home").forward(request, response);
    }else{System.out.println("Logueado como "+ user.getRol().getNombre());}
%>
<!DOCTYPE html>
<html lang="es">

<style>
#Container .mix{
	display: none;
}
</style>
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
			                            <form class="controls" id="Filters">
			                               <div class="form-group">
				                               <fieldset>
					                               <h5>Tipo de Viaje:</h5>
					                               <select class="form-control" id="tipo_viaje">
					                               <c:if test="${not empty listartipoviaje}">
					                               		<option value="">Todos</option>
					        							<c:forEach var="listartipoviaje" items="${listartipoviaje}">
				               		 						<option value=".${listartipoviaje.tipo}">${listartipoviaje.tipo}</option>	        		
											        	</c:forEach>
										        	</c:if>
					                               </select>
				                               </fieldset>
				                               <fieldset>
					                               <h5>Trasnmision:</h5>
					                               <select class="form-control" id="transmision">
					                               	   <option value="">Todos</option>
						                               <option value=".mecanico">Mecánico</option>
						                               <option value=".automatico">Automático</option>
					                               </select>
				                               </fieldset>
				                               <fieldset>
					                               <h5>Categoría:</h5>
					                               <select class="form-control" id="categoria">
					                               	   <option value="">Todos</option>
						                               <option value=".auto">Auto</option>
						                               <option value=".camioneta">Camioneta</option>
						                               <option value=".vans">Vans</option>
					                               </select>
				                               </fieldset>
				                               <h5>Número de pasajeros:</h5>
				                              	<input type="text" class="form-control" id="input" placeholder="Escriba la cantidad">
				                               
				                                <h5>Precio por d&iacute;a:</h5>
				                                <b>20 </b><input type="text" class="span2" value="" data-slider-min="20" data-slider-max="50" data-slider-step="1" data-slider-value="[30,40]" id="precioDia"><b> 50</b>
				                                
				                              </div>
			                                  <button class="btn btn-default btn-sm btn-primary" id="Reset"><i class="fa fa-pencil"></i>Quitar Filtros</button>
			                            </form>
			                          </div>
		                         </div>
		                    </div> 
	
		                    <div class="col-md-9">
		                    
		                        <div class="row-product pagination__list" id="Container">
		                        		<c:if test="${not empty listarjsp}">
		                        		<c:if test="${not empty precioAuto}">
	        								<c:forEach var="listarjsp" items="${listarjsp}" varStatus="status">
	                                        <div class="col-md-4 col-sm-6 pagination__item mix ${listarjsp.tipoViajeAuto.tipo} ${listarjsp.categoriaAuto} ${listarjsp.transmision} price-${precioAuto[status.index]}">
	                                            <p class="titulo" hidden>${listarjsp.nroPasajeros}</p>
	                                            <div class="product" style="text-align: center;">
	                                                <div class="flip-container">
	                                                    <div class="flipper">
	                                                        <div class="front">
	                                                            <a href="detallecatalogo">
	                                                                <img src="${listarjsp.imagen}" style="display: inline-block;" class="img-responsive">
	                                                            </a>
	                                                        </div>
	                                                        <div class="back">
	                                                            <a href="detallecatalogo">
	                                                                <img src="${listarjsp.imagen}" style="display: inline-block;" class="img-responsive">
	                                                            </a>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <a href="<detallecatalogo" class="invisible">
	                                                    <img src="${listarjsp.imagen}" style="display: inline-block;" class="img-responsive" >
	                                                </a>
	                                                <div class="text">
	                                                    <h3><a href="detallecatalogo">${listarjsp.modeloAuto.modelo} ${listarjsp.modeloAuto.marcaAuto.marca}</a></h3>
	                                                    <p class="price">
	                                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>${listarjsp.nroPasajeros}
	                                                    <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>${listarjsp.nroPuertas}
	                                                    </p>
	                                                    <p class="price">Desde S/. ${listarjsp.precioDia}</p>
	                                                    <p class="buttons">
	                                                        <a href="detallecatalogo?matricula=${listarjsp.matricula}" class="btn btn-primary">Ver Detalle</a>
	                                                    </p>
	                                                </div>
	                                                <!-- /.text -->
	                                            </div>
	                                            <!-- /.product -->
	                                        </div>
	                                        </c:forEach>
	        							</c:if>
	        							</c:if>
											
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
    <script src="<%=request.getContextPath() %>/resources/js/jquery.mixitup.js"></script>
    <!--Para el Slider -->
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap-slider.js"></script>
    <script>
        $("#precioDia").slider({});
    </script>
    <!-- Para la paginacion... -->
    <script src="<%=request.getContextPath()%>/resources/js/jQuery.paginate.js"></script>
    <script>
    $('.pagination__list').paginate({
    	  items_per_page: 6
    });
    </script>
    <script>
  //Para buscar cliente
    $(function() {

	  $(".container").mixItUp();
	
	  var inputText;
	  var $matching = $();
	
	  // Delay function
	  var delay = (function(){
	    var timer = 0;
	    return function(callback, ms){
	      clearTimeout (timer);
	      timer = setTimeout(callback, ms);
	    };
	  })();
	
	  $("#input").keyup(function(){
	    // Delay function invoked to make sure user stopped typing
	    delay(function(){
	      inputText = $("#input").val().toLowerCase();
	      
	      // Check to see if input field is empty
	      if ((inputText.length) > 0) {            
	        $( '.mix').each(function() {
	          $this = $("this");
	          
	           // add item to be filtered out if input text matches items inside the title   
	           if($(this).children('.titulo').text().toLowerCase().match(inputText)) {
	            $matching = $matching.add(this);
	          }
	          else {
	            // removes any previously matched item
	            $matching = $matching.not(this);
	          }
	        });
	        $(".container").mixItUp('filter', $matching);
	      }
	
	      else {
	        // resets the filter to show all item if input is empty
	        $(".container").mixItUp('filter', 'all');
	      }
	    }, 200 );
	  });
	})
    //for the slider
    $(".span2").on("slideStop", function (ev) {
		var rangevalues = $('#precioDia').data('slider').getValue();
		var minValue = ev.value[0];
		var maxValue = ev.value[1]; 
		var filterValues = [];
		console.log(rangevalues);
		console.log(minValue);
		console.log(maxValue);
		for (i = minValue; i <= maxValue; i += 1) {
			filterValues.push(".price-" + i);
		}
	

		//alert(filterValues.join(','));
		$('#Container').mixItUp('filter', filterValues.join(','));

	});
 // To keep our code clean and modular, all custom functionality will be contained inside a single object literal called "dropdownFilter".

    var dropdownFilter = {
      
      // Declare any variables we will need as properties of the object
      
      $filters: null,
      $reset: null,
      groups: [],
      outputArray: [],
      outputString: '',
      
      // The "init" method will run on document ready and cache any jQuery objects we will need.
      
      init: function(){
        var self = this; // As a best practice, in each method we will asign "this" to the variable "self" so that it remains scope-agnostic. We will use it to refer to the parent "dropdownFilter" object so that we can share methods and properties between all parts of the object.
        
        self.$filters = $('#Filters');
        self.$reset = $('#Reset');
        self.$container = $('#Container');
        
        self.$filters.find('fieldset').each(function(){
          self.groups.push({
            $dropdown: $(this).find('select'),
            active: ''
          });
        });
        
        self.bindHandlers();
      },
      
      // The "bindHandlers" method will listen for whenever a select is changed. 
      
      bindHandlers: function(){
        var self = this;
        
        // Handle select change
        
        self.$filters.on('change', 'select', function(e){
          e.preventDefault();
          
          self.parseFilters();
        });
        
        // Handle reset click
        
        self.$reset.on('click', function(e){
          e.preventDefault();
          
          self.$filters.find('select').val('');
          
          self.parseFilters();
        });
      },
      
      // The parseFilters method pulls the value of each active select option
      
      parseFilters: function(){
        var self = this;
     
        // loop through each filter group and grap the value from each one.
        
        for(var i = 0, group; group = self.groups[i]; i++){
          group.active = group.$dropdown.val();
        }
        
        self.concatenate();
      },
      
      // The "concatenate" method will crawl through each group, concatenating filters as desired:
      
      concatenate: function(){
        var self = this;
        
        self.outputString = ''; // Reset output string
        
        for(var i = 0, group; group = self.groups[i]; i++){
          self.outputString += group.active;
        }
        
        // If the output string is empty, show all rather than none:
        
        !self.outputString.length && (self.outputString = 'all'); 
        
        //console.log(self.outputString); 
        
        // ^ we can check the console here to take a look at the filter string that is produced
        
        // Send the output string to MixItUp via the 'filter' method:
        
    	  if(self.$container.mixItUp('isLoaded')){
        	self.$container.mixItUp('filter', self.outputString);
    	  }
      }
    };
      
    // On document ready, initialise our code.

    $(function(){
          
      // Initialize dropdownFilter code
          
      dropdownFilter.init();
          
      // Instantiate MixItUp
          
      $('#Container').mixItUp({
        controls: {
          enable: false // we won't be needing these
        }
        
      });    
    });
    </script>

</body>

</html>