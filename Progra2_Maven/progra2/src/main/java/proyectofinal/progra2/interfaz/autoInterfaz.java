package proyectofinal.progra2.interfaz;

import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Auto;
@Service
public interface autoInterfaz{
	public List<Auto>listarAutos();
}
