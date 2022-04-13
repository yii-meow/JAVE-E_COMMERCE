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
    List itemList;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findItemByID(int productID) {
        Product product = mgr.find(Product.class, productID);
        return product;
    }

    public Product findItemByCategory(String Category) {
        Product product = mgr.find(Product.class, Category);
        return product;
    }

    public boolean deleteItem(int productID) {
        Product product = findItemByID(productID);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    public List<Product> findAll(boolean prodId) {
        if (prodId == false) {
            itemList = mgr.createNamedQuery("Product.findAll").getResultList();
            return itemList;
        }

        itemList = mgr.createNamedQuery("Product.findAllAscendingByName").getResultList();
        return itemList;

    }

    public List<Product> findAll() {

        itemList = mgr.createNamedQuery("Product.findAll").getResultList();
        return itemList;
    }

    public boolean updateProduct(int id, int quantity) {
        Product tempItem = findItemByID(id);

        int stock = tempItem.getStock() - quantity;

        tempItem.setStock(stock);
        mgr.merge(tempItem);
        return true;
    }

    public List<Product> findAllAccending() {

        return itemList;
    }

}
