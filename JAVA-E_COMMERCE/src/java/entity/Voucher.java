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
@Table(name = "voucher")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Voucher.findAll", query = "SELECT v FROM Voucher v"),
    @NamedQuery(name = "Voucher.findByVoucherId", query = "SELECT v FROM Voucher v WHERE v.voucherId = :voucherId"),
    @NamedQuery(name = "Voucher.findByVoucherName", query = "SELECT v FROM Voucher v WHERE v.voucherName = :voucherName"),
    @NamedQuery(name = "Voucher.findByMinimumSpendAmount", query = "SELECT v FROM Voucher v WHERE v.minimumSpendAmount = :minimumSpendAmount"),
    @NamedQuery(name = "Voucher.findByVoucherDiscountRate", query = "SELECT v FROM Voucher v WHERE v.voucherDiscountRate = :voucherDiscountRate"),
    @NamedQuery(name = "Voucher.findByStartDate", query = "SELECT v FROM Voucher v WHERE v.startDate = :startDate"),
    @NamedQuery(name = "Voucher.findByEndDate", query = "SELECT v FROM Voucher v WHERE v.endDate = :endDate")})
public class Voucher implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "VOUCHER_ID")
    private Integer voucherId;
    @Size(max = 50)
    @Column(name = "VOUCHER_NAME")
    private String voucherName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "MINIMUM_SPEND_AMOUNT")
    private Double minimumSpendAmount;
    @Column(name = "VOUCHER_DISCOUNT_RATE")
    private Double voucherDiscountRate;
    @Column(name = "START_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;
    @Column(name = "END_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    public Voucher() {
    }

    public Voucher(Integer voucherId) {
        this.voucherId = voucherId;
    }

    public Integer getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Integer voucherId) {
        this.voucherId = voucherId;
    }

    public String getVoucherName() {
        return voucherName;
    }

    public void setVoucherName(String voucherName) {
        this.voucherName = voucherName;
    }

    public Double getMinimumSpendAmount() {
        return minimumSpendAmount;
    }

    public void setMinimumSpendAmount(Double minimumSpendAmount) {
        this.minimumSpendAmount = minimumSpendAmount;
    }

    public Double getVoucherDiscountRate() {
        return voucherDiscountRate;
    }

    public void setVoucherDiscountRate(Double voucherDiscountRate) {
        this.voucherDiscountRate = voucherDiscountRate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (voucherId != null ? voucherId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Voucher)) {
            return false;
        }
        Voucher other = (Voucher) object;
        if ((this.voucherId == null && other.voucherId != null) || (this.voucherId != null && !this.voucherId.equals(other.voucherId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Voucher[ voucherId=" + voucherId + " ]";
    }
    
}
