package proyectofinal.progra2.dao;

import java.util.ArrayList;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Pago;
import proyectofinal.progra2.interfaz.I_Administrador;
@Repository
public class AdministradorDao implements I_Administrador {

	@Override
	public List<Alquiler> listarAlquilerXCodigo(int codigo) {
		// TODO Auto-generated method stub
		List<Alquiler> listar= new ArrayList<Alquiler>();
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			
			TypedQuery<Alquiler> query=em.createQuery("Select a From Alquiler a,Persona p  Where p=a.persona and a.idAlquiler = :valor1",Alquiler.class);
			query.setParameter("valor1", codigo);
			
			listar= query.getResultList();
			
		} catch (Exception e) {
		 System.out.println("Error listarAlquiler: "+e.getMessage());
		
		}
		
		return listar;
	}

	@Override
	public int registrarPago(Pago pago) {
		// TODO Auto-generated method stub
		int respuesta=0;
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em=emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(pago);
			em.getTransaction().commit();
			em.close();
			respuesta=1;
			
		} catch (Exception e) {
			System.out.println("Error en registrar pago: "+e.getMessage());
		}
		
		return respuesta;
	}

	@Override
	public int verificarPago(Alquiler alquiler) {
		// TODO Auto-generated method stub
		List<Pago> listar= new ArrayList<Pago>();
		int resultado=0;
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			
			TypedQuery<Pago> query=em.createQuery("Select p From Pago p where p.alquiler = :valor1",Pago.class);
			query.setParameter("valor1", alquiler);
			
			listar= query.getResultList();
			
			if(listar.size()<0){
				resultado=0;
			} else if(listar.size()>0) {
				resultado=1;
			}
			System.out.println("En VERIFICAR PAGO resultado es: "+resultado);
		} catch (Exception e) {
		 System.out.println("Error listarAlquiler: "+e.getMessage());
		
		}
		return resultado;
	}

}
