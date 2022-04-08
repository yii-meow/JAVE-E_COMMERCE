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
public class ShoppingcartService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    List itemList;

    public ShoppingcartService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addShoppingcart(Shoppingcart product) {
        mgr.persist(product);
        return true;
    }

    public Shoppingcart findItemByID(int productID) {
        Shoppingcart product = mgr.find(Shoppingcart.class, productID);
        return product;
    }

    public boolean deleteItem(int productID) {
        Shoppingcart product = findItemByID(productID);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    public boolean updateShoppingcart(Shoppingcart item) {
        Shoppingcart tempItem = findItemByID(item.getCartId());
        if (tempItem != null) {
            tempItem.setCustomerId(item.getCustomerId());
            tempItem.setProductId(item.getProductId());
            tempItem.setQuantity(item.getQuantity());
            return true;
        }
        return false;
    }

    public List<Shoppingcart> findAll() {
        Shoppingcart shoppingcart = new Shoppingcart();
        shoppingcart.setCustomerId(1);
        itemList = mgr.createNamedQuery("Shoppingcart.findByCustomerId").getResultList();
        return itemList;

    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}
