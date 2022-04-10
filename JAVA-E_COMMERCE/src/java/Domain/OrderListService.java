/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

import entity.OrderList;
import entity.Product;
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
public class OrderListService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public OrderListService() {
    }

    public OrderListService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public List<OrderList> retrieveOrderListAll() {
        query = mgr.createNamedQuery("OrderList.findAll");
        return query.getResultList();
    }

    public List<OrderList> retrieveOrderListOrderByProdId() {
        query = mgr.createNamedQuery("OrderList.orderByProductId");
        return query.getResultList();
    }

    public List<OrderList> retrieveOrderListByOrderId(int orderId) {
        query = mgr.createNamedQuery("OrderList.findByOrderId").setParameter("orderId", orderId);
        return query.getResultList();
    }

    public List<Object[]> retriveOrderListByFindSubtotalByDateGroup(Date start_date, Date end_date) {
        query = mgr.createNamedQuery("OrderList.findSubtotalByDateGroup").setParameter("startTime", start_date).setParameter("endTime", end_date);
        return query.getResultList();
    }

}
