/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sohyz
 */
@Entity
@Table(name = "staff")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s"),
    @NamedQuery(name = "Staff.findByStaffID", query = "SELECT s FROM Staff s WHERE s.staffID = :staffID"),
    @NamedQuery(name = "Staff.findByStaffPassword", query = "SELECT s FROM Staff s WHERE s.staffPassword = :staffPassword"),
    @NamedQuery(name = "Staff.findByStaffName", query = "SELECT s FROM Staff s WHERE s.staffName = :staffName"),
    @NamedQuery(name = "Staff.findByStaffIc", query = "SELECT s FROM Staff s WHERE s.staffIc = :staffIc"),
    @NamedQuery(name = "Staff.findByStaffEmail", query = "SELECT s FROM Staff s WHERE s.staffEmail = :staffEmail"),
    @NamedQuery(name = "Staff.findByStaffphoneNo", query = "SELECT s FROM Staff s WHERE s.staffphoneNo = :staffphoneNo"),
    @NamedQuery(name = "Staff.findByDateJoin", query = "SELECT s FROM Staff s WHERE s.dateJoin = :dateJoin"),
    @NamedQuery(name = "Staff.findByPosition", query = "SELECT s FROM Staff s WHERE s.position = :position")})
public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "staff_ID")
    private String staffID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "staff_Password")
    private String staffPassword;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "staff_name")
    private String staffName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "staff_ic")
    private String staffIc;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "staff_email")
    private String staffEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "staff_phoneNo")
    private String staffphoneNo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 11)
    @Column(name = "date_join")
    private String dateJoin;
    @Basic(optional = false)
    @NotNull
    @Column(name = "position")
    private Character position;

    public Staff() {
    }

    public Staff(String staffID) {
        this.staffID = staffID;
    }

    public Staff(String staffID, String staffPassword, String staffName, String staffIc, String staffEmail, String staffphoneNo, String dateJoin, Character position) {
        this.staffID = staffID;
        this.staffPassword = staffPassword;
        this.staffName = staffName;
        this.staffIc = staffIc;
        this.staffEmail = staffEmail;
        this.staffphoneNo = staffphoneNo;
        this.dateJoin = dateJoin;
        this.position = position;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffIc() {
        return staffIc;
    }

    public void setStaffIc(String staffIc) {
        this.staffIc = staffIc;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffphoneNo() {
        return staffphoneNo;
    }

    public void setStaffphoneNo(String staffphoneNo) {
        this.staffphoneNo = staffphoneNo;
    }

    public String getDateJoin() {
        return dateJoin;
    }

    public void setDateJoin(String dateJoin) {
        this.dateJoin = dateJoin;
    }

    public Character getPosition() {
        return position;
    }

    public void setPosition(Character position) {
        this.position = position;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffID != null ? staffID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffID == null && other.staffID != null) || (this.staffID != null && !this.staffID.equals(other.staffID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Staff[ staffID=" + staffID + " ]";
    }
    
}
