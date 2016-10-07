package proyectofinal.progra2.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import proyectofinal.progra2.bean.Persona;

public class PruebaaaDAOOO extends personaDao {

	public static void main(String[] args) {
	
		PruebaaaDAOOO dao=new PruebaaaDAOOO();
		
		String correo="efrain_alvarez@usmp.pe";
		int respuesta=dao.buscarCorreo(correo);
		System.out.println("RESPUESTAAA  "+respuesta);
		
	}
	
	
	public int buscarCorreo(String correo){
		int respuesta=0;
			try {
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
				EntityManager em=emf.createEntityManager();
				TypedQuery<Persona> sql=em.createQuery("Select p From Persona p Where p.correo = :valor1",Persona.class);
				sql.setParameter("valor1",correo);
				respuesta=1;
			} catch (Exception e) {
				System.out.print("ERROR AL BUSCAR CORREO "+e.getMessage());
			}
			return respuesta;
	}

}
