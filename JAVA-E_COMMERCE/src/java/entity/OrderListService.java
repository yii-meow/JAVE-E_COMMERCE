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
public class OrderListService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    List itemList;

    public OrderListService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addOrders(OrderList orders) {
        mgr.persist(orders);
        return true;
    }

    public boolean updateShoppingcart(Shoppingcart2 item) {
        Shoppingcart2 tempItem = findItemByID(item.getCartId());
        if (tempItem != null) {
            tempItem.setCustomerId(item.getCustomerId());
            tempItem.setProductId(item.getProductId());
            tempItem.setQuantity(item.getQuantity());
            return true;
        }
        return false;
    }

    public OrderList findOrdersByID(String orderID) {
        OrderList order = mgr.find(OrderList.class, orderID);
        return order;
    }

    public List<OrderList> findAll() {

        itemList = mgr.createNamedQuery("Orders.findAll").getResultList();

        return itemList;
    }

    public List<OrderList> findItemByID(int i) {
        Customer customer = new Customer();
        customer.setCustomerID(i);
        query = mgr.createNamedQuery("Orders.findByCustomerid").setParameter("customerID", customer);

        return query.getResultList();
    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}
