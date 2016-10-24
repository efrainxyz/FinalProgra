package proyectofinal.progra2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.dao.AdministradorDao;
import proyectofinal.progra2.dao.clienteDao;


@Controller
public class AdministradorController {

	@Autowired
	private AdministradorDao dao;
	@Autowired
	private clienteDao dao1;
	
	@RequestMapping(value="/homeAdministrador")
	public ModelAndView homeCliente(HttpServletResponse response,HttpServletRequest request) throws IOException{
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
	
	@RequestMapping(value="/registrarpago")
	public ModelAndView registrarpago(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("administrador")){
					model.setViewName("/administrador/Administrador_registrarpago");	
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		return  model;
	}
	
	@RequestMapping(value="/buscaralquiler")
	public ModelAndView buscarreserva(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("administrador")){
					
					List<Alquiler> listar= null;
					String criterio= request.getParameter("criterio");
					String criterioBusqueda=request.getParameter("criterioBusqueda").trim();
					
					System.out.println(criterioBusqueda+"\n\n"+criterio);
					
					if(criterio.equals("1")){ //Se ingreso dni
						listar= dao1.listarAlquilerxCliente(criterioBusqueda);
					} else{ //Se ingreso codigo de reserva
						int codigoReserva = Integer.parseInt(criterioBusqueda);
						listar = dao.listarAlquilerXCodigo(codigoReserva);
					}
									
					
					if(listar.size()>0){
						model.addObject("listar",listar);
					} else{
						model.addObject("mensaje","No se encontraron alquileres con ese criterio.");
					}
					model.setViewName("/administrador/Administrador_buscaralquiler");	
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		return  model;
	}
	
}





