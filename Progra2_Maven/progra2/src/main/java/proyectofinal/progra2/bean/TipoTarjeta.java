package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tipo_tarjeta database table.
 * 
 */
@Entity
@Table(name="tipo_tarjeta")
@NamedQuery(name="TipoTarjeta.findAll", query="SELECT t FROM TipoTarjeta t")
public class TipoTarjeta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_tipo_tarjeta")
	private int idTipoTarjeta;

	private String tipo;

	//bi-directional many-to-one association to Tarjeta
	@OneToMany(mappedBy="tipoTarjeta")
	private List<Tarjeta> tarjetas;

	public TipoTarjeta() {
	}

	public int getIdTipoTarjeta() {
		return this.idTipoTarjeta;
	}

	public void setIdTipoTarjeta(int idTipoTarjeta) {
		this.idTipoTarjeta = idTipoTarjeta;
	}

	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public List<Tarjeta> getTarjetas() {
		return this.tarjetas;
	}

	public void setTarjetas(List<Tarjeta> tarjetas) {
		this.tarjetas = tarjetas;
	}

	public Tarjeta addTarjeta(Tarjeta tarjeta) {
		getTarjetas().add(tarjeta);
		tarjeta.setTipoTarjeta(this);

		return tarjeta;
	}

	public Tarjeta removeTarjeta(Tarjeta tarjeta) {
		getTarjetas().remove(tarjeta);
		tarjeta.setTipoTarjeta(null);

		return tarjeta;
	}

}