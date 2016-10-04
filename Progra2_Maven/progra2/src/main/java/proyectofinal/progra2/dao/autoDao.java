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
			
			TypedQuery<Auto> query=em.createQuery("SELECT a FROM Auto a,TipoViajeAuto t,ModeloAuto m,MarcaAuto x WHERE x=m.marcaAuto and t=a.tipoViajeAuto and m=a.modeloAuto",Auto.class);
			listar= query.getResultList();
		} catch (Exception e) {
		 System.out.println("problema en el dao auto listar  "+e.getMessage());
		 e.printStackTrace();
		}
		
		return listar;
	}
		
	
	
}
