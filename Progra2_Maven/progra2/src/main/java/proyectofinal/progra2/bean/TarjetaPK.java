package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the tarjeta database table.
 * 
 */
@Embeddable
public class TarjetaPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private String dni;

	@Column(name="tipo_tarjeta_id_tipo_tarjeta", insertable=false, updatable=false)
	private int tipoTarjetaIdTipoTarjeta;

	public TarjetaPK() {
	}
	public String getDni() {
		return this.dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public int getTipoTarjetaIdTipoTarjeta() {
		return this.tipoTarjetaIdTipoTarjeta;
	}
	public void setTipoTarjetaIdTipoTarjeta(int tipoTarjetaIdTipoTarjeta) {
		this.tipoTarjetaIdTipoTarjeta = tipoTarjetaIdTipoTarjeta;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof TarjetaPK)) {
			return false;
		}
		TarjetaPK castOther = (TarjetaPK)other;
		return 
			this.dni.equals(castOther.dni)
			&& (this.tipoTarjetaIdTipoTarjeta == castOther.tipoTarjetaIdTipoTarjeta);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.dni.hashCode();
		hash = hash * prime + this.tipoTarjetaIdTipoTarjeta;
		
		return hash;
	}
}