package proyectofinal.progra2.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Consulta;
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


	@Override
	public int RegistrarPersona(Persona bean) throws Exception {
		int respuesta=0;
			try {
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
				EntityManager em=emf.createEntityManager();
				em.getTransaction().begin();
				em.persist(bean);
				em.getTransaction().commit();
				respuesta=1;
				em.close();
				
			} catch (Exception e) {
				System.out.println("QUE PASA ACA????????? "+e.getMessage());
			}
		
		return respuesta;
	}

	@Override
	public int buscarCorreo(String correo) {
		int respuesta=0;
			try {
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
				EntityManager em=emf.createEntityManager();
				TypedQuery<Persona> sql=em.createQuery("Select p From Persona p Where p.correo = :valor1",Persona.class);
				sql.setParameter("valor1",correo);
				System.out.println(correo+"  BUSSSSSSSSSCAAAAAAAAAAAAAAAR DDDNNNNIIII " +sql.getFirstResult());
				if(sql.getResultList().size()>0){
					respuesta=1;
				}
				
				
			} catch (Exception e) {
				System.out.print("ERROR AL BUSCAR CORREO "+e.getMessage());
				e.printStackTrace();
			}
		
		return respuesta;
		
	}


	@Override
	public int buscarDni(String dni) throws Exception {
		int respuesta=0;
		try {
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
			EntityManager em=emf.createEntityManager();
			TypedQuery<Persona> sql=em.createQuery("Select p From Persona p Where p.dni = :valor2",Persona.class);
			sql.setParameter("valor2",dni);
			System.out.println(dni+"  BUSSSSSSSSSCAAAAAAAAAAAAAAAR DDDNNNNIIII " +sql.getFirstResult() +"  "+sql.getResultList().size());
			if(sql.getResultList().size()>0){
				respuesta=1;
			}
			
		} catch (Exception e) {
			System.out.print("ERROR AL BUSCAR DNI !!! "+e.getMessage());
			e.printStackTrace();
		}
	
	return respuesta;
	}


	@Override
	public Persona listar(String dni) throws Exception {
		Persona persona=null;
		try {
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
			EntityManager em=emf.createEntityManager();
			TypedQuery<Persona> sql=em.createQuery("Select p From Persona p Where p.dni = :valor1",Persona.class);
			sql.setParameter("valor1",dni);
			
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

	@Override
	public Persona recuperarContrasena(String correo)throws Exception{
		Persona persona = null;
		try{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
			EntityManager em=emf.createEntityManager();
			TypedQuery<Persona> sql=em.createQuery("Select p From Persona p Where p.correo = :valor1",Persona.class);
			sql.setParameter("valor1", correo);
			
			if(sql.getSingleResult().getCorreo()!=null){
				persona= new Persona();
				persona=sql.getSingleResult();
			}
			
		}catch (Exception e){
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
		return persona;
	}


	@Override
	public int agregarConsulta(Consulta consulta) throws Exception {
		// TODO Auto-generated method stub
		int respuesta=0;
		try {
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em=emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(consulta);
			em.getTransaction().commit();
			em.close();
			respuesta=1;
			
		} catch (Exception e) {
			System.out.println("Error metodo agregarConsulta: "+e.getMessage());
		}
		
		return respuesta;
	}
		

	
}
