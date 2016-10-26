package proyectofinal.progra2.bean;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQuery(name="Pago.findAll", query="SELECT p FROM Pago p")
public class Pago {
	@Id
	@Column(name="id_pago")
	private int idPago;
	
	@Column(name="monto_ingresar")
	private BigDecimal montoIngresar;
	
	@Column(name="monto_pagar")
	private BigDecimal montoPagar;
	
	private BigDecimal vuelto;
	
	@Column(name="fecha_pago")
	private String fechaPago;
	
	//uni-directional one-to-one to Alquiler
	@OneToOne
	@JoinColumn(name="id_alquiler")
	private Alquiler alquiler;

	public int getIdPago() {
		return idPago;
	}

	public void setIdPago(int idPago) {
		this.idPago = idPago;
	}

	public BigDecimal getMontoIngresar() {
		return montoIngresar;
	}

	public void setMontoIngresar(BigDecimal montoIngresar) {
		this.montoIngresar = montoIngresar;
	}

	public BigDecimal getMontoPagar() {
		return montoPagar;
	}

	public void setMontoPagar(BigDecimal montoPagar) {
		this.montoPagar = montoPagar;
	}

	public BigDecimal getVuelto() {
		return vuelto;
	}

	public void setVuelto(BigDecimal vuelto) {
		this.vuelto = vuelto;
	}

	public Alquiler getAlquiler() {
		return alquiler;
	}

	public void setAlquiler(Alquiler alquiler) {
		this.alquiler = alquiler;
	}

	public String getFechaPago() {
		return fechaPago;
	}

	public void setFechaPago(String fechaPago) {
		this.fechaPago = fechaPago;
	}

	
}
