/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.StaffService;
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
public class EditStaff extends HttpServlet {

    @Resource
    UserTransaction utx;

    @PersistenceContext
    EntityManager em;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        editStaff(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        editStaff(request, response);
    }

    protected void editStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String passwordStatus = (String) session.getAttribute("changePasswordStatus");

        if (passwordStatus.equals("false")) {

            String submitType = request.getParameter("submitType");

            if (submitType.equals("Change Password")) {
                Staff staff = (Staff) session.getAttribute("editStaff");
                //Start changePasswordStatus
                session.setAttribute("changePasswordStatus", "true");
                changePassword(request, response, staff);
            }

            if (submitType.equals("Update") || submitType.equals("Cancel")) {
                processUpdateCancel(request, response, submitType);
            }
        }

        if (passwordStatus.equals("true")) {
            response.sendRedirect("manager/EditStaff.jsp");
        }

    }

    protected void changePassword(HttpServletRequest request, HttpServletResponse response, Staff staff) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("editPassword", staff);

        response.sendRedirect("manager/EditPassword.jsp");
    }

    protected void processUpdateCancel(HttpServletRequest request, HttpServletResponse response, String submitType) throws ServletException, IOException {
        StaffService service = new StaffService(em);

        String staffId = request.getParameter("staffId");
        String staffName = request.getParameter("staffName");
        String staffIc = request.getParameter("staffIc");
        String staffEmail = request.getParameter("staffEmail");
        String staffPhoneNumber = request.getParameter("staffPhoneNumber");
        String staffPosition = request.getParameter("staffPosition");
        String staffDateJoin = request.getParameter("staffDateJoin");
        String staffPassword = request.getParameter("staffPassword");

        Staff staff = new Staff(staffId, staffPassword, staffName, staffIc, staffEmail, staffPhoneNumber, staffDateJoin, staffPosition.charAt(0));
        HttpSession session = request.getSession();
        //Click Update button
        if (submitType.equals("Update")) {
            boolean result = service.staffInfoValidation(staffName, staffIc, staffEmail, staffPhoneNumber);
            if (result) {
                try {

                    utx.begin();
                    result = service.editStaff(staff);
                    utx.commit();

                    session.setAttribute("editResult", result);
                    response.sendRedirect("manager/EditConfirm.jsp");

                } catch (Exception e) {

                }

            } else {
                session.setAttribute("errMsg", service.getErrMsg());
                session.setAttribute("webSite", "staff/EditStaff.jsp");
                response.sendRedirect("manager/StaffInfoException.jsp");
            }

        }

        if (submitType.equals("Cancel")) {
            //Click Cancel button
            response.sendRedirect("RetrieveRecord");
        }
    }

}
