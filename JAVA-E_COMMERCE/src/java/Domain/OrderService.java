/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

import entity.Orders;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author jensienwong
 */
public class OrderService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public OrderService() {
    }

    public OrderService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public List<Orders> retrieveOrderAll() {
        query = mgr.createNamedQuery("Orders.findAll");
        return query.getResultList();
    }

    public List<Orders> findOrderByDate(Date date) {
        query = mgr.createNamedQuery("Orders.findOrderByDate").setParameter("startTime",date);
        return query.getResultList();
    }

}
