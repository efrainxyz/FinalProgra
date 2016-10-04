package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tipo_viaje_auto database table.
 * 
 */
@Entity
@Table(name="tipo_viaje_auto")
@NamedQuery(name="TipoViajeAuto.findAll", query="SELECT t FROM TipoViajeAuto t")
public class TipoViajeAuto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_tipo_viaje_auto")
	private int idTipoViajeAuto;

	private String tipo;

	//bi-directional many-to-one association to Auto
	@OneToMany(mappedBy="tipoViajeAuto")
	private List<Auto> autos;

	public TipoViajeAuto() {
	}

	public int getIdTipoViajeAuto() {
		return this.idTipoViajeAuto;
	}

	public void setIdTipoViajeAuto(int idTipoViajeAuto) {
		this.idTipoViajeAuto = idTipoViajeAuto;
	}

	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public List<Auto> getAutos() {
		return this.autos;
	}

	public void setAutos(List<Auto> autos) {
		this.autos = autos;
	}

	public Auto addAuto(Auto auto) {
		getAutos().add(auto);
		auto.setTipoViajeAuto(this);

		return auto;
	}

	public Auto removeAuto(Auto auto) {
		getAutos().remove(auto);
		auto.setTipoViajeAuto(null);

		return auto;
	}

}