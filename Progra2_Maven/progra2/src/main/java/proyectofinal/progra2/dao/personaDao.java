package proyectofinal.progra2.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.interfaz.I_Persona;

@Repository
public class personaDao implements I_Persona {

	@Override
	public Persona listarPersona(String dni,String contrasena) throws Exception {
			Persona persona=null;
			try {
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
				EntityManager em=emf.createEntityManager();
				TypedQuery<Persona> sql=em.createQuery("Select p From Persona p Where p.dni = :valor1  and "
						+ "p.contrasena = :valor2 ",Persona.class);
				sql.setParameter("valor1",dni);
				sql.setParameter("valor2",contrasena);
				
				if(sql.getSingleResult().getDni()!=null){
					persona= new Persona();
					persona=sql.getSingleResult();
				}
				
				
								
			} catch (Exception e) {
				System.out.print("ERROR LISTAR PERSONA "+e.getMessage());
				return null;
			}
		
		
		return persona;
	}

	
}
