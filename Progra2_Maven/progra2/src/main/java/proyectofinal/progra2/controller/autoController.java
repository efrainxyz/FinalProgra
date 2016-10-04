package proyectofinal.progra2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.dao.autoDao;

@Controller
public class autoController {
	
	@Autowired
	private autoDao dao;

	@RequestMapping(value="/")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	@RequestMapping(value="/listarAuto")
	public ModelAndView listarAuto(HttpServletResponse response) throws IOException{
		ModelAndView model=new ModelAndView();
		try {
			List<Auto> listar= dao.listarAutos();
			model.addObject("listarjsp", listar);
			model.setViewName("Administrador_mantenerauto");
		
		} catch (Exception e) {
			 System.out.println("problema en el controller auto listar"+e.getMessage());
		}
		return model;
	}
}
