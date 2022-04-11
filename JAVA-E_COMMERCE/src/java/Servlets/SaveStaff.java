/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import Domain.StaffService;
import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author jensienwong
 */
public class SaveStaff extends HttpServlet {

    @PersistenceContext()
    EntityManager em;

    @Resource
    UserTransaction utx;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addStaff(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addStaff(request, response);
    }

    protected void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String submitType = request.getParameter("submitType");

        if (submitType.equals("Confirm")) {
            //Confirm Button is Clicked
            try {
                HttpSession session = request.getSession();
                Staff staff = (Staff) session.getAttribute("newStaff");

                //Set Staff Password
                staff.setStaffPassword((String) session.getAttribute("password"));

                StaffService services = new StaffService(em);
                utx.begin();
                boolean result = services.addStaff(staff);
                utx.commit();

                if (result) {
                    //Add Successful
                    response.sendRedirect("RetrieveRecord");
                } else {
                    //Add Not Successful
                    out.println("Error : Adding Staff Incomplete");
                }
            } catch (Exception e) {
                out.println("Error : Exception Happen in SaveStaff.java ");
            }

        } else {
            //Back Button is Clicked
            response.sendRedirect("staff/SetUpPassword.jsp");
        }

    }

}
