/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author sohyz
 */
public class CustomerProfileService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    List itemList;

    public CustomerProfileService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public List<Customer> findAll(int cusID) {

        
        query = mgr.createNamedQuery("Customer.findByCustomerID").setParameter("customerID", cusID);

        return query.getResultList();
    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}
