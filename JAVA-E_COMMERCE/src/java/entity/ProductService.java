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
public class ProductService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findItemByID(String productID) {
        Product product = mgr.find(Product.class, productID);
        return product;
    }

    public boolean deleteItem(String productID) {
        Product product = findItemByID(productID);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    private List<Product> findAll() {
        List itemList = mgr.createNamedQuery("Product.findAll").getResultList();
        return itemList;
    }
    


}
