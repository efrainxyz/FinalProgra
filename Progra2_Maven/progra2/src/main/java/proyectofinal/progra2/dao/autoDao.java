package proyectofinal.progra2.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.MarcaAuto;
import proyectofinal.progra2.bean.ModeloAuto;
import proyectofinal.progra2.bean.Sede;
import proyectofinal.progra2.bean.TipoViajeAuto;
import proyectofinal.progra2.interfaz.I_Auto;

@Repository
public class autoDao implements I_Auto{

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
		
		}
		
		return listar;
	}

	@Override
	public int agregarAuto(Auto auto) {
		int respuesta=0;
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em=emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(auto);
			em.getTransaction().commit();
			em.close();
			respuesta=1;
			
		} catch (Exception e) {
			System.out.println("ERROR "+e.getMessage());
		}
		
		return respuesta;
	}

	@Override
	public List<Sede> listarSede() {
		List<Sede>listar=new ArrayList<Sede>();
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			
			TypedQuery<Sede> query=em.createQuery("SELECT a FROM Sede a",Sede.class);
			listar= query.getResultList();
		} catch (Exception e) {
		 System.out.println("problema en el dao auto listar  "+e.getMessage());
		 e.printStackTrace();
		}
		
		return listar;
	}

	@Override
	public List<TipoViajeAuto> listarTipoviajeauto() {
		List<TipoViajeAuto>listar=new ArrayList<TipoViajeAuto>();
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			
			TypedQuery<TipoViajeAuto> query=em.createQuery("SELECT a FROM TipoViajeAuto a",TipoViajeAuto.class);
			listar= query.getResultList();
		} catch (Exception e) {
		 System.out.println("problema en el dao auto listar  "+e.getMessage());
		 e.printStackTrace();
		}
		
		return listar;
	}

	@Override
	public List<MarcaAuto> listarMarcaauto() {
		List<MarcaAuto>listar=new ArrayList<MarcaAuto>();
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			
			TypedQuery<MarcaAuto> query=em.createQuery("SELECT a FROM MarcaAuto a",MarcaAuto.class);
			listar= query.getResultList();
		} catch (Exception e) {
		 System.out.println("problema en el dao auto listar  "+e.getMessage());
		 e.printStackTrace();
		}
		
		return listar;
	}

	@Override
	public List<ModeloAuto> listarModeloAuto(int id) {
		List<ModeloAuto>listar=new ArrayList<ModeloAuto>();
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			TypedQuery<ModeloAuto> query=em.createQuery("SELECT a FROM ModeloAuto a,MarcaAuto m where  m=a.marcaAuto  and m.idMarcaAuto = :valor1",ModeloAuto.class);
			query.setParameter("valor1",id);
			
			listar= query.getResultList();
		} catch (Exception e) {
		 System.out.println("problema en el dao auto listar  "+e.getMessage());
		 e.printStackTrace();
		}
		
		return listar;
	}

	
		
	
	
}
