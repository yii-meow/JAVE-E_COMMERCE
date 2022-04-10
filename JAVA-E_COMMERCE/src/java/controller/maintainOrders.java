/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
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
import entity.Orders;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yikso
 */
// ORDER
@WebServlet(name = "maintainOrders", urlPatterns = {"/maintainOrders"})
public class maintainOrders extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        if (request.getParameter("action").equals("update")) {
            String shipment_status = request.getParameter("shipment_status");
            try {
                HttpSession session = request.getSession();

                // SET SHIPMENT DETAILS BASED ON WHAT THE STAFF SELECT
                utx.begin();
                Orders order = em.find(Orders.class, Integer.parseInt(request.getParameter("order_ID")));
                order.setShipmentDetails(shipment_status);

                if (shipment_status.equals("Shipped")) {
                    // UPDATE SHIPMENT TIME WHEN THE SHIPMENT IS SHIPPED
                    order.setShipTime(new Date());
                }

                utx.commit();
                int id = order.getCustomerID().getCustomerID();

                Customer customer = em.find(Customer.class, id);
                List<Orders> orders = customer.getOrdersList();
                session.setAttribute("orders", orders);
                response.sendRedirect(request.getContextPath() + "/staff/viewCustomerPurchaseRecord.jsp");
            } catch (Exception ex) {
                out.print(ex.getMessage());
            }
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
    // RETRIEVE ORDER
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
