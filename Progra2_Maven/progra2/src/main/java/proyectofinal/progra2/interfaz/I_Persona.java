package proyectofinal.progra2.interfaz;
import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Persona;

@Service
public interface I_Persona {
	public int RegistrarPersona(Persona bean) throws Exception;
	public Persona listarPersona(String dni,String correo) throws Exception;
	public Persona listar(String dni) throws Exception;
	public int  buscarCorreo(String correo);
	public int buscarDni(String dni) throws Exception;
}
