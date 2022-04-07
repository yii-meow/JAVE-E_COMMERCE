/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.OrderList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import entity.Orders;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author yikso
 */
@WebServlet(name = "viewSalesRecord", urlPatterns = {"/viewSalesRecord"})
public class viewSalesRecord extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            // DEFINE TIME RANGE FOR THE ORDERS
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            end_date += " 23:59:59";

            Date start_time = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
            Date end_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(end_date);

            if (start_time.after(end_time)){
                response.sendRedirect("staff/viewSalesRecord.jsp");
            }
            
            Query findAllOrdersInTimeRange = em.createNamedQuery("OrderList.findOrderInTimeRange").setParameter("startTime", start_time).setParameter("endTime", end_time);

            if (!findAllOrdersInTimeRange.getResultList().isEmpty()) {
                HttpSession session = request.getSession();
                List<OrderList> orderlist = findAllOrdersInTimeRange.getResultList();
                session.setAttribute("order-list", orderlist);
                Query query = em.createNamedQuery("OrderList.findSubtotalByDateGroup").setParameter("startTime", start_time).setParameter("endTime", end_time);

                if (!query.getResultList().isEmpty()) {
                    List<Object[]> result = query.getResultList();
                    session.setAttribute("ordersGroup", result);
                    session.setAttribute("start_time", start_date);
                    session.setAttribute("end_time", end_date);
                    response.sendRedirect("staff/viewFilteredSalesRecord.jsp");
                } else {
                    response.sendRedirect("staff/viewFilteredSalesRecord.jsp");
                }
            } else {
                out.println("no result found!");
            }

        } catch (Exception ex) {
            out.println(ex.getMessage());
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
        // RETRIEVE ALL ORDER
        HttpSession session = request.getSession();
        Query query = em.createNamedQuery("Orders.findAll");
        List<Orders> orders = query.getResultList();
        session.setAttribute("orders", orders);

        // RETRIEVE ORDER GROUP BY PRODUCT ID
        Query query2 = em.createNamedQuery("OrderList.findSubtotalGroup");
        List<Object[]> ol = query2.getResultList();
        session.setAttribute("ordersGroup", ol);
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
