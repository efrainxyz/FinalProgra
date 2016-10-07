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

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.dao.clienteDao;


@Controller
public class ClienteController {
	
	
	
	@Autowired
	private clienteDao dao;
	
	
	@RequestMapping(value="/listarReservas")
	public ModelAndView listarReservas(HttpServletResponse response,HttpServletRequest request) throws IOException{
			ModelAndView model=new ModelAndView();
			HttpSession session=request.getSession();
			Persona user=(Persona) session.getAttribute("usuario");
				if(user!=null){
					if(user.getRol().getNombre().equals("administrador")){
						try {
							List<Alquiler> listar= dao.listarAlquilerxCliente(Integer.parseInt(user.getDni()));
							model.addObject("listarjsp", listar);
							model.setViewName("/cliente/Administrador_mantenerauto");
						
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
	
	
	
	
	
	
}





