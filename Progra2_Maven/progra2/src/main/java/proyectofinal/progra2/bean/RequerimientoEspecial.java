package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the requerimiento_especial database table.
 * 
 */
@Entity
@Table(name="requerimiento_especial")
@NamedQuery(name="RequerimientoEspecial.findAll", query="SELECT r FROM RequerimientoEspecial r")
public class RequerimientoEspecial implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_requerimiento")
	private int idRequerimiento;

	private String nombre;

	private BigDecimal precio;

	//bi-directional many-to-one association to Alquilerxrequerimiento
	@OneToMany(mappedBy="requerimientoEspecial")
	private List<Alquilerxrequerimiento> alquilerxrequerimientos;

	public RequerimientoEspecial() {
	}

	public int getIdRequerimiento() {
		return this.idRequerimiento;
	}

	public void setIdRequerimiento(int idRequerimiento) {
		this.idRequerimiento = idRequerimiento;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public BigDecimal getPrecio() {
		return this.precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public List<Alquilerxrequerimiento> getAlquilerxrequerimientos() {
		return this.alquilerxrequerimientos;
	}

	public void setAlquilerxrequerimientos(List<Alquilerxrequerimiento> alquilerxrequerimientos) {
		this.alquilerxrequerimientos = alquilerxrequerimientos;
	}

	public Alquilerxrequerimiento addAlquilerxrequerimiento(Alquilerxrequerimiento alquilerxrequerimiento) {
		getAlquilerxrequerimientos().add(alquilerxrequerimiento);
		alquilerxrequerimiento.setRequerimientoEspecial(this);

		return alquilerxrequerimiento;
	}

	public Alquilerxrequerimiento removeAlquilerxrequerimiento(Alquilerxrequerimiento alquilerxrequerimiento) {
		getAlquilerxrequerimientos().remove(alquilerxrequerimiento);
		alquilerxrequerimiento.setRequerimientoEspecial(null);

		return alquilerxrequerimiento;
	}

}