package proyectofinal.progra2.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import proyectofinal.progra2.bean.Persona;

@Controller
public class VistasController {
	
	

	@RequestMapping(value="/")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("Publico_paginaprincipal");
	}
		
	//---------------------->>>>>>>>>>>> VISTAS DE ADMINISTRADOR 
	@RequestMapping(value="/homeAdministrador")
	public ModelAndView logout(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("administrador")){
					model.setViewName("Administrador_paginaprincipal");	
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("Publico_paginaprincipal");
			}
		return  model;
	}
	
	
	// ------------------>>>>>>>> VISTAS DE PUBLICO
	@RequestMapping(value="/nosotros")
	public ModelAndView nosotros(HttpServletResponse response) throws IOException{
		return new ModelAndView("Publico_nosotros");
	}
	
	@RequestMapping(value="/contactenos")
	public ModelAndView contactenos(HttpServletResponse response) throws IOException{
		return new ModelAndView("Publico_contactenos");
	}
	
	@RequestMapping(value="/registrarse")
	public ModelAndView registrarse(HttpServletResponse response) throws IOException{
		return new ModelAndView("Publico_registarcliente");
	}
	
	@RequestMapping(value="/catalogo")
	public ModelAndView catalogo(HttpServletResponse response) throws IOException{
		return new ModelAndView("Publico_catalogodeproductos");
	}
	
}




