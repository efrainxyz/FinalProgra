package proyectofinal.progra2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.MarcaAuto;
import proyectofinal.progra2.bean.ModeloAuto;
import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.bean.Sede;
import proyectofinal.progra2.bean.TipoViajeAuto;
import proyectofinal.progra2.dao.autoDao;
import util.ResponseObject;

@Controller
public class autoController {
	
	@Autowired
	private autoDao dao;

	@RequestMapping(value="/listarauto")
	public ModelAndView listarAuto(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model=new ModelAndView();
		
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("administrador")){
					try {
						List<Auto> listar= dao.listarAutos();
					
							 
						model.addObject("listarjsp", listar);
						model.setViewName("/administrador/Administrador_mantenerauto");
					
					} catch (Exception e) {
						 System.out.println("problema en el controller auto listar"+e.getMessage());
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		
		
		return model;
	}
	
	
	
	@RequestMapping(value="/list")
	public void list(HttpServletResponse response,HttpServletRequest request) throws IOException{
		
						List<Auto> listar= dao.listarAutos();
						JSONArray list = new JSONArray();
						
						 JSONObject obj2 = new JSONObject();
							 for(int i=0;i<listar.size();i++){
								 	JSONObject obj = new JSONObject();
								 	obj.put("placa", listar.get(i).getMatricula());
							        obj.put("transmision", listar.get(i).getTransmision());
							        obj.put("year",  listar.get(i).getYear());
							       
							        list.add(obj);
								}
							 
							 
							 ResponseObject responseobj=null;
								if(listar!=null){
									responseobj=new ResponseObject();
									response.setContentType("application/json");
									response.setCharacterEncoding("UTF-8");
									responseobj.setSuccess(true);
									responseobj.setObject(list);
									
								}
								response.getWriter().write(new Gson().toJson(responseobj));
								System.out.println("json " + new Gson().toJson(responseobj));	 
					
	}
	
	
	
	
	@RequestMapping(value="/agregarAuto")
	public ModelAndView agregar(HttpServletResponse response,TipoViajeAuto tipo,Auto auto,ModeloAuto modelo,Sede sede, String accion) throws IOException{
		ModelAndView model = new ModelAndView();
		
		System.out.println("LA ACCION QUE LLEGA... "+accion);
		try {
			
			if(accion.equals("agregar"))
				{
					try {
						auto.setSede(sede);
						auto.setModeloAuto(modelo);
						auto.setTipoViajeAuto(tipo);
						auto.setEstado("0");
					
						int respuesta=dao.agregarAuto(auto);
						
						List<Auto> listar= dao.listarAutos();
						
						if(respuesta!=1)
						{
							model.addObject("mensaje","no se agrego");
							model.setViewName("/administrador/Administrador_agregarauto");
						}else{
							model.addObject("mensaj	e","se agrego");
							model.addObject("listarjsp",listar);
							model.setViewName("/administrador/Administrador_mantenerauto");
						}
						
					} catch (Exception e) {
						System.out.println("ERROR agregar"+e.getMessage());
					}
						
						
				}
			else if(accion.equals("preagregar"))
				{
				List<TipoViajeAuto>listar1=dao.listarTipoviajeauto();
				List<MarcaAuto>listar2=dao.listarMarcaauto();
				List<Sede>listar3=dao.listarSede();	
				model.addObject("listartipoviaje",listar1);
				model.addObject("listarmarcaauto",listar2);
				model.addObject("listarsede",listar3);
				model.setViewName("/administrador/Administrador_agregarauto");
				}
			
		} catch (Exception e) {
			System.out.print("ERROR  todo"+e.getMessage());
		}
		
		return model;
	}
	
	
	
	
	@RequestMapping(value="/listarModelo")
	public void listarModelo(HttpServletResponse response,HttpServletRequest request,int idmarca) throws IOException{
				
					List<ModeloAuto> listar=dao.listarModeloAuto(idmarca);
					
					System.out.println("me llega este id desde ajax  "+idmarca+
							"Y EL TAMAÑO DE LA LISTA ES!!! ! "+listar.size());
						JSONArray list = new JSONArray();
						 JSONObject obj2 = new JSONObject();
							 for(int i=0;i<listar.size();i++){
								 	JSONObject obj = new JSONObject();
								 	obj.put("idmodelo", listar.get(i).getIdModeloAuto());
							        obj.put("nommodelo", listar.get(i).getModelo());							       
							        list.add(obj);
								}
							 
							 
							 ResponseObject responseobj=null;
								if(listar!=null){
									responseobj=new ResponseObject();
									response.setContentType("application/json");
									response.setCharacterEncoding("UTF-8");
									responseobj.setSuccess(true);
									responseobj.setObject(list);
									
								}
								response.getWriter().write(new Gson().toJson(responseobj));
								System.out.println("json " + new Gson().toJson(responseobj));	 
					
	}
	
	
	@RequestMapping(value="/listarMarcaAuto")
	public ModelAndView listarmarcar(HttpServletResponse response, int idmarca) throws IOException{
		ModelAndView model = new ModelAndView();
		try {
					List<ModeloAuto> listar1=dao.listarModeloAuto(idmarca);
						model.addObject("listarmodeloauto",listar1);
						model.setViewName("/administrador/Administrador_agregarauto");

			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		return model;
	}
	
	
}
