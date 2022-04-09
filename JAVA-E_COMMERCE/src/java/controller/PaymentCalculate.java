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
import entity.Product;
import entity.ProductService;
import entity.Shoppingcart2;
import entity.Shoppingcart2Service;
import entity.Voucher;
import entity.VoucherService;

public class PaymentCalculate extends HttpServlet {

    @PersistenceContext

    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String test = "test";
            Shoppingcart2Service itemService = new Shoppingcart2Service(em);
            VoucherService voucherService = new VoucherService(em);
            ProductService productService = new ProductService(em);

            HttpSession session = request.getSession();

            List<Shoppingcart2> itemList = itemService.findAll();
            session.setAttribute("cartList", itemList);

            List<Voucher> voucherList = voucherService.findAll();
            session.setAttribute("voucherList", voucherList);

            List<Product> productList = productService.findAll();
            session.setAttribute("productList", productList);
             
            double price = 0;
            int index = 0;
            double ori[] = new double[itemList.size()];

            for (Shoppingcart2 item : itemList) {
                price += item.getQuantity() * item.getProductId().getPrice();
                ori[index] = item.getQuantity() * item.getProductId().getPrice();
                index++;
            }

            session.setAttribute("totalPrice", price);
            session.setAttribute("oriprice", ori);

            System.out.println("hello");

            response.sendRedirect("../customer/RewiewPayment.jsp");
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
