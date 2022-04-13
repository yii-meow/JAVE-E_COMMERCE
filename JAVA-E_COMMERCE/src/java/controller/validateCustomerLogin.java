/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

import entity.Customer;
import java.util.Arrays;
import static java.util.Collections.list;
import java.util.List;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yikso
 */
@WebServlet(name = "validateCustomerLogin", urlPatterns = {"/validateCustomerLogin"})
public class validateCustomerLogin extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet validateCustomerLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet validateCustomerLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // HASH PASSWORD FOR LATER MATCHING
        String hash = passwordHash.getHash(password);

        try {
            // RETRIEVE THE CUSTOMER USERNAME FROM DATABASE
            Query query = em.createNamedQuery("Customer.findByCustomerUsername").setParameter("customerUsername", username);

            // CHECK IF CUSTOMER RECORD EXIST
            if (!query.getResultList().isEmpty()) {
                List<Customer> customer = (List<Customer>) query.getResultList();

                // IF PASSWORD MATCH THEN REDIRECT TO CUSTOMER MAIN PAGE
                if (customer.get(0).getCustomerPassword().equals(hash)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("customer", customer);
                    response.sendRedirect("customer"); // CHANGE THIS TO CUSTOMER MAIN PAGE
                } else {
                    // REDIRECT BACK TO LOGIN PAGE IF PASSWORD DOESN'T MATCH                  
                    response.sendRedirect("customerLogin.html");
                }

            } else {
                // REDIRECT BACK TO LOGIN PAGE IF CUSTOMER RECORD DOESN'T EXIST
                response.sendRedirect("customerLogin.html");
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
