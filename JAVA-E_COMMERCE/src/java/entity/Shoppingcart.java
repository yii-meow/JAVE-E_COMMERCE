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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sohyz
 */
@Entity
@Table(name = "shoppingcart")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Shoppingcart.findAll", query = "SELECT s FROM Shoppingcart s"),
    @NamedQuery(name = "Shoppingcart.findByCartId", query = "SELECT s FROM Shoppingcart s WHERE s.cartId = :cartId"),
    @NamedQuery(name = "Shoppingcart.findByProductId", query = "SELECT s FROM Shoppingcart s WHERE s.productId = :productId"),
    @NamedQuery(name = "Shoppingcart.findByCustomerId", query = "SELECT s FROM Shoppingcart s WHERE s.customerId = 1"),
    @NamedQuery(name = "Shoppingcart.findByQuantity", query = "SELECT s FROM Shoppingcart s WHERE s.quantity = :quantity")})
public class Shoppingcart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CART_ID")
    private Integer cartId;
    @Column(name = "PRODUCT_ID")
    private Integer productId;
    @Column(name = "CUSTOMER_ID")
    private Integer customerId;
    @Column(name = "QUANTITY")
    private Integer quantity;

    public Shoppingcart() {
    }

    public Shoppingcart(Integer cartId, Integer productId, Integer customerId, Integer quantity) {
        this.cartId = cartId;
        this.customerId = customerId;
        this.quantity = quantity;
        this.productId = productId;
    }

    public Shoppingcart(Integer productId, Integer customerId, Integer quantity) {
        this.customerId = customerId;
        this.quantity = quantity;
        this.productId = productId;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartId != null ? cartId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Shoppingcart)) {
            return false;
        }
        Shoppingcart other = (Shoppingcart) object;
        if ((this.cartId == null && other.cartId != null) || (this.cartId != null && !this.cartId.equals(other.cartId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Shoppingcart[ cartId=" + cartId + " ]";
    }

}
