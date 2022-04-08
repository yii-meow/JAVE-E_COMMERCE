/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Product;
import java.util.List;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yikso
 */
// NORMAL FILTER FOR PRODUCT (NAME AND ID)
@WebServlet(name = "filterProduct", urlPatterns = {"/filterProduct"})
public class filterProduct extends HttpServlet {

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
            HttpSession session = request.getSession();
            String item_name = request.getParameter("item_details");
            Query query;

            if (request.getParameter("filterOption").equals("name")) {
                if (item_name.equals("")) {
                    query = em.createNamedQuery("Product.findAll");
                    List<Product> product = query.getResultList();
                    session.setAttribute("product", product);
                    response.sendRedirect("customer/viewProduct.jsp");
                } else {

                    query = em.createNamedQuery("Product.findByProductName").setParameter("productName", item_name);
                    if (!query.getResultList().isEmpty()) {
                        List<Product> product = query.getResultList();
                        session.setAttribute("product", product);
                        response.sendRedirect("customer/viewProduct.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Deleted Successfully!');</script>");
                        out.println("No result found!");
                    }
                }
            } else {
                if (item_name.equals("")) {
                    query = em.createNamedQuery("Product.findAll");
                    List<Product> product = query.getResultList();
                    session.setAttribute("product", product);
                    response.sendRedirect("customer/viewProduct.jsp");
                } else {
                    query = em.createNamedQuery("Product.findByProductId").setParameter("productId", Integer.parseInt(item_name));

                    if (!query.getResultList().isEmpty()) {
                        List<Product> product = query.getResultList();
                        session.setAttribute("product", product);
                        response.sendRedirect("customer/viewProduct.jsp");
                    } else {
                        out.println("No result found!");
                    }
                }
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
