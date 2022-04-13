/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

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
public class DeleteStaff extends HttpServlet {

    @Resource
    UserTransaction utx;

    @PersistenceContext
    EntityManager em;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processDelete(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processDelete(request, response);
    }

    protected void processDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String confirm = request.getParameter("confirm");
        String confirmMsg = request.getParameter("confirmMsg");
        String staffId = request.getParameter("staffId");

        String submitType = request.getParameter("submit");
        boolean result = false;

        HttpSession session = request.getSession();

        //Confirm Button is Clicked
        if (submitType.equals("Confirm")) {

            // Confirm Message is Match
            if (confirmMsg.equals(confirm)) {
                StaffService service = new StaffService(em);
                //Delete Action
                try {
                    utx.begin();
                    result = service.deleteStaff(staffId);
                    utx.commit();
                    session.setAttribute("result", result);
                } catch (Exception e) {

                }

            } else {
                // Confirm Message is Not Match
                session.setAttribute("result", result);
            }

            response.sendRedirect("manager/DeleteStaffResult.jsp");
        } else {
            //Cancel Button is Clicked
            response.sendRedirect("RetrieveRecord");
        }
    }

}
