/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metropolia.alvarob.sessionbeans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import metropolia.alvarob.jpa.Words;

/**
 *
 * @author Alvaro
 */
@Stateless
public class WordsFacade extends AbstractFacade<Words> {
    @PersistenceContext(unitName = "WordPracticeJavaEEPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WordsFacade() {
        super(Words.class);
    }
   
    
}
