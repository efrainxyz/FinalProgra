package proyectofinal.progra2.dao;

import java.util.ArrayList;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Alquiler;
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
			for (int i = 0; i < listar.size(); i++) {
				System.out.println(listar.get(i).getIdAlquiler());
				System.out.println(listar.get(i).getPersona().getNombre());
				System.out.println(listar.get(i).getAuto().getMatricula());
				System.out.println(listar.get(i).getFechaSalida());
				System.out.println(listar.get(i).getFechaRetorno());
				System.out.println(listar.get(i).getMontoAPagar());
				System.out.println("\n\n Llega acá? esto es el dao");
			}
		} catch (Exception e) {
		 System.out.println("Error listarAlquiler: "+e.getMessage());
		
		}
		
		return listar;
	}

}
