/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository.Implementation;

import Entities.User;
import Repository.Repository;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author zilas
 */
public class UserRepository implements Repository<User>{

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("webapp_trabPU");
    
    @Override
    public void save(User e) {
        EntityManager em = emf.createEntityManager();        
        em.getTransaction().begin();
        
            if(e.getId() != 0){
                em.merge(e);
            }else{
                em.persist(e);
            }
        
        em.getTransaction().commit();        
        em.close();
    }

    @Override
    public User read(int id) {
        EntityManager em = emf.createEntityManager();                
        User retrivedUser = em.find(User.class, id);                        
        return retrivedUser;
    }

    @Override
    public void delete(User e) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
            if(em.contains(e)){
                em.merge(e);
            }
            em.remove(e);
        
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public List<User> all() {
        EntityManager em = emf.createEntityManager();
        Query result = em.createQuery("select u from User u", User.class);        
        return result.getResultList();
    }
    
}
