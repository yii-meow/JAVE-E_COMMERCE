/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Staff;
import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jensienwong
 */
public class StaffLogin extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processLogin(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processLogin(request, response);
    }

    //Login Process
    protected void processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StaffService service = new StaffService(em);

        //Retrieve Value
        String staffId = request.getParameter("staffId");
        String staffPsw = request.getParameter("staffPassword");

        Staff staff = null;
        //Retrieve Staff Value From Data Bases
        staff = service.viewStaff(staffId);

        if (staff == null || !(staffPsw.equals(staff.getStaffPassword()))) {
            //If password Incorrect or ID is not found
            response.sendRedirect("staff/LoginFaield.html");
        } else {
            //If password correct

            //Set Session
            HttpSession session = request.getSession();
            session.setAttribute("loginStaff", staff);
            
            response.sendRedirect("staff/ManagerHomePage.jsp");
        }
    }

}
