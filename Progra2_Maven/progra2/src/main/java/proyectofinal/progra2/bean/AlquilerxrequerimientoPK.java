package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the alquilerxrequerimiento database table.
 * 
 */
@Embeddable
public class AlquilerxrequerimientoPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="requerimiento_especial_id_requerimiento", insertable=false, updatable=false)
	private int requerimientoEspecialIdRequerimiento;

	@Column(name="alquiler_id_alquiler", insertable=false, updatable=false)
	private int alquilerIdAlquiler;

	public AlquilerxrequerimientoPK() {
	}
	public int getRequerimientoEspecialIdRequerimiento() {
		return this.requerimientoEspecialIdRequerimiento;
	}
	public void setRequerimientoEspecialIdRequerimiento(int requerimientoEspecialIdRequerimiento) {
		this.requerimientoEspecialIdRequerimiento = requerimientoEspecialIdRequerimiento;
	}
	public int getAlquilerIdAlquiler() {
		return this.alquilerIdAlquiler;
	}
	public void setAlquilerIdAlquiler(int alquilerIdAlquiler) {
		this.alquilerIdAlquiler = alquilerIdAlquiler;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof AlquilerxrequerimientoPK)) {
			return false;
		}
		AlquilerxrequerimientoPK castOther = (AlquilerxrequerimientoPK)other;
		return 
			(this.requerimientoEspecialIdRequerimiento == castOther.requerimientoEspecialIdRequerimiento)
			&& (this.alquilerIdAlquiler == castOther.alquilerIdAlquiler);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.requerimientoEspecialIdRequerimiento;
		hash = hash * prime + this.alquilerIdAlquiler;
		
		return hash;
	}
}