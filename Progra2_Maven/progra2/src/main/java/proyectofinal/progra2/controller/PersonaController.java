package proyectofinal.progra2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.bean.Rol;
import proyectofinal.progra2.dao.personaDao;

@Controller
public class PersonaController {
	
	@Autowired
	private personaDao dao;
	@Autowired
	VistasController vistas;
	
	
	@RequestMapping(value="/iniciarSesion")
	public ModelAndView iniciarSesion(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView  model= new ModelAndView();
		try {
			//.replaceAll("'or'1'='1", "")
			String dni=request.getParameter("dni");
			String contrasena= request.getParameter("contrasena");
			if(dni.equals("")||contrasena.equals("")){
				model.addObject("mensaje","Debe llenar todos los campos, intente de nuevo.");
				model.setViewName("/publico/Publico_paginaprincipal");
			}else{
				
				
					Persona ses=dao.listarPersona(dni, contrasena);
					
					if(ses!=null){
						HttpSession session= request.getSession();
						session.setMaxInactiveInterval(-1);
						session.setAttribute("usuario",ses);
						System.out.println("ROOOOOOOOOOOOL !!!!!!!!!  "+ses.getRol().getNombre());
						if(ses.getRol().getNombre().equals("administrador")){
							return vistas.inicioAdm(response);
						}else if(ses.getRol().getNombre().equals("cliente")){
							return vistas.inicioCli(response);
						}
					}else{
						model.addObject("mensaje", "Los datos ingresados son incorrectos.");
						model.setViewName("/publico/Publico_paginaprincipal");
					}
				
			}
		} catch (Exception e) {
			System.out.print("ERROR CONTROLER Login !!!!!!!!!!!!!! "+e.getMessage());
		}
		
		return model;
	}
	
	
	@RequestMapping(value="/Logout")
	public ModelAndView logout(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		try {
			HttpSession session=request.getSession();
			if(session!=null){
				System.out.println("EXISTIA UN USUARIO");
			}else{
				System.out.println("NUNCA EXISTIO UN USUARIO");
			}
			session.removeAttribute("usuario");
			session.invalidate();
			model.setViewName("/publico/Publico_paginaprincipal");
			
		} catch (Exception e) {
			System.out.println("ERROR LOGOUT"  + e.getMessage());
		}
		return  model;
	}
	
	
	@RequestMapping(value="/registroCliente")
	public ModelAndView registroCliente(HttpServletResponse response,HttpServletRequest request,Persona bean) throws IOException{
		ModelAndView model = new ModelAndView();
		//CUANDO SE DESEE AGREGAR UN MANY TO ONE  <- CUANDO LO BEAN EN EL BEAN DONDE QUIEREN HACER EL INSERT
		//PRIMERO OBTENIENE LOS VALORES DEL ROL QUE SOLO ENTRARAN A UN BEAN TIPO ROL
		// LUEGO QUE SE SETEA LOS VALORES AL BEAN TIPO ROL
		//AL "BEAN" TIPO PERSONA QUE ESTA INGRESANDO EN ESTE CONTRALADOR.
		//SE LE SETEA EL ROL , COMO PUEDEN VER SOLO ADMITE VALORES TIPO ROL.
		// PERO COMO YA TENEMOS NUESTRO BEAN TIPO ROL CREADO Y CON LOS VALORES AGREGADOS
		// SE LE MANDA :) FIN
		Rol beanR = new Rol();
		beanR.setIdRol(2);
		bean.setRol(beanR);
		
		try {
			int existeCorreo=dao.buscarCorreo(bean.getCorreo());
			
			if(existeCorreo!=1){
					System.out.println("EL CORREO ESTA BIEEN");
					int respuesta=dao.RegistrarPersona(bean);
					if(respuesta!=0){
						model.addObject("mensaje","Ha sido registrado satisfactoriamente.");
						model.setViewName("/publico/Publico_registarcliente");
					}else{
						model.addObject("mensaje","Parace que el DNI ya ha sido registrado.");
						model.setViewName("/publico/Publico_registarcliente");
					}
			}else{
				model.addObject("mensaje","Parece que el correo ya esta registrado.");
				model.setViewName("/publico/Publico_registarcliente");
			}
			
		} catch (Exception e) {
			System.out.println("REGISTRO CLIENTE"  + e.getMessage());
		}
		return  model;
	}
	
	
	
}





