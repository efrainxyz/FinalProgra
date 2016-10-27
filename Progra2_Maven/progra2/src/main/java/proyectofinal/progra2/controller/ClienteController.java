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
import proyectofinal.progra2.bean.Alquilerxrequerimiento;
import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.bean.TipoViajeAuto;
import proyectofinal.progra2.dao.autoDao;
import proyectofinal.progra2.dao.clienteDao;
import proyectofinal.progra2.dao.personaDao;


@Controller
public class ClienteController {
	
	
	
	@Autowired
	private clienteDao dao;
	@Autowired
	private personaDao dao1;
	@Autowired
	private autoDao dao3;
	
	@RequestMapping(value="/listarReservas")
	public ModelAndView listarReservas(HttpServletResponse response,HttpServletRequest request) throws IOException{
			ModelAndView model=new ModelAndView();
			HttpSession session=request.getSession();
			Persona user=(Persona) session.getAttribute("usuario");
				if(user!=null){
					if(user.getRol().getNombre().equals("cliente")){
						try {
								String dni=user.getDni();
								List<Alquiler> lista=dao.listarAlquilerxCliente(dni);
								model.addObject("lista",lista);
								model.setViewName("/cliente/Cliente_verlistadeorden");
						} catch (Exception e) {
							// System.out.println("problema en el controller auto listar"+e.getMessage());
						}
					}
				}else{
					model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
					model.setViewName("/publico/Publico_paginaprincipal");
				}
			
			
			return model;
	}
	
	@RequestMapping(value="/micuenta")
	public ModelAndView micuenta(HttpServletResponse response,HttpServletRequest request) throws IOException{
			ModelAndView model=new ModelAndView();
			HttpSession session=request.getSession();
			Persona user=(Persona) session.getAttribute("usuario");
				if(user!=null){
					if(user.getRol().getNombre().equals("cliente")){
						try {
							model.addObject("nombre", user.getNombre());
							model.addObject("apepat",user.getApellidoPaterno());
							model.addObject("apemat",user.getApellidoMaterno());
							model.addObject("correo",user.getCorreo());
								model.setViewName("/cliente/Cliente_micuenta");
						} catch (Exception e) {
							// System.out.println("problema en el controller auto listar"+e.getMessage());
						}
					}
				}else{
					model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
					model.setViewName("/publico/Publico_paginaprincipal");
				}
			
			
			return model;
	}
	
