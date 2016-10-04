package proyectofinal.progra2.bean;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the sede database table.
 * 
 */
@Entity
@NamedQuery(name="Sede.findAll", query="SELECT s FROM Sede s")
public class Sede implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_sede")
	private int idSede;

	private String sede;

	//bi-directional many-to-one association to Alquiler
	@OneToMany(mappedBy="sede1")
	private List<Alquiler> alquilers1;

	//bi-directional many-to-one association to Alquiler
	@OneToMany(mappedBy="sede2")
	private List<Alquiler> alquilers2;

	//bi-directional many-to-one association to Auto
	@OneToMany(mappedBy="sede")
	private List<Auto> autos;

	public Sede() {
	}

	public int getIdSede() {
		return this.idSede;
	}

	public void setIdSede(int idSede) {
		this.idSede = idSede;
	}

	public String getSede() {
		return this.sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}

	public List<Alquiler> getAlquilers1() {
		return this.alquilers1;
	}

	public void setAlquilers1(List<Alquiler> alquilers1) {
		this.alquilers1 = alquilers1;
	}

	public Alquiler addAlquilers1(Alquiler alquilers1) {
		getAlquilers1().add(alquilers1);
		alquilers1.setSede1(this);

		return alquilers1;
	}

	public Alquiler removeAlquilers1(Alquiler alquilers1) {
		getAlquilers1().remove(alquilers1);
		alquilers1.setSede1(null);

		return alquilers1;
	}

	public List<Alquiler> getAlquilers2() {
		return this.alquilers2;
	}

	public void setAlquilers2(List<Alquiler> alquilers2) {
		this.alquilers2 = alquilers2;
	}

	public Alquiler addAlquilers2(Alquiler alquilers2) {
		getAlquilers2().add(alquilers2);
		alquilers2.setSede2(this);

		return alquilers2;
	}

	public Alquiler removeAlquilers2(Alquiler alquilers2) {
		getAlquilers2().remove(alquilers2);
		alquilers2.setSede2(null);

		return alquilers2;
	}

	public List<Auto> getAutos() {
		return this.autos;
	}

	public void setAutos(List<Auto> autos) {
		this.autos = autos;
	}

	public Auto addAuto(Auto auto) {
		getAutos().add(auto);
		auto.setSede(this);

		return auto;
	}

	public Auto removeAuto(Auto auto) {
		getAutos().remove(auto);
		auto.setSede(null);

		return auto;
	}

}