/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.StaffService;
import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class Search extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    StaffService service;

    HttpSession session;

    private final String staffListSession = "staffList";
    private final String location = "staff/StaffCRUD.jsp";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        search(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        search(request, response);
    }

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        session = request.getSession();

        String searchBy = request.getParameter("SearchBy");
        String value = request.getParameter("search");
        service = new StaffService(em);

        List<Staff> staff = new ArrayList<Staff>();

        if (searchBy.equals("staffId")) {
            staff = service.retrieveAllStaffById(value);
        }

        if (searchBy.equals("staffName")) {
            staff = service.retrieveAllStaffByName(value);
        }

        if (searchBy.equals("staffPosition")) {
            staff = service.retrieveAllStaffByPosition(value.charAt(0));
        }

        if (searchBy.equals("staffId") || searchBy.equals("staffName") || searchBy.equals("staffPosition")) {
            session.setAttribute(staffListSession, staff);
            session.setAttribute("recordFrom", "Search");
            response.sendRedirect(location);
        }
    }
}