	@RequestMapping(value="/cambiarContrasena")
	public ModelAndView cambiarContrasena(HttpServletResponse response,HttpServletRequest request, String contrasena,String actualcontrasena) throws IOException{
			ModelAndView model=new ModelAndView();
			HttpSession session=request.getSession();
			
			Persona user=(Persona) session.getAttribute("usuario");
		
				if(user!=null){
					if(user.getRol().getNombre().equals("cliente")){
						try {
							if(actualcontrasena.equals(user.getContrasena()))
							{
								dao.actualizarContrasena(contrasena, user.getDni());
								model.addObject("contrasena",contrasena);
							}
							else{
								model.addObject("mensaje","la contraseña actual no es la correcta");
							}
							model.setViewName("/cliente/Cliente_micuenta");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else{
					model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
					model.setViewName("/publico/Publico_paginaprincipal");
				}
			
			
			return model;
	}
	@RequestMapping(value="/datosPersonales")
	public ModelAndView datosPersonales(HttpServletResponse response,HttpServletRequest request,Persona bean) throws IOException{
		ModelAndView model=new ModelAndView();
		HttpSession session=request.getSession();
		
		Persona user=(Persona) session.getAttribute("usuario");
	
			if(user!=null){
				if(user.getRol().getNombre().equals("cliente")){
					try {
							
							dao.actualizardatospersonales(bean,user.getDni());
							
							Persona ses=dao1.listar(user.getDni());
							
						
							session.setMaxInactiveInterval(-1);
							session.setAttribute("usuario",ses);
							
							
							model.addObject("nombre", ses.getNombre());
							model.addObject("apepat",ses.getApellidoPaterno());
							model.addObject("apemat",ses.getApellidoMaterno());
							model.addObject("correo",ses.getCorreo());
							model.addObject("mensaje1","se actualizo satisfactoriamente");
							model.setViewName("/cliente/Cliente_micuenta");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		
		
		return model;
}
	
	@RequestMapping(value="/homeCliente")
	public ModelAndView homeCliente(HttpServletResponse response,HttpServletRequest request) throws IOException{
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
	
	@RequestMapping(value="/vercatalogocliente")
	public ModelAndView vercatalogocliente(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model=new ModelAndView();
		
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("cliente")){
					try {
						List<TipoViajeAuto>listar1=dao3.listarTipoviajeauto();
						List<Auto> listar= dao3.listarAutos();

						//Para obtener el precio y funcione con el slider
						List<Integer> precio= new ArrayList<Integer>();
						
						for (int i = 0; i < listar.size(); i++) {
							precio.add(Integer.valueOf(listar.get(i).getPrecioDia().intValue()));
							
						}
						model.addObject("precioAuto",precio);
						System.out.println(precio);
						//fin 
						
						model.addObject("listarjsp", listar);
						model.addObject("listartipoviaje",listar1);
						
						model.setViewName("/cliente/Cliente_catalogodeproductos");
						
					} catch (Exception e) {
						System.out.print(e.getMessage());
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, por favor ingrese de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		
		
		return model;
	}
	
	@RequestMapping(value="contactocli")
	public ModelAndView contactocli(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_contactenos");
	}
	
	
	
	@RequestMapping(value="reserva1")
	public ModelAndView reserva1(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva1");
	}
	
	@RequestMapping(value="reserva2")
	public ModelAndView reserva2(HttpServletResponse response, HttpServletRequest request) throws IOException{
		ModelAndView model=new ModelAndView();
		
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("cliente")){
					try {
						List<TipoViajeAuto>listar1=dao3.listarTipoviajeauto();
						List<Auto> listar= dao3.listarAutos();

						//Para obtener el precio y funcione con el slider
						List<Integer> precio= new ArrayList<Integer>();
						
						for (int i = 0; i < listar.size(); i++) {
							precio.add(Integer.valueOf(listar.get(i).getPrecioDia().intValue()));
							
						}
						model.addObject("precioAuto",precio);
						System.out.println(precio);
						//fin 
						
						model.addObject("listarjsp", listar);
						model.addObject("listartipoviaje",listar1);
						
						model.setViewName("/cliente/Cliente_generarreserva2");
						
					} catch (Exception e) {
						System.out.print(e.getMessage());
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, por favor ingrese de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		
		
		return model;
	}
	
	@RequestMapping(value="reserva3")
	public ModelAndView reserva3(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva3");
	}
	
	@RequestMapping(value="reserva4")
	public ModelAndView reserva4(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_generarreserva4");
	}
	
	
	@RequestMapping(value="verdetalleorden")
	public ModelAndView verdetalleorden(HttpServletResponse response, HttpServletRequest request) throws IOException{
		ModelAndView model=new ModelAndView();
		
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("cliente")){
					try {
						int codigoAlquiler= Integer.parseInt(request.getParameter("idAlquiler"));
						
						List<Alquiler> listar = dao.listarAlquilerxCodigo(codigoAlquiler);
						List<Alquilerxrequerimiento> listar2= dao.listarDetalleAlquiler(codigoAlquiler);
						
						model.addObject("listar",listar);
						model.addObject("listardet",listar2);
						
						model.setViewName("/cliente/Cliente_verdetalledeorden");
						
					} catch (Exception e) {
						System.out.print(e.getMessage());
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, por favor ingrese de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		
		
		return model;
	}
	
	@RequestMapping(value="verorden")
	public ModelAndView verorden(HttpServletResponse response) throws IOException{
		return new ModelAndView("/cliente/Cliente_verlistadeorden");
	}
	
	@RequestMapping(value="/cancelarreserva")
	public ModelAndView cancelarreserva(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model=new ModelAndView();
		
		HttpSession session=request.getSession();
		Persona user=(Persona) session.getAttribute("usuario");
			if(user!=null){
				if(user.getRol().getNombre().equals("cliente")){
					try {
						int resultado=0;
						int codigoAl= Integer.parseInt(request.getParameter("idAlquiler"));
						resultado= dao.cancelarReserva(codigoAl);
						String dni=user.getDni();
						List<Alquiler> lista=dao.listarAlquilerxCliente(dni);
						model.addObject("lista",lista);
						
						if(resultado==0)
						{
							model.addObject("mensaje","Error. No se pudo cancelar la reserva.");	
						}
						else{
							model.addObject("mensaje1","Reserva cancelada satisfactoriamente.");
						}
						model.setViewName("/cliente/Cliente_verlistadeorden");
					
					} catch (Exception e) {
						 System.out.println("Error en el Controller Cliente - Cancelar Reserva: "+e.getMessage());
					}
				}
			}else{
				model.addObject("mensaje","Su sesion ha expirado, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}
		
		
		return model;
	}
	
}





