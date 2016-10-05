package proyectofinal.progra2.interfaz;
import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Persona;

@Service
public interface I_Persona {
	public Persona listarPersona(String dni,String correo) throws Exception;
}
