/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Staff;
import java.io.IOException;
import java.util.List;
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
public class RetrieveRecord extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        retrieveRecord(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        retrieveRecord(request, response);
    }

    protected void retrieveRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StaffService service = new StaffService(em);
        List<Staff> staffList = service.retrieveAllStaff();

        HttpSession session = request.getSession();
        session.setAttribute("staffList", staffList);
        session.setAttribute("recordFrom", "RetrieveRecord");

        response.sendRedirect("manager/StaffCRUD.jsp");
    }

}
