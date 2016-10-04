package proyectofinal.progra2.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.interfaz.autoInterfaz;

@Repository
public class autoDao implements autoInterfaz{

	@Override
	public List<Auto> listarAutos() {
		List<Auto>listar=new ArrayList<Auto>();
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			TypedQuery<Auto> query=em.createQuery("SELECT * FROM Auto a inner join TipoViajeAuto b on b.idTipoViajeAuto = a.tipoViajeAuto inner join ModeloAuto c on c.idModeloAuto = a.modeloAuto inner join MarcaAuto d on d.idMarcaAuto = c.marcaAuto",Auto.class);
			listar= query.getResultList();
		} catch (Exception e) {
		 System.out.println("problema en el dao auto listar"+e.getMessage());
		}
		
		return listar;
	}
		
	
	
}
