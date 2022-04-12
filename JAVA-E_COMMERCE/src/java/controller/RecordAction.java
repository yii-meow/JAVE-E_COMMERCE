/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Staff;
import java.io.IOException;
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
public class RecordAction extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Resource
    UserTransaction utx;
    StaffService service;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        recordAction(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        recordAction(request, response);
    }

    protected void recordAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service = new StaffService(em);
        
        //Add Staff
        if (request.getParameter("addStaffId") != null) {
            addRecord(request, response);
        }

        //Select View Record Action
        if (request.getParameter("viewStaffId") != null) {
            viewRecord(request, response, request.getParameter("viewStaffId"));
        }

        //Select Edit Record Action
        if (request.getParameter("editStaffId") != null) {
            editRecord(request, response, request.getParameter("editStaffId"));
        }

        //Select Delete Record Action
        if (request.getParameter("deleteStaffId") != null) {
            deleteRecord(request, response, request.getParameter("deleteStaffId"));
        }
    }

    protected void addRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Clear Previous Session
        HttpSession session = request.getSession();

        session.removeAttribute("firstName");
        session.removeAttribute("lastName");
        session.removeAttribute("newStaff");
        Staff staff = new Staff("", "", "", "", "", "", 'S');
        session.setAttribute("firstName", "");
        session.setAttribute("lastName", "");
        session.setAttribute("newStaff", staff);

        response.sendRedirect("manager/AddStaff.jsp");
    }

    protected void viewRecord(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Staff staff = service.viewStaff(id);

        HttpSession session = request.getSession();
        session.setAttribute("viewStaff", staff);
        response.sendRedirect("manager/RetrieveStaff.jsp");
    }

    protected void editRecord(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Staff staff = service.viewStaff(id);

        HttpSession session = request.getSession();
        session.setAttribute("editStaff", staff);
        response.sendRedirect("manager/EditStaff.jsp");
    }

    protected void deleteRecord(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Staff staff = service.viewStaff(id);

        HttpSession session = request.getSession();
        session.setAttribute("deleteStaff", staff);
        response.sendRedirect("manager/DeleteStaff.jsp");
    }

}
