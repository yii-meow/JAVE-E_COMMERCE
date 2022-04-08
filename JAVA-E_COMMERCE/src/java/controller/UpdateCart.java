/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author sohyz
 */
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import entity.Shoppingcart;
import entity.ShoppingcartService;

public class UpdateCart extends HttpServlet {

    @PersistenceContext

    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String test = "test";
            ShoppingcartService itemService = new ShoppingcartService(em);

            HttpSession session = request.getSession();
            int ProdID = Integer.parseInt(request.getParameter("productID"));
            int CusID = Integer.parseInt(request.getParameter("customerID"));
            int Quantity = Integer.parseInt(request.getParameter("quantity"));
            int CartID = Integer.parseInt(request.getParameter("cartID"));

            Shoppingcart shoppingcart = new Shoppingcart(CartID, ProdID, CusID, Quantity);
            utx.begin();
            boolean success = itemService.updateShoppingcart(shoppingcart);
            utx.commit();

            List<Shoppingcart> itemList = itemService.findAll();
            session.setAttribute("cartList", itemList);

            response.sendRedirect("customer/shoppingCart.jsp");
        } catch (Exception ex) {
            System.out.println("hello");
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
