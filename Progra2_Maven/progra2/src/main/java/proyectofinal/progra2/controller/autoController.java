package proyectofinal.progra2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.dao.autoDao;

@Controller
public class autoController {
	
	@Autowired
	private autoDao dao;

	@RequestMapping(value="/listarAuto")
	public ModelAndView listarAuto(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model=new ModelAndView();
		
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("administrador")){
					try {
						List<Auto> listar= dao.listarAutos();
						model.addObject("listarjsp", listar);
						model.setViewName("Administrador_mantenerauto");
					
					} catch (Exception e) {
						 System.out.println("problema en el controller auto listar"+e.getMessage());
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("Publico_paginaprincipal");
			}
		
		
		return model;
	}
	
	@RequestMapping(value="/agregarAuto")
	public ModelAndView agregar(HttpServletResponse response,Auto auto, String accion) throws IOException{
		ModelAndView model = new ModelAndView();
		try {
			
			if(accion.equals("agregar"))
				{
					
					int respuesta=dao.agregarAuto(auto);
					
					List<Auto> listar= dao.listarAutos();
					if(respuesta!=1)
					{
						model.addObject("mensaje","no se agrego");
					
						model.setViewName("Administrador_agregarauto");
					}else{
						model.addObject("mensaje","se agrego");
						model.addObject("listarjsp",listar);
						model.setViewName("Administrador_mantenerauto");
					}
					
				}
			else if(accion.equals("preagregar"))
				{
					model.setViewName("Administrador_agregarauto");
				}
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		return model;
	}
	
	
	
}
