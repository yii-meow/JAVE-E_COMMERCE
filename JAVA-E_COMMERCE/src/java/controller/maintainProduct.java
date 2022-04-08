/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Product;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author yikso
 */
@WebServlet(name = "maintainProduct", urlPatterns = {"/maintainProduct"})
public class maintainProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

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

            // DELETE PRODUCT
            if (request.getParameter("action").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("delete_item"));

                try {
                    utx.begin();
                    Product product = em.find(Product.class, id);
                    em.remove(product);
                    utx.commit();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Deleted Successfully!');</script>");
                    response.sendRedirect(request.getContextPath() + "/staff/maintainProduct.jsp");

                } catch (Exception ex) {

                }
            } // CREATE OR UPDATE PRODUCT
            else if (request.getParameter("action").equals("create") || request.getParameter("action").equals("update")) {
                String product_name = request.getParameter("product_name");
                String product_description = request.getParameter("product_description");
                int stock = Integer.parseInt(request.getParameter("stock"));
                double price = Double.parseDouble(request.getParameter("price"));
                double weight = Double.parseDouble(request.getParameter("weight"));
                String product_image = request.getParameter("product_image");

                String value = request.getParameter("shipment") + "";
                boolean free_shipment = false;
                if (value.equals("free_shipment")) {
                    free_shipment = true;
                }

                if (request.getParameter("action").equals("create")) {
                    try {
                        utx.begin();
                        Product product = new Product(product_name, product_description, stock, price, weight, product_image, free_shipment);
                        em.persist(product);
                        utx.commit();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Created Successfully!');</script>");
                        response.sendRedirect(request.getContextPath() + "/staff/maintainProduct.jsp");
                    } catch (Exception ex) {
                        out.println(ex.getMessage());
                    }
                } else {
                    int id = Integer.parseInt(request.getParameter("product_id"));
                    out.print(id);

                    try {
                        utx.begin();
                        Product product = em.find(Product.class, id);
                        product.setProductName(product_name);
                        product.setProductDescription(product_description);
                        product.setStock(stock);
                        product.setPrice(price);
                        product.setProductWeight(weight);
                        product.setProductImage(product_image);
                        product.setIsShipmentFree(free_shipment);
                        response.sendRedirect(request.getContextPath() + "/staff/maintainProduct.jsp");

                        utx.commit();
                    } catch (Exception ex) {

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
        HttpSession session = request.getSession();
        Query query = em.createNamedQuery("Product.findAll");
        List<Product> product = query.getResultList();
        session.setAttribute("product", product);
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

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
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
