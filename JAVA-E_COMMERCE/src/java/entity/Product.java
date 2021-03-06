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
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findByProductId", query = "SELECT p FROM Product p WHERE p.productId = :productId"),
    @NamedQuery(name = "Product.findByProductName", query = "SELECT p FROM Product p WHERE p.productName LIKE CONCAT('%',:productName,'%')"),
    @NamedQuery(name = "Product.findByProductDescription", query = "SELECT p FROM Product p WHERE p.productDescription = :productDescription"),
    @NamedQuery(name = "Product.findByStock", query = "SELECT p FROM Product p WHERE p.stock = :stock"),
    @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price"),
    @NamedQuery(name = "Product.findByPostDuration", query = "SELECT p FROM Product p WHERE p.postDuration = :postDuration"),
    @NamedQuery(name = "Product.findByProductWeight", query = "SELECT p FROM Product p WHERE p.productWeight = :productWeight"),
    @NamedQuery(name = "Product.findByIsShipmentFree", query = "SELECT p FROM Product p WHERE p.isShipmentFree = :isShipmentFree"),
    @NamedQuery(name = "Product.findByPriceAndShipment", query = "SELECT p FROM Product p WHERE p.price >= :min_price AND p.price <= :max_price AND p.isShipmentFree = :shipment"),
    @NamedQuery(name = "Product.findMaxPrice", query = "SELECT MAX(p.price) FROM Product p"),
    @NamedQuery(name = "Product.findByProductImage", query = "SELECT p FROM Product p WHERE p.productImage = :productImage")})
public class Product implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private List<Review> reviewList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRODUCT_ID")
    private Integer productId;
    @Size(max = 100)
    @Column(name = "PRODUCT_NAME")
    private String productName;
    @Size(max = 255)
    @Column(name = "PRODUCT_DESCRIPTION")
    private String productDescription;
    @Column(name = "STOCK")
    private Integer stock;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRICE")
    private Double price;
    @Column(name = "POST_DURATION")
    @Temporal(TemporalType.TIME)
    private Date postDuration;
    @Column(name = "PRODUCT_WEIGHT")
    private Double productWeight;
    @Column(name = "IS_SHIPMENT_FREE")
    private Boolean isShipmentFree;
    @Size(max = 255)
    @Column(name = "PRODUCT_IMAGE")
    private String productImage;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private List<OrderList> orderListList;

    public Product() {
    }

    public Product(String productName, String productDescription, int stock,
            double price, double productWeight, String image, boolean isShipmentFree) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.stock = stock;
        this.price = price;
        this.productWeight = productWeight;
        this.productImage = image;
        this.isShipmentFree = isShipmentFree;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getPostDuration() {
        return postDuration;
    }

    public void setPostDuration(Date postDuration) {
        this.postDuration = postDuration;
    }

    public Double getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(Double productWeight) {
        this.productWeight = productWeight;
    }

    public Boolean getIsShipmentFree() {
        return isShipmentFree;
    }

    public void setIsShipmentFree(Boolean isShipmentFree) {
        this.isShipmentFree = isShipmentFree;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    @XmlTransient
    public List<OrderList> getOrderListList() {
        return orderListList;
    }

    public void setOrderListList(List<OrderList> orderListList) {
        this.orderListList = orderListList;
    }

    public Double getAverageRating() {
        double rating = 0;
        
        // CHECK IF THIS PRODUCT HAS ANY REVIEW
        if (this.getReviewList().size() != 0) {
            for (Review r : this.getReviewList()) {
                rating += r.getRating();
            }
            // CALCULATE AVERAGE RATING
            rating /= this.getReviewList().size();
        }

        return rating;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Product[ productId=" + productId + " ]";
    }

    @XmlTransient
    public List<Review> getReviewList() {
        return reviewList;
    }

    public void setReviewList(List<Review> reviewList) {
        this.reviewList = reviewList;
    }

}
