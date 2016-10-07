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
		
	//---------------------->>>>>>>>>>>> VISTAS DE ADMINISTRADOR 
	@RequestMapping(value="/homeAdministrador")
	public ModelAndView logout(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("administrador")){
					model.setViewName("/administrador/Administrador_paginaprincipal");	
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		return  model;
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
	
	@RequestMapping(value="/catalogo")
	public ModelAndView catalogo(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_catalogodeproductos");
	}
	
	@RequestMapping(value="/detallecatalogo")
	public ModelAndView detallecatalogo(HttpServletResponse response) throws IOException{
		return new ModelAndView("/publico/Publico_detalledeproducto");
	}
	
	
	// ------------------>>>>>>>> VISTAS DE ADMINISTRADOR
	@RequestMapping(value="/inicioAdm")
	public ModelAndView inicioAdm(HttpServletResponse response) throws IOException{
		return new ModelAndView("/administrador/Administrador_paginaprincipal");
	}
	
	
	
	@RequestMapping(value="/registrarpago")
	public ModelAndView registrarPago(HttpServletResponse response) throws IOException{
		return new ModelAndView("/administrador/Administrador_registrarpago");
	}
	
	// ------------------>>>>>>>> VISTAS DE CLIENTE
	@RequestMapping(value="/homeCliente")
	public ModelAndView logoutcliente(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("cliente")){
					model.setViewName("/cliente/Cliente_paginaprincipal");	
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		return  model;
	}
	
	@RequestMapping(value="inicioCli")
	public ModelAndView inicioCli(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_paginaprincipal");
	}
	
	@RequestMapping(value="catalogocli")
	public ModelAndView catalogocli(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_catalogodeproductos");
	}
	
	@RequestMapping(value="contactocli")
	public ModelAndView contactocli(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_contactenos");
	}
	
	@RequestMapping(value="detalleproducto")
	public ModelAndView detalleproducto(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_detalledeproducto");
	}
	
	@RequestMapping(value="reserva1")
	public ModelAndView reserva1(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva1");
	}
	
	@RequestMapping(value="reserva2")
	public ModelAndView reserva2(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva2");
	}
	
	@RequestMapping(value="reserva3")
	public ModelAndView reserva3(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva3");
	}
	
	@RequestMapping(value="reserva4")
	public ModelAndView reserva4(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva4");
	}
	
	@RequestMapping(value="micuenta")
	public ModelAndView micuenta(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_micuenta");
	}
	
	@RequestMapping(value="verdetalleorden")
	public ModelAndView verdetalleorden(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_verdetalledeorden");
	}
	
	@RequestMapping(value="verorden")
	public ModelAndView verorden(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_verlistadeorden");
	}
	
}




