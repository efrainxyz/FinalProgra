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
		return new ModelAndView("/publico/Publico_paginaprincipal");
	}
		
	
	// ------------------>>>>>>>> VISTAS DE PUBLICO
	@RequestMapping(value="/inicio")
	public ModelAndView inicio(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_paginaprincipal");
	}
	
	@RequestMapping(value="/nosotros")
	public ModelAndView nosotros(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_nosotros");
	}
	
	@RequestMapping(value="/contactenos")
	public ModelAndView contactenos(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_contactenos");
	}
	
	@RequestMapping(value="/registrarse")
	public ModelAndView registrarse(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_registarcliente");
	}
	
	@RequestMapping(value="/detallecatalogo")
	public ModelAndView detallecatalogo(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_detalledeproducto");
	}
	
	@RequestMapping(value="/recuperarcontra")
	public ModelAndView recuperarcontra(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_recuperarcontrasena");
	}	
	
	// ------------------>>>>>>>> VISTAS DE ADMINISTRADOR
	
	// ------------------>>>>>>>> VISTAS DE CLIENTE
	
}




