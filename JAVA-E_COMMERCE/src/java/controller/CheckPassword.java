/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.Password;
import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jensienwong
 */
public class CheckPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processPassword(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processPassword(request, response);
    }

    protected void processPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String webSite = request.getParameter("webSite");
        HttpSession session = request.getSession();

        if (webSite.equals("EditPassword.jsp")) {

            String submitType = request.getParameter("submitType");

            if (submitType.equals("Back")) {

                response.sendRedirect("EditStaff");
            }

            if (submitType.equals("Submit")) {
                String oldPassword = request.getParameter("oldPassword");
                String password = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");
                Password psw = new Password();
                // Get Staff Password
                Staff staff = (Staff) session.getAttribute("editPassword");

                if (psw.checkEmpty(oldPassword) || psw.checkEmpty(confirmPassword) || psw.checkEmpty(password)) {
                    session.setAttribute("passwordErrorMessage", "Invalid Password Exception : Please Fill in all the input field<br>");
                    session.setAttribute("webSite", "staff/EditPassword.jsp");
                    response.sendRedirect("staff/SetUpPasswordResult.jsp");
                } else {
                    psw = new Password(staff.getStaffPassword(), oldPassword, password, confirmPassword);
                    if (psw.checkOldPassword()) {
                        //Mathch
                        if (psw.passwordCheck()) {
                            //Valid Password
//                            session.setAttribute("newPassword", psw.getPassword());
                            staff.setStaffPassword(password);
                            session.setAttribute("editStaff", staff);

                            response.sendRedirect("staff/EditStaff.jsp");
                        } else {
                            //Invalid Password
                            session.setAttribute("passwordErrorMessage", psw.getErrorMessage());
                            session.setAttribute("webSite", "staff/EditPassword.jsp");
                            response.sendRedirect("staff/SetUpPasswordResult.jsp");
                        }
                    } else {
                        //Not Match
                        session.setAttribute("passwordErrorMessage", psw.getErrorMessage());
                        session.setAttribute("webSite", "staff/EditPassword.jsp");
                        response.sendRedirect("staff/SetUpPasswordResult.jsp");
                    }

                }

            }
        }

        if (webSite.equals("SetUpPassword.jsp")) {
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            Password psw = new Password(password, confirmPassword);

            if (psw.passwordCheck()) {
                //Valid Password
                session.setAttribute("password", psw.getPassword());
                response.sendRedirect("staff/ConfirmStaffInfo.jsp");
            } else {
                //Invalid Password
                session.setAttribute("passwordErrorMessage", psw.getErrorMessage());
                session.setAttribute("webSite", "staff/SetUpPassword.jsp");
                response.sendRedirect("SetUpPasswordResult.jsp");
            }
        }

    }
}
