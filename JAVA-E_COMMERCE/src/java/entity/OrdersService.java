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
public class OrdersService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    List itemList;

    public OrdersService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addOrders(Orders orders) {
        mgr.persist(orders);
        return true;
    }

    public Orders findOrdersByID(String orderID) {
        Orders order = mgr.find(Orders.class, orderID);
        return order;
    }

    public List<Orders> findAll() {

        itemList = mgr.createNamedQuery("Orders.findAll").getResultList();

        return itemList;
    }

    public List<Orders> findItemByID(int i) {
        Customer customer = new Customer();
        customer.setCustomerID(i);
        query = mgr.createNamedQuery("Orders.findByCustomerid").setParameter("customerID", customer); 
        

        return query.getResultList();
    }
    
    

    public List<Product> findAllAccending() {

        return itemList;
    }

}
