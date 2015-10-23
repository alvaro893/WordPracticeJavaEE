/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metropolia.alvarob.sessionbeans;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import metropolia.alvarob.jpa.Languages;

/**
 *
 * @author Alvaro
 */
@Stateless
public class LanguagesFacade extends AbstractFacade<Languages> {
    @PersistenceContext(unitName = "WordPracticeJavaEEPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LanguagesFacade() {
        super(Languages.class);
    }
    
    
//    @Override
//    public List<Languages> findAll() {
//        Query query =
//        em.createNamedQuery("Languages.findAll");
//        List resultList = query.getResultList();
//        return resultList;
//    }
    
    
    
}
