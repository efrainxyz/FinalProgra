package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the alquiler database table.
 * 
 */
@Entity
@NamedQuery(name="Alquiler.findAll", query="SELECT a FROM Alquiler a")
public class Alquiler implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_alquiler")
	private int idAlquiler;

	private String aerolinea;

	@Column(name="direccion_temporal")
	private String direccionTemporal;

	private String estado;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_reserva")
	private Date fechaReserva;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="fecha_retorno")
	private Date fechaRetorno;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="fecha_salida")
	private Date fechaSalida;

	private String licencia;

	@Column(name="monto_a_pagar")
	private BigDecimal montoAPagar;

	@Column(name="numero_vuelo")
	private String numeroVuelo;

	//bi-directional many-to-one association to Auto
	@ManyToOne
	private Auto auto;

	//bi-directional many-to-one association to Distrito
	@ManyToOne
	private Distrito distrito;

	//bi-directional many-to-one association to Persona
	@ManyToOne
	private Persona persona;

	//bi-directional many-to-one association to Sede
	@ManyToOne
	@JoinColumn(name="sede_salida_id")
	private Sede sede1;

	//bi-directional many-to-one association to Sede
	@ManyToOne
	@JoinColumn(name="sede_retorno_id")
	private Sede sede2;

	//bi-directional many-to-one association to Alquilerxrequerimiento
	@OneToMany(mappedBy="alquiler")
	private List<Alquilerxrequerimiento> alquilerxrequerimientos;

	public Alquiler() {
	}

	public int getIdAlquiler() {
		return this.idAlquiler;
	}

	public void setIdAlquiler(int idAlquiler) {
		this.idAlquiler = idAlquiler;
	}

	public String getAerolinea() {
		return this.aerolinea;
	}

	public void setAerolinea(String aerolinea) {
		this.aerolinea = aerolinea;
	}

	public String getDireccionTemporal() {
		return this.direccionTemporal;
	}

	public void setDireccionTemporal(String direccionTemporal) {
		this.direccionTemporal = direccionTemporal;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Date getFechaReserva() {
		return this.fechaReserva;
	}

	public void setFechaReserva(Date fechaReserva) {
		this.fechaReserva = fechaReserva;
	}

	public Date getFechaRetorno() {
		return this.fechaRetorno;
	}

	public void setFechaRetorno(Date fechaRetorno) {
		this.fechaRetorno = fechaRetorno;
	}

	public Date getFechaSalida() {
		return this.fechaSalida;
	}

	public void setFechaSalida(Date fechaSalida) {
		this.fechaSalida = fechaSalida;
	}

	public String getLicencia() {
		return this.licencia;
	}

	public void setLicencia(String licencia) {
		this.licencia = licencia;
	}

	public BigDecimal getMontoAPagar() {
		return this.montoAPagar;
	}

	public void setMontoAPagar(BigDecimal montoAPagar) {
		this.montoAPagar = montoAPagar;
	}

	public String getNumeroVuelo() {
		return this.numeroVuelo;
	}

	public void setNumeroVuelo(String numeroVuelo) {
		this.numeroVuelo = numeroVuelo;
	}

	public Auto getAuto() {
		return this.auto;
	}

	public void setAuto(Auto auto) {
		this.auto = auto;
	}

	public Distrito getDistrito() {
		return this.distrito;
	}

	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}

	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public Sede getSede1() {
		return this.sede1;
	}

	public void setSede1(Sede sede1) {
		this.sede1 = sede1;
	}

	public Sede getSede2() {
		return this.sede2;
	}

	public void setSede2(Sede sede2) {
		this.sede2 = sede2;
	}

	public List<Alquilerxrequerimiento> getAlquilerxrequerimientos() {
		return this.alquilerxrequerimientos;
	}

	public void setAlquilerxrequerimientos(List<Alquilerxrequerimiento> alquilerxrequerimientos) {
		this.alquilerxrequerimientos = alquilerxrequerimientos;
	}

	public Alquilerxrequerimiento addAlquilerxrequerimiento(Alquilerxrequerimiento alquilerxrequerimiento) {
		getAlquilerxrequerimientos().add(alquilerxrequerimiento);
		alquilerxrequerimiento.setAlquiler(this);

		return alquilerxrequerimiento;
	}

	public Alquilerxrequerimiento removeAlquilerxrequerimiento(Alquilerxrequerimiento alquilerxrequerimiento) {
		getAlquilerxrequerimientos().remove(alquilerxrequerimiento);
		alquilerxrequerimiento.setAlquiler(null);

		return alquilerxrequerimiento;
	}

}