/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDate;
import static java.time.format.DateTimeFormatter.BASIC_ISO_DATE;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
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

    public Orders findOrdersByID(int orderID) {
        Orders order = mgr.find(Orders.class, orderID);
        return order;
    }

    public boolean updateOrders(Orders item, List<OrderList> orderlist,String deliveryCourier,int customerID) {
        Orders tempItem = findOrdersByID(item.getOrderId());
        Calendar c = Calendar.getInstance();
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder sb = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < 4; i++) {
            int index = rand.nextInt(alphabet.length());
            char randomChar = alphabet.charAt(index);
            sb.append(randomChar);
        }

        Date cur = new Date();
        c.setTime(cur);
        c.add(Calendar.DATE, 7);
        Date later = c.getTime();
        LocalDate date = LocalDate.now();
        String tracking = date.format(BASIC_ISO_DATE);

        if (tempItem != null) {
            tempItem.setCustomerID(tempItem.getCustomerID());
            tempItem.setDeliveryCourier(deliveryCourier);
            tempItem.setOrderListList(orderlist);
            tempItem.setOrderTime(cur);
            tempItem.setShipTime(later);
            tempItem.setShipmentDetails("ORDERED");
            tempItem.setTrackingNumber(tracking + sb);
            mgr.merge(tempItem);
            return true;
        }
        return false;
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
