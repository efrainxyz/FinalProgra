package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the modelo_auto database table.
 * 
 */
@Entity
@Table(name="modelo_auto")
@NamedQuery(name="ModeloAuto.findAll", query="SELECT m FROM ModeloAuto m")
public class ModeloAuto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_modelo_auto")
	private int idModeloAuto;

	private String modelo;

	//bi-directional many-to-one association to Auto
	@OneToMany(mappedBy="modeloAuto")
	private List<Auto> autos;

	//bi-directional many-to-one association to MarcaAuto
	@ManyToOne
	@JoinColumn(name="marca_auto_id_marca_auto")
	private MarcaAuto marcaAuto;

	public ModeloAuto() {
	}

	public int getIdModeloAuto() {
		return this.idModeloAuto;
	}

	public void setIdModeloAuto(int idModeloAuto) {
		this.idModeloAuto = idModeloAuto;
	}

	public String getModelo() {
		return this.modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public List<Auto> getAutos() {
		return this.autos;
	}

	public void setAutos(List<Auto> autos) {
		this.autos = autos;
	}

	public Auto addAuto(Auto auto) {
		getAutos().add(auto);
		auto.setModeloAuto(this);

		return auto;
	}

	public Auto removeAuto(Auto auto) {
		getAutos().remove(auto);
		auto.setModeloAuto(null);

		return auto;
	}

	public MarcaAuto getMarcaAuto() {
		return this.marcaAuto;
	}

	public void setMarcaAuto(MarcaAuto marcaAuto) {
		this.marcaAuto = marcaAuto;
	}

}