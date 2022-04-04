/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author sohyz
 */
public class Customer_AccountService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public Customer_AccountService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addUser(Customer_Account acc) {
        mgr.persist(acc);
        return true;
    }

    public Customer_Account findPswByID(String ID) {
        Customer_Account psw = mgr.find(Customer_Account.class, ID);
        return psw;
    }
    
    
}
