/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

import entity.Staff;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author jensienwong
 */
public class StaffService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    private String errMsg;

    public StaffService() {
    }

    public StaffService(EntityManager mgr) {
        this.mgr = mgr;
    }

//Add    
    public boolean addStaff(Staff staff) {
        mgr.persist(staff);
        return true;
    }

//Retrieve
    public Staff viewStaff(String staffId) {
        Staff staff = mgr.find(Staff.class, staffId);
        return staff;
    }

//Retrieve All Result
    //Retrieve Default
    public List<Staff> retrieveAllStaff() {
        query = mgr.createNamedQuery("Staff.findAll");
        return query.getResultList();
    }

    //Retrieve By StaffId
    public List<Staff> retrieveAllStaffById(String id) {
        query = mgr.createNamedQuery("Staff.findByStaffID").setParameter("staffID", id);
        return query.getResultList();
    }

    //Retrieve By StaffName
    public List<Staff> retrieveAllStaffByName(String name) {
        query = mgr.createNamedQuery("Staff.findByStaffName").setParameter("staffName", name);
        return query.getResultList();
    }

    //Retrieve By StaffPosition
    public List<Staff> retrieveAllStaffByPosition(char position) {
        query = mgr.createNamedQuery("Staff.findByPosition").setParameter("position", position);
        return query.getResultList();
    }

//Update
    public boolean editStaff(Staff editStaff) {
        Staff currentStaff = viewStaff(editStaff.getStaffID());
        if (currentStaff != null) {
            currentStaff = editStaff;
            mgr.merge(currentStaff);
            return true;
        } else {
            return false;
        }
    }

//Delete
    public boolean deleteStaff(String staffId) {
        Staff staff = viewStaff(staffId);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        } else {
            return false;
        }
    }

// Validation 
    public boolean staffInfoValidation(String fullName, String ic, String email, String phoneNumber) {
        errMsg = "";
        boolean result = true;

        if (!validateName(fullName)) {
            result = false;
        }
        if (!validateIc(ic)) {
            result = false;
        }
        if (!validateEmail(email)) {
            result = false;
        }
        if (!validatePhoneNumber(phoneNumber)) {
            result = false;
        }

        return result;
    }

    public boolean staffInfoValidation(String firstName, String lastName, String ic, String email, String phoneNumber) {
        errMsg = "";
        boolean result = true;

        if (!validateName(firstName, lastName)) {
            result = false;
        }
        if (!validateIc(ic)) {
            result = false;
        }
        if (!validateEmail(email)) {
            result = false;
        }
        if (!validatePhoneNumber(phoneNumber)) {
            result = false;
        }

        return result;
    }

    public boolean validateName(String fullName) {
        boolean result = true;

        if (fullName.isEmpty() || fullName.equals(null)) {
            errMsg += "Staff Info Exception : <b>Name</b> cannot be empty<br>";
            result = false;
        }

        return result;
    }

    public boolean validateName(String firstName, String lastName) {
        boolean result = true;

        if (firstName.isEmpty() || firstName.equals(null)) {
            errMsg += "Staff Info Exception : <b>First Name</b> cannot be empty<br>";
            result = false;
        }

        if (lastName.isEmpty() || lastName.equals(null)) {
            errMsg += "Staff Info Exception : <b>Last Name</b> cannot be empty<br>";
            result = false;
        }

        return result;
    }

    public boolean validateIc(String ic) {
        boolean result = true;
        char ch;

        if (ic.isEmpty() || ic.equals(null)) {
            errMsg += "Staff Info Exception : <b>IC Number</b> cannot be empty<br>";
        }

        if (ic.length() != 14) {
            result = false;
        }

        for (int a = 0; a < ic.length(); a++) {
            ch = ic.charAt(a);
            //Check is Alphabet
            if (Character.isAlphabetic(ch) || result == false) {
                result = false;
            }
            if (a == 6 || a == 9) {
                if (ic.charAt(a) != '-') {
                    result = false;
                }
            }
        }

        if (!result) {
            errMsg += "Staff Info Exception : <b>IC Number</b> is invalid<br>";
        }

        return result;
    }

    public boolean validateEmail(String email) {
        boolean result = true;

        if (email.isEmpty() || email.equals(null)) {
            errMsg += "Staff Info Exception : <b>Email</b> cannot be empty<br>";
            result = false;
        }

        return result;
    }

    public boolean validatePhoneNumber(String phoneNumber) {
        boolean result = true;

        if (phoneNumber.length() != 12 && phoneNumber.length() != 11) {
            result = false;
        }

        if (phoneNumber.length() >= 12 && phoneNumber.charAt(3) != '-' || result == false) {
            errMsg += "Staff Info Exception : <b>Contact Number</b> is invalid<br>";
            result = false;
        }

        return result;
    }

    public String getErrMsg() {
        return errMsg;
    }

}
