/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sohyz
 */
@Entity
@Table(name = "shoppingcart_2")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Shoppingcart2.findAll", query = "SELECT s FROM Shoppingcart2 s"),
    @NamedQuery(name = "Shoppingcart2.findByCartId", query = "SELECT s FROM Shoppingcart2 s WHERE s.cartId = :cartId"),
    @NamedQuery(name = "Shoppingcart2.findByCustomerId", query = "SELECT s FROM Shoppingcart2 s WHERE s.customerId = :customerId"),
    @NamedQuery(name = "Shoppingcart2.findByQuantity", query = "SELECT s FROM Shoppingcart2 s WHERE s.quantity = :quantity")})
public class Shoppingcart2 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CART_ID")
    private Integer cartId;
    @Column(name = "CUSTOMER_ID")
    private Integer customerId;
    @Column(name = "QUANTITY")
    private Integer quantity;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne
    private Product productId;

    public Shoppingcart2() {
    }

    public Shoppingcart2(Integer cartId, Product productId, Integer customerId, Integer quantity) {
        this.cartId = cartId;
        this.productId = productId;
        this.customerId = customerId;
        this.quantity = quantity;
    }


    public Shoppingcart2(Product productId, Integer customerId, Integer quantity) {
        this.productId = productId;
        this.customerId = customerId;
        this.quantity = quantity;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartId != null ? cartId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Shoppingcart2)) {
            return false;
        }
        Shoppingcart2 other = (Shoppingcart2) object;
        if ((this.cartId == null && other.cartId != null) || (this.cartId != null && !this.cartId.equals(other.cartId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Shoppingcart2[ cartId=" + cartId + " ]";
    }

}
