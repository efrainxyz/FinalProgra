package proyectofinal.progra2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
	@Autowired
	AdministradorController admin;
	
	//para el correo de recuperacion
	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;
	
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
							return admin.homeCliente(response, request);
						}else if(ses.getRol().getNombre().equals("cliente")){
							model.setViewName("cliente/Cliente_paginaprincipal");
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
		
		try {
			int existeDni=dao.buscarDni(bean.getDni());
			
			if(existeDni<1){
					int existeCorreo=dao.buscarCorreo(bean.getCorreo());
						if(existeCorreo<1){

								Rol beanR = new Rol();
								beanR.setIdRol(2);
								bean.setRol(beanR);
								
								int registro=dao.RegistrarPersona(bean);
									if(registro!=0){
										model.addObject("mensaje1","Ha sido registrado satisfactoriamente.");
										model.setViewName("/publico/Publico_registarcliente");
									}else{
										model.addObject("mensaje","Hubo problemas en el registro, intente de nuevo.");
										model.setViewName("/publico/Publico_registarcliente");
									}
						}else{
							model.addObject("mensaje","Parace que el CORREO ya ha sido registrado.");
							model.setViewName("/publico/Publico_registarcliente");
						}
							
			}else{
				model.addObject("mensaje","Parece que el DNI ya esta registrado.");
				model.setViewName("/publico/Publico_registarcliente");
			}
			
		} catch (Exception e) {
			System.out.println("REGISTRO CLIENTE"  + e.getMessage());
		}
		return  model;
	}
	
/** METODO PARA RECUPERAR CONTRASEÑA **/	
	
	@RequestMapping(value="/recuperarContrasena")
	public ModelAndView recuperarContrasena(HttpServletResponse response,HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		
		String recipient = request.getParameter("correo");
        String subject = "Recuperacion de contraseña - Obaju";
       
        
		try {
			System.out.println(recipient);
			Persona persona = new Persona();
			persona=dao.recuperarContrasena(recipient);
			
	        if(persona!=null){//comprobando si el bean NO esta vacio
        		String r_usuario= persona.getDni()+"";
        		String r_contra= persona.getContrasena();
        		System.out.print(r_usuario+"\n"+r_contra);
        		
        		// Step1
        		System.out.println("\n 1ero ===> Configurar las propiedades del Mail Server...");
        		mailServerProperties = System.getProperties();
        		mailServerProperties.put("mail.smtp.port", "587");
        		mailServerProperties.put("mail.smtp.auth", "true");
        		mailServerProperties.put("mail.smtp.starttls.enable", "true");
        		System.out.println("Propiedades configuradas correctamente.");
        		
        		// Step2
        		System.out.println("\n\n 2do ===> Obtener la sesión del correo..");
        		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        		generateMailMessage = new MimeMessage(getMailSession);
        		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        		generateMailMessage.setSubject(subject);
        		String emailBody = "<h1 style='color: #5e9ca0;'>¡Tus <span style='color: #2b2301;'>datos</span> de Obaju!</h1><h2 style='color: #2e6c80;'>Su usuario es:</h2> " +r_usuario+
        		"<h2 style='color: #2e6c80;'>Su contraseña es:</h2>"+r_contra+"<br><br><strong>Atentamente,</strong> <br><strong>Reserva de autos Obaju</strong>";
        		generateMailMessage.setContent(emailBody, "text/html");
        		System.out.println("Se creó correctamente la sesión del correo.");
         
        		// Step3
        		System.out.println("\n\n 3ero ===> Obtener sesión y enviar correo...");
        		Transport transport = getMailSession.getTransport("smtp");
         
        		transport.connect("smtp.gmail.com", "obajureservaautos@gmail.com", "obaju1234");
        		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
        		transport.close();
        		
        		///
        		model.addObject("msj1","El mensaje fue enviado correctamente. Por favor revise su correo.");
        		model.setViewName("/publico/Publico_recuperarcontrasena");
        		
        	} else{
        		model.addObject("msj","No tenemos ninguna cuenta registrada con ese correo.");
        		model.setViewName("/publico/Publico_recuperarcontrasena");
        	}
        	
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject("msj","Error.");
			model.setViewName("/publico/Publico_recuperarcontrasena");
		}
		return  model;
	}
	
	/** FIN RECUPERAR CONTRASEÑA**/	
	
}
