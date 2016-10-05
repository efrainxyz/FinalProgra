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
import proyectofinal.progra2.dao.personaDao;

@Controller
public class PersonaController {
	
	@Autowired
	private personaDao dao;
	
	
	@RequestMapping(value="/iniciarSesion")
	public ModelAndView iniciarSesion(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView  model= new ModelAndView();
		try {
			//.replaceAll("'or'1'='1", "")
			String dni=request.getParameter("dni");
			String contrasena= request.getParameter("contrasena");
			if(dni.equals("")||contrasena.equals("")){
				model.addObject("mensaje","Debe llenar todos los campos, intente de nuevo.");
				model.setViewName("Publico_paginaprincipal");
			}else{
				
				
					Persona ses=dao.listarPersona(dni, contrasena);
					
					if(ses!=null){
						HttpSession session= request.getSession();
						session.setMaxInactiveInterval(-1);
						session.setAttribute("usuario",ses);
						System.out.println("ROOOOOOOOOOOOL !!!!!!!!!  "+ses.getRol().getNombre());
						if(ses.getRol().getNombre().equals("administrador")){
								model.setViewName("Administrador_paginaprincipal");
						}else if(ses.getRol().getNombre().equals("cliente")){
							model.setViewName("Cliente_paginaprincipal");
						}
					}else{
						model.addObject("mensaje", "Los datos ingresados son incorrectos.");
						model.setViewName("Publico_paginaprincipal");
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
			model.setViewName("Publico_paginaprincipal");
			
		} catch (Exception e) {
			System.out.println("ERROR LOGOUT"  + e.getMessage());
		}
		return  model;
	}
}




