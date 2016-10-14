package proyectofinal.progra2.interfaz;

import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Alquilerxrequerimiento;
import proyectofinal.progra2.bean.Persona;

@Service
public interface I_Cliente {
	//El cliente vera catalogo,Actualizar su contraseña,ActualizardatosPersonales , listar mis reservas  realizadas ,detalle de la reserva
	public int actualizarContrasena(String contrasena, String dni) throws Exception;
	public int actualizardatospersonales(Persona bean, String dni) throws Exception;
	public  List<Alquiler> listarAlquilerxCliente(String dni);
	public List<Alquilerxrequerimiento> listarDetalleAlquiler(int idAlquiler);
	
	

}
