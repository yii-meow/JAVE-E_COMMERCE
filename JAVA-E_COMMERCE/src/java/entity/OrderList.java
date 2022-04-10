/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yikso
 */
@Entity
@Table(name = "order_list")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderList.findAll", query = "SELECT o FROM OrderList o"),
    @NamedQuery(name = "OrderList.findByOrderId", query = "SELECT o FROM OrderList o WHERE o.orderListPK.orderId = :orderId"),
    @NamedQuery(name = "OrderList.findByProductId", query = "SELECT o FROM OrderList o WHERE o.orderListPK.productId = :productId"),
    @NamedQuery(name = "OrderList.findByQuantity", query = "SELECT o FROM OrderList o WHERE o.quantity = :quantity"),
    @NamedQuery(name = "OrderList.findSubtotalGroup", query = "SELECT o.product.productId, SUM(o.subtotal), SUM(o.quantity), o.product.productName,o.product.price FROM OrderList o GROUP BY o.product.productId"), // CHECK OVERALL ORDERLIST
    @NamedQuery(name = "OrderList.findSubtotalByDateGroup", query = "SELECT o.product.productId, SUM(o.subtotal), SUM(o.quantity), o.product.productName,o.product.price FROM OrderList o WHERE o.orders.orderTime BETWEEN :startTime AND :endTime GROUP BY o.product.productId"), // CHECK DAILY SALES RECORD
    @NamedQuery(name = "OrderList.findOrderInTimeRange", query = "SELECT o FROM OrderList o WHERE o.orders.orderTime BETWEEN :startTime AND :endTime"), // FIND ORDER BETWEEN GIVEN DATES
    @NamedQuery(name = "OrderList.findBySubtotal", query = "SELECT o FROM OrderList o WHERE o.subtotal = :subtotal")})
public class OrderList implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderListPK orderListPK;
    @Column(name = "QUANTITY")
    private Integer quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "SUBTOTAL")
    private Double subtotal;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ORDER_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Orders orders;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public OrderList() {
    }

    public OrderList(OrderListPK orderListPK) {
        this.orderListPK = orderListPK;
    }

    public OrderList(int orderId, int productId) {
        this.orderListPK = new OrderListPK(orderId, productId);
    }

    public OrderListPK getOrderListPK() {
        return orderListPK;
    }

    public void setOrderListPK(OrderListPK orderListPK) {
        this.orderListPK = orderListPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderListPK != null ? orderListPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderList)) {
            return false;
        }
        OrderList other = (OrderList) object;
        if ((this.orderListPK == null && other.orderListPK != null) || (this.orderListPK != null && !this.orderListPK.equals(other.orderListPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderList[ orderListPK=" + orderListPK + " ]";
    }

}
