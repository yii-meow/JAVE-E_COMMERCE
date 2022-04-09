/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yikso
 */
// ADVANCE FILTER FOR PRODUCT
@WebServlet(name = "advanceFilterProduct", urlPatterns = {"/advanceFilterProduct"})
public class advanceFilterProduct extends HttpServlet {

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
            double min_price = 0;
            double max_price = 0;
            boolean free = false;
            String value = request.getParameter("shipment") + "";

            // CHECK IF FREE SHIPMENT MARKED BY USER
            if (value.equals("free_shipment")) {
                free = true;
            }

            // SET MINIMUM PRICE FILTER
            if (!request.getParameter("min_price").isEmpty()) {
                min_price = Double.parseDouble(request.getParameter("min_price"));
            } else {
                min_price = 0;
            }

            // SET MAXIMUM PRICE FILTER
            if (!request.getParameter("max_price").isEmpty()) {
                max_price = Double.parseDouble(request.getParameter("max_price"));
            } else {
                // RETRIEVE MAX PRICE FROM ENTITY NAMED QUERY (MAX)
                Query query = em.createNamedQuery("Product.findMaxPrice");
                List<Double> price = query.getResultList();
                max_price = price.get(0);
            }
            Query query = em.createNamedQuery("Product.findByPriceAndShipment").setParameter("min_price", min_price).setParameter("max_price", max_price).setParameter("shipment", free);
            List<Product> product = query.getResultList();
            
            if (!product.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("product", product);
                response.sendRedirect("customer/findFilteredProduct.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('No product found!');");
                out.println("window.history.go(-1);</script>");
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
