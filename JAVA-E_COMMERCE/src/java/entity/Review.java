/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yikso
 */
@Entity
@Table(name = "review")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Review.findAll", query = "SELECT r FROM Review r"),
    @NamedQuery(name = "Review.findByReviewId", query = "SELECT r FROM Review r WHERE r.reviewId = :reviewId"),
    @NamedQuery(name = "Review.findByProductName", query = "SELECT r FROM Review r WHERE r.productName = :productName"),
    @NamedQuery(name = "Review.findByReviewDate", query = "SELECT r FROM Review r WHERE r.reviewDate = :reviewDate"),
    @NamedQuery(name = "Review.findByRating", query = "SELECT r FROM Review r WHERE r.rating = :rating"),
    @NamedQuery(name = "Review.findOverallAverageRating", query = "SELECT AVG(r.rating) FROM Review r"),
    @NamedQuery(name = "Review.findByCustomerId", query = "SELECT r FROM Review r WHERE r.customerId = :customerId"),
    @NamedQuery(name = "Review.findByReviewComment", query = "SELECT r FROM Review r WHERE r.reviewComment = :reviewComment")})
public class Review implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "REVIEW_ID")
    private Integer reviewId;
    @Size(max = 100)
    @Column(name = "PRODUCT_NAME")
    private String productName;
    @Column(name = "REVIEW_DATE")
    @Temporal(TemporalType.DATE)
    private Date reviewDate;
    @Column(name = "RATING")
    private Integer rating;
    @Size(max = 255)
    @Column(name = "REVIEW_COMMENT")
    private String reviewComment;
    @Column(name = "Customer_Id")
    private Integer customerId;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Product productId;

    public Review() {
    }

    public Review(Integer reviewId) {
        this.reviewId = reviewId;
    }

    public Review(Product productId, String productName, Date reviewDate, int rating, String reviewComment, int customerId) {
        this.productId = productId;
        this.productName = productName;
        this.reviewDate = reviewDate;
        this.rating = rating;
        this.reviewComment = reviewComment;
        this.customerId = customerId;
    }

    public Integer getReviewId() {
        return reviewId;
    }

    public void setReviewId(Integer reviewId) {
        this.reviewId = reviewId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getReviewComment() {
        return reviewComment;
    }

    public void setReviewComment(String reviewComment) {
        this.reviewComment = reviewComment;
    }
    
    public Integer getCustomerId() {
      return customerId;
   }

   public void setCustomerId(Integer customerId) {
      this.customerId = customerId;
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
        hash += (reviewId != null ? reviewId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Review)) {
            return false;
        }
        Review other = (Review) object;
        if ((this.reviewId == null && other.reviewId != null) || (this.reviewId != null && !this.reviewId.equals(other.reviewId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Review[ reviewId=" + reviewId + " ]";
    }

}
