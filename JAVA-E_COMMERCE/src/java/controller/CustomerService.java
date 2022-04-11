/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author jensienwong
 */
public class CustomerService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CustomerService() {
    }

    public CustomerService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public List<Integer> numberOfCustomerByGender(Character gender) {
        query = mgr.createNamedQuery("Customer.countCustomerGender").setParameter("gender", gender);
        return query.getResultList();
    }

}
