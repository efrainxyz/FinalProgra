package proyectofinal.progra2.interfaz;

import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Alquiler;

@Service
public interface I_Administrador {
	public List<Alquiler> listarAlquilerXCodigo(int codigo);

}
