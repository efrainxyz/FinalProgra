package proyectofinal.progra2.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Alquilerxrequerimiento;
import proyectofinal.progra2.bean.Persona;
import proyectofinal.progra2.interfaz.I_Cliente;

@Repository
public class clienteDao implements I_Cliente {

	@Override
	public int actualizarContrasena(String contrasena, String dni) throws Exception {
		int resultado=0;
		try {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("progra2");
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			Persona clave=em.find(Persona.class, dni);
			
			clave.setContrasena(contrasena);
			em.merge(clave);
			em.getTransaction().commit();
			em.close();
			System.out.print("llega esta "+contrasena);
			resultado=1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}	
		return resultado;
	}

	@Override
	public List<Alquiler> listarAlquilerxCliente(int dni) {
		List<Alquiler> lista=null;
			try {
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
				EntityManager em=emf.createEntityManager();
				TypedQuery<Persona> sql=em.createQuery("Select a From Alquiler a Where a.persona_dni = :valor1  and "
						+ "p.contrasena = :valor2 ",Persona.class);
				sql.setParameter("valor1",dni);
				
				
			} catch (Exception e) {
				System.out.println("ERROR LISTAR ALQUILER X CLIENTE "+e.getMessage());
			}
		return lista;
	}

	@Override
	public List<Alquilerxrequerimiento> listarDetalleAlquiler(int idAlquiler) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int actualizardatospersonales(Persona bean,String dni)
			throws Exception {
		int resultado=0;
		try {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("progra2");
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			Persona actualizar=em.find(Persona.class,dni);
			
			actualizar.setNombre(bean.getNombre());
			actualizar.setApellidoPaterno(bean.getApellidoPaterno());
			actualizar.setApellidoMaterno(bean.getApellidoMaterno());
			actualizar.setCorreo(bean.getCorreo());
			em.merge(actualizar);
			em.getTransaction().commit();
			em.close();
			resultado=1;
		} catch (Exception e) {
			System.out.print("error en cliente dao actualizar datos personales "+e.getMessage());
		}	
		return resultado;
	}



}
