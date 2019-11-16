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
        em.close();
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
    public List<User> all(int lowerBound, int upperBound) {
        EntityManager em = emf.createEntityManager();
        Query result = null;
        if(lowerBound == 0 && upperBound == -1){
            result = em.createNativeQuery("select * from users");
        }else{
            result = em.createNativeQuery(String.format("select * from users limit %d offset %s", upperBound-lowerBound, lowerBound));
        }
        em.close();
        return result.getResultList();
    }
    
}
