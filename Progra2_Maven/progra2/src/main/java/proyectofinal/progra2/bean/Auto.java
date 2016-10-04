package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the auto database table.
 * 
 */
@Entity
@NamedQuery(name="Auto.findAll", query="SELECT a FROM Auto a")
public class Auto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String matricula;

	private String aireacondicionado;

	@Column(name="categoria_auto")
	private String categoriaAuto;

	@Column(name="combustible_auto")
	private String combustibleAuto;

	private String descripcion;

	private String estado;

	private String imagen;

	private int nroPasajeros;

	private int nroPuertas;

	@Column(name="precio_dia")
	private BigDecimal precioDia;

	@Column(name="transmision_auto_id")
	private String transmisionAutoId;

	private int year;

	//bi-directional many-to-one association to Alquiler
	@OneToMany(mappedBy="auto")
	private List<Alquiler> alquilers;

	//bi-directional many-to-one association to ModeloAuto
	@ManyToOne
	@JoinColumn(name="modelo_auto_id_modelo_auto")
	private ModeloAuto modeloAuto;

	//bi-directional many-to-one association to Sede
	@ManyToOne
	private Sede sede;

	//bi-directional many-to-one association to TipoViajeAuto
	@ManyToOne
	@JoinColumn(name="tipo_viaje_auto_id_tipo_viaje_auto")
	private TipoViajeAuto tipoViajeAuto;

	public Auto() {
	}

	public String getMatricula() {
		return this.matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getAireacondicionado() {
		return this.aireacondicionado;
	}

	public void setAireacondicionado(String aireacondicionado) {
		this.aireacondicionado = aireacondicionado;
	}

	public String getCategoriaAuto() {
		return this.categoriaAuto;
	}

	public void setCategoriaAuto(String categoriaAuto) {
		this.categoriaAuto = categoriaAuto;
	}

	public String getCombustibleAuto() {
		return this.combustibleAuto;
	}

	public void setCombustibleAuto(String combustibleAuto) {
		this.combustibleAuto = combustibleAuto;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public int getNroPasajeros() {
		return this.nroPasajeros;
	}

	public void setNroPasajeros(int nroPasajeros) {
		this.nroPasajeros = nroPasajeros;
	}

	public int getNroPuertas() {
		return this.nroPuertas;
	}

	public void setNroPuertas(int nroPuertas) {
		this.nroPuertas = nroPuertas;
	}

	public BigDecimal getPrecioDia() {
		return this.precioDia;
	}

	public void setPrecioDia(BigDecimal precioDia) {
		this.precioDia = precioDia;
	}

	public String getTransmisionAutoId() {
		return this.transmisionAutoId;
	}

	public void setTransmisionAutoId(String transmisionAutoId) {
		this.transmisionAutoId = transmisionAutoId;
	}

	public int getYear() {
		return this.year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public List<Alquiler> getAlquilers() {
		return this.alquilers;
	}

	public void setAlquilers(List<Alquiler> alquilers) {
		this.alquilers = alquilers;
	}

	public Alquiler addAlquiler(Alquiler alquiler) {
		getAlquilers().add(alquiler);
		alquiler.setAuto(this);

		return alquiler;
	}

	public Alquiler removeAlquiler(Alquiler alquiler) {
		getAlquilers().remove(alquiler);
		alquiler.setAuto(null);

		return alquiler;
	}

	public ModeloAuto getModeloAuto() {
		return this.modeloAuto;
	}

	public void setModeloAuto(ModeloAuto modeloAuto) {
		this.modeloAuto = modeloAuto;
	}

	public Sede getSede() {
		return this.sede;
	}

	public void setSede(Sede sede) {
		this.sede = sede;
	}

	public TipoViajeAuto getTipoViajeAuto() {
		return this.tipoViajeAuto;
	}

	public void setTipoViajeAuto(TipoViajeAuto tipoViajeAuto) {
		this.tipoViajeAuto = tipoViajeAuto;
	}

}