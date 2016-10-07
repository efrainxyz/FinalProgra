package proyectofinal.progra2.interfaz;

import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Alquilerxrequerimiento;

@Service
public interface I_Cliente {
	//El cliente vera catalogo,Actualizar su contraseņa,ActualizardatosPersonales , listar mis reservas  realizadas ,detalle de la reserva
	public int actualizarContrasena(String contrasena) throws Exception;
	public  List<Alquiler> listarAlquilerxCliente(int dni);
	public List<Alquilerxrequerimiento> listarDetalleAlquiler(int idAlquiler);
	
	

}
