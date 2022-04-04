/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

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
@Table(name = "ITEM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Item.findAll", query = "SELECT i FROM Customer_account i"),
    @NamedQuery(name = "Item.findByID", query = "SELECT i FROM Customer_account i WHERE i.user_name = :user_name"),})

public class Customer_Account implements Serializable {

    @Id
    @Basic(optional = false)
    @NotNull
    @Size(max = 30)
    @Column(name = "USER_NAME")
    private String code;
    @Size(max = 30)
    @Column(name = "PASSSWORD")
    private String description;
    private String user_name;
    private String password;

    public Customer_Account() {
    }

    public Customer_Account(String user_name, String pssword) {
        this.user_name = user_name;
        this.password = password;
    }

    //setter
    public void setUserName(String user_name) {
        this.user_name = user_name;
    }

    public void setPassword(String psw) {
        this.password = psw;
    }

    //getter
    public String getUserName() {
        return this.user_name;
    }

    public String getPassword() {
        return this.user_name;
    }

    @Override
    public String toString() {
        return "controller.Item[ userid=" + user_name + " ]";
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
}
