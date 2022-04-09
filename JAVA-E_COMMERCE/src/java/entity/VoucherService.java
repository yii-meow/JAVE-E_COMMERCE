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
public class VoucherService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    List itemList;

    public VoucherService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addShoppingcart(Voucher product) {
        mgr.persist(product);
        return true;
    }

    public Voucher findItemByID(int productID) {
        Voucher product = mgr.find(Voucher.class, productID);
        return product;
    }

    public boolean deleteItem(int productID) {
        Voucher product = findItemByID(productID);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }


    public List<Voucher> findAll() {
        Shoppingcart2 shoppingcart = new Shoppingcart2();
        shoppingcart.setCustomerId(1);
        itemList = mgr.createNamedQuery("Voucher.findAll").getResultList();
        return itemList;

    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}
