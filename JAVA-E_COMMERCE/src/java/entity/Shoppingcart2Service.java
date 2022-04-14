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
public class Shoppingcart2Service {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    List itemList;

    public Shoppingcart2Service(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addShoppingcart(Shoppingcart2 product) {
        mgr.persist(product);
        return true;
    }

    public Shoppingcart2 findItemByID(int productID) {
        Shoppingcart2 product = mgr.find(Shoppingcart2.class, productID);
        return product;
    }

    public boolean deleteItem(int cartID) {
        Shoppingcart2 product = findItemByID(cartID);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
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

    public List<Shoppingcart2> findAll(int customerID) {
        query =mgr.createNamedQuery("Shoppingcart2.findByCustomerId").setParameter("customerId", customerID);
        return query.getResultList();

    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}
