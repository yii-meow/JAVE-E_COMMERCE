/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

import java.util.Objects;

/**
 *
 * @author sohyz
 */
public class Customer {

    private String userName;
    private String orderNumber;
    private String orderDetails;
    private String orderDestination;
    private String time;
    private String status;
    private String orderID;

//CONSTRUCTOR
    public Customer() {
    }

    public Customer(String userName, String orderNumber, String orderDetails, String orderDestination, String time, String status, String orderID) {
        this.userName = userName;
        this.orderNumber = orderNumber;
        this.orderDetails = orderDetails;
        this.orderDestination = orderDestination;
        this.time = time;
        this.status = status;
        this.orderID = orderID;
    }

//GETTER
    public String getUserName() {
        return userName;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public String getOrderDetails() {
        return orderDetails;
    }

    public String getOrderDestination() {
        return orderDestination;
    }

    public String getTime() {
        return time;
    }

    public String getStatus() {
        return status;
    }

//SETTER
    public String setUserName(String userName) {
        return this.userName = userName;
    }

    public String setorderID(String userName) {
        return this.userName = orderID;
    }

    public String setOrderNumber(String orderNumber) {
        return this.orderNumber = orderNumber;
    }

    public String setOrderDetails(String orderDetails) {
        return this.orderDetails = orderDetails;
    }

    public String setOrderDestination(String orderDestination) {
        return this.orderDestination = orderDestination;
    }

    public String setTime(String time) {
        return this.time = time;
    }

    public String setStatus(String status) {
        return this.status = status;
    }

    public String setOrderID(String orderID) {
        return this.orderID = orderID;
    }

    public String toString() {
        return String.format("%-20s     %-14s     %-3s     %-11s     %-30s     %-50s  %-10s", orderID, userName, orderNumber,
                orderDetails, orderDestination, status, time);
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        return true;
    }

}
