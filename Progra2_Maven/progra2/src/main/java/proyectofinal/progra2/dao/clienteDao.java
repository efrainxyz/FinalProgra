package proyectofinal.progra2.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import proyectofinal.progra2.bean.Alquiler;
import proyectofinal.progra2.bean.Alquilerxrequerimiento;
import proyectofinal.progra2.bean.Auto;
import proyectofinal.progra2.bean.ModeloAuto;
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
	public List<Alquiler> listarAlquilerxCliente(String dni) {
		List<Alquiler> lista=null;
			try {
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("progra2");
				EntityManager em=emf.createEntityManager();
													//"SELECT a FROM ModeloAuto a,MarcaAuto m where  m=a.marcaAuto  and m.idMarcaAuto = :valor1
				TypedQuery<Alquiler> sql=em.createQuery("Select a From Alquiler a,Persona p  Where p=a.persona and p.dni = :valor1",Alquiler.class);
				sql.setParameter("valor1",dni);
				lista=sql.getResultList();
				
			} catch (Exception e) {
				System.out.println("ERROR LISTAR ALQUILER X CLIENTE "+e.getMessage());
			}
		return lista;
	}

	@Override
	public List<Alquilerxrequerimiento> listarDetalleAlquiler(int idAlquiler) {
		// TODO Auto-generated method stub
		List<Alquilerxrequerimiento>listar= new ArrayList<Alquilerxrequerimiento>();
		try {
			
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			TypedQuery<Alquilerxrequerimiento> query=em.createQuery("SELECT a FROM Alquilerxrequerimiento a where a.id.alquilerIdAlquiler = :valor1",Alquilerxrequerimiento.class);
			query.setParameter("valor1",idAlquiler);
			
			listar= query.getResultList();
			
		} catch (Exception e) {
		 System.out.println("Error en el dao listarDetalleAlquiler: "+e.getMessage());
		 e.printStackTrace();
		}
		
		return listar;
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

	@Override
	public List<Alquiler> listarAlquilerxCodigo(int codigo) {
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
	public int cancelarReserva(int idAlquiler) throws Exception {
		// TODO Auto-generated method stub
		int resultado =0;
		try {
					
			EntityManagerFactory emf= Persistence.createEntityManagerFactory("progra2");
			EntityManager em= emf.createEntityManager();
			em.getTransaction().begin();
			Alquiler alquiler=em.find(Alquiler.class, idAlquiler);
			alquiler.setEstado("0");
			em.merge(alquiler);
			em.getTransaction().commit();
			em.close();
			resultado=1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return resultado;
	}



}
