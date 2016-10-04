package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the tarjeta database table.
 * 
 */
@Entity
@NamedQuery(name="Tarjeta.findAll", query="SELECT t FROM Tarjeta t")
public class Tarjeta implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private TarjetaPK id;

	private String cvs;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_expiracion")
	private Date fechaExpiracion;

	@Column(name="nro_tarjeta")
	private String nroTarjeta;

	private BigDecimal saldo;

	//bi-directional many-to-one association to Persona
	@ManyToOne
	@JoinColumn(name="dni")
	private Persona persona;

	//bi-directional many-to-one association to TipoTarjeta
	@ManyToOne
	@JoinColumn(name="tipo_tarjeta_id_tipo_tarjeta")
	private TipoTarjeta tipoTarjeta;

	public Tarjeta() {
	}

	public TarjetaPK getId() {
		return this.id;
	}

	public void setId(TarjetaPK id) {
		this.id = id;
	}

	public String getCvs() {
		return this.cvs;
	}

	public void setCvs(String cvs) {
		this.cvs = cvs;
	}

	public Date getFechaExpiracion() {
		return this.fechaExpiracion;
	}

	public void setFechaExpiracion(Date fechaExpiracion) {
		this.fechaExpiracion = fechaExpiracion;
	}

	public String getNroTarjeta() {
		return this.nroTarjeta;
	}

	public void setNroTarjeta(String nroTarjeta) {
		this.nroTarjeta = nroTarjeta;
	}

	public BigDecimal getSaldo() {
		return this.saldo;
	}

	public void setSaldo(BigDecimal saldo) {
		this.saldo = saldo;
	}

	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public TipoTarjeta getTipoTarjeta() {
		return this.tipoTarjeta;
	}

	public void setTipoTarjeta(TipoTarjeta tipoTarjeta) {
		this.tipoTarjeta = tipoTarjeta;
	}

}