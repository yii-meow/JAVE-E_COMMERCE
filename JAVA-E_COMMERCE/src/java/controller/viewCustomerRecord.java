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
import entity.Orders;
import java.util.List;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yikso
 */
@WebServlet(name = "viewCustomerRecord", urlPatterns = {"/viewCustomerRecord"})
public class viewCustomerRecord extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    @Resource
    private UserTransaction utx;

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
            HttpSession session = request.getSession();
            int customer_ID = Integer.parseInt(request.getParameter("customer_ID"));
            Customer customer = em.find(Customer.class, customer_ID);
            List<Orders> orders = customer.getOrdersList();
            session.setAttribute("orders", orders);
            response.sendRedirect("staff/viewCustomerPurchaseRecord.jsp");
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
        PrintWriter out = response.getWriter();
        Query query = em.createNamedQuery("Customer.findAll");
        List<Customer> customer = query.getResultList();

        for (int i = 0; i < customer.size(); i++) {
            // TO CHECK WHICH CUSTOMER HAVE NO ORDER
            try {
                if (!customer.get(i).getOrdersList().get(0).getOrderId().equals("")) {
                }

            } catch (Exception ex) {
                customer.remove(i);
            }
        }
        HttpSession session = request.getSession();
        session.setAttribute("customer", customer);
        response.sendRedirect("staff/viewCustomerRecord.jsp");
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
        processRequest(request, response);
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
