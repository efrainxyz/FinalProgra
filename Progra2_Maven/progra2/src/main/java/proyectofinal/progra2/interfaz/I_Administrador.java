package proyectofinal.progra2.interfaz;

import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Pago;

@Service
public interface I_Administrador {
	public List<Alquiler> listarAlquilerXCodigo(int codigo);
	public int registrarPago(Pago pago);
	public int verificarPago(Alquiler alquiler);
}
