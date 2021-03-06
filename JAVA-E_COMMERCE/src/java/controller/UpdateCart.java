/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author sohyz
 */
import entity.Product;
import entity.ProductService;
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
import entity.Shoppingcart2;
import entity.Shoppingcart2Service;

public class UpdateCart extends HttpServlet {

    @PersistenceContext

    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String test = "test";
            Shoppingcart2Service itemService = new Shoppingcart2Service(em);
            ProductService productService = new ProductService(em);

            HttpSession session = request.getSession();
            int ProdID = Integer.parseInt(request.getParameter("productID"));
            int CusID = (int)session.getAttribute("customerID");
            int Quantity = Integer.parseInt(request.getParameter("quantity"));
            int CartID = Integer.parseInt(request.getParameter("cartID"));
            
            Product product= productService.findItemByID(ProdID);

            Shoppingcart2 shoppingcart = new Shoppingcart2(CartID, product, CusID, Quantity);
            utx.begin();
            boolean success = itemService.updateShoppingcart(shoppingcart);
            utx.commit();

            List<Shoppingcart2> itemList = itemService.findAll((int)session.getAttribute("customerID"));
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
