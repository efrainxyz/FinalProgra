package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the marca_auto database table.
 * 
 */
@Entity
@Table(name="marca_auto")
@NamedQuery(name="MarcaAuto.findAll", query="SELECT m FROM MarcaAuto m")
public class MarcaAuto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_marca_auto")
	private int idMarcaAuto;

	private String marca;

	//bi-directional many-to-one association to ModeloAuto
	@OneToMany(mappedBy="marcaAuto")
	private List<ModeloAuto> modeloAutos;

	public MarcaAuto() {
	}

	public int getIdMarcaAuto() {
		return this.idMarcaAuto;
	}

	public void setIdMarcaAuto(int idMarcaAuto) {
		this.idMarcaAuto = idMarcaAuto;
	}

	public String getMarca() {
		return this.marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public List<ModeloAuto> getModeloAutos() {
		return this.modeloAutos;
	}

	public void setModeloAutos(List<ModeloAuto> modeloAutos) {
		this.modeloAutos = modeloAutos;
	}

	public ModeloAuto addModeloAuto(ModeloAuto modeloAuto) {
		getModeloAutos().add(modeloAuto);
		modeloAuto.setMarcaAuto(this);

		return modeloAuto;
	}

	public ModeloAuto removeModeloAuto(ModeloAuto modeloAuto) {
		getModeloAutos().remove(modeloAuto);
		modeloAuto.setMarcaAuto(null);

		return modeloAuto;
	}

}