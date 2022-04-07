/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author yikso
 */
@Entity
@Table(name = "orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderId", query = "SELECT o FROM Orders o WHERE o.orderId = :orderId"),
    @NamedQuery(name = "Orders.findByOrderTime", query = "SELECT o FROM Orders o WHERE o.orderTime = :orderTime"),
    @NamedQuery(name = "Orders.findByShipTime", query = "SELECT o FROM Orders o WHERE o.shipTime = :shipTime"),
    @NamedQuery(name = "Orders.findByTrackingNumber", query = "SELECT o FROM Orders o WHERE o.trackingNumber = :trackingNumber"),
    @NamedQuery(name = "Orders.findByDeliveryCourier", query = "SELECT o FROM Orders o WHERE o.deliveryCourier = :deliveryCourier"),
    @NamedQuery(name = "Orders.findByShipmentDetails", query = "SELECT o FROM Orders o WHERE o.shipmentDetails = :shipmentDetails")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDER_ID")
    private Integer orderId;
    @Column(name = "ORDER_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderTime;
    @Column(name = "SHIP_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date shipTime;
    @Size(max = 20)
    @Column(name = "TRACKING_NUMBER")
    private String trackingNumber;
    @Size(max = 4)
    @Column(name = "DELIVERY_COURIER")
    private String deliveryCourier;
    @Size(max = 50)
    @Column(name = "SHIPMENT_DETAILS")
    private String shipmentDetails;
    @JoinColumn(name = "customer_ID", referencedColumnName = "customer_ID")
    @ManyToOne
    private Customer customerID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orders")
    private List<OrderList> orderListList;

    public Orders() {
    }

    public Orders(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getShipTime() {
        return shipTime;
    }

    public void setShipTime(Date shipTime) {
        this.shipTime = shipTime;
    }

    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public String getDeliveryCourier() {
        return deliveryCourier;
    }

    public void setDeliveryCourier(String deliveryCourier) {
        this.deliveryCourier = deliveryCourier;
    }

    public String getShipmentDetails() {
        return shipmentDetails;
    }

    public void setShipmentDetails(String shipmentDetails) {
        this.shipmentDetails = shipmentDetails;
    }

    public Customer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customer customerID) {
        this.customerID = customerID;
    }
    
    public Double calculateTotal() {
        Double totalPrice = 0.0;        
          
        for (OrderList ol: this.orderListList){
            totalPrice += ol.getSubtotal();
        }
        
        return totalPrice;
    }

    @XmlTransient
    public List<OrderList> getOrderListList() {
        return orderListList;
    }

    public void setOrderListList(List<OrderList> orderListList) {
        this.orderListList = orderListList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orders[ orderId=" + orderId + " ]";
    }
    
}
