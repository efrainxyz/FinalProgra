function listar(){
			$.get('list',{
			},function(response){
				
				console.log(response);
				
			});
			
		}


function listarModelo(){
	var idmarca=$("#marca_auto").val();
	console.log(idmarca);
	$.post('listarModelo',{
		idmarca:idmarca
	},function(response){
		
		console.log(response);
		con="<option>Seleccione</option>";
		//for(var i=0;i<response['object'].length;i++){
		for(var i=0;i<response['object'].length;i++){
			con = con+("<option value="+response['object'][i]['idmodelo']+">"+response['object'][i]['nommodelo']+"</option>");
		}
		
		$('#modelo_auto').html(con);
		
	});
	
}