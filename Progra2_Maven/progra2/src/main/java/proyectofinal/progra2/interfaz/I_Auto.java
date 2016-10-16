package proyectofinal.progra2.interfaz;

import java.util.List;

import org.springframework.stereotype.Service;

import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.MarcaAuto;
import proyectofinal.progra2.bean.ModeloAuto;
import proyectofinal.progra2.bean.Sede;
import proyectofinal.progra2.bean.TipoTarjeta;
import proyectofinal.progra2.bean.TipoViajeAuto;

@Service
public interface I_Auto{
	public List<Auto>listarAutos();
	 public int agregarAuto(Auto auto);
	 public List<MarcaAuto>listarMarcaauto();
	 public List<Sede>listarSede();
	 public List<TipoViajeAuto>listarTipoviajeauto();
	 public List<ModeloAuto>listarModeloAuto(int id); 
	 public boolean cambiarestadoauto(String idmatricula, int est);
	 
	 
}
