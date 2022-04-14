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

    public List<Customer> findAll() {

        query = mgr.createNamedQuery("Customer.findByCustomerID").setParameter("customerID", 7);

        return query.getResultList();
    }

    public Customer findItemsByID(int customerID) {
        Customer profile = mgr.find(Customer.class, customerID);
        return profile;
    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}