package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the alquilerxrequerimiento database table.
 * 
 */
@Entity
@NamedQuery(name="Alquilerxrequerimiento.findAll", query="SELECT a FROM Alquilerxrequerimiento a")
public class Alquilerxrequerimiento implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private AlquilerxrequerimientoPK id;

	private int cantidad;

	@Column(name="precio_total")
	private BigDecimal precioTotal;

	//bi-directional many-to-one association to Alquiler
	@ManyToOne
	private Alquiler alquiler;

	//bi-directional many-to-one association to RequerimientoEspecial
	@ManyToOne
	@JoinColumn(name="requerimiento_especial_id_requerimiento")
	private RequerimientoEspecial requerimientoEspecial;

	public Alquilerxrequerimiento() {
	}

	public AlquilerxrequerimientoPK getId() {
		return this.id;
	}

	public void setId(AlquilerxrequerimientoPK id) {
		this.id = id;
	}

	public int getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public BigDecimal getPrecioTotal() {
		return this.precioTotal;
	}

	public void setPrecioTotal(BigDecimal precioTotal) {
		this.precioTotal = precioTotal;
	}

	public Alquiler getAlquiler() {
		return this.alquiler;
	}

	public void setAlquiler(Alquiler alquiler) {
		this.alquiler = alquiler;
	}

	public RequerimientoEspecial getRequerimientoEspecial() {
		return this.requerimientoEspecial;
	}

	public void setRequerimientoEspecial(RequerimientoEspecial requerimientoEspecial) {
		this.requerimientoEspecial = requerimientoEspecial;
	}

}