/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author sohyz
 */
import entity.OrderList;
import entity.OrderListPK;
import entity.OrderListService;
import entity.Orders;
import entity.OrdersService;
import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import entity.ProductService;
import entity.Shoppingcart2;
import entity.Shoppingcart2Service;
import entity.VoucherService;
import java.util.List;

public class AddOrder extends HttpServlet {

    @PersistenceContext

    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String test = "test";
            OrdersService itemService = new OrdersService(em);
            ProductService productService = new ProductService(em);
            OrderListService orderListService = new OrderListService(em);
            int id = 0;

            HttpSession session = request.getSession();

            List<Shoppingcart2> itemList = (List) session.getAttribute("cartList");
            double subtotal = (Double) session.getAttribute("DiscountPrice");

            utx.begin();
            Orders order = new Orders();
            em.persist(order);
            utx.commit();

            for (Shoppingcart2 item : itemList) {

                OrderListPK orderlistPK = new OrderListPK(order.getOrderId(), item.getProductId().getProductId());
                OrderList orderList
                        = new OrderList(orderlistPK, subtotal, productService.findItemByID(item.getProductId().getProductId()), item.getQuantity());
                utx.begin();
                boolean isSucess = orderListService.addOrders(orderList);
                utx.commit();

            }

//            List<Orders> orders = itemService.findAll();
//            for (Shoppingcart2 item : itemList) {
//                OrderListPK orderlistPK=new OrderListPK(order.getOrderId(), item.getProductId().getProductId());
//                OrderList orderList
//                        = new OrderList(orderlistPK, subtotal, productService.findItemByID(item.getProductId().getProductId()), item.getQuantity());
//                
//                boolean isSucess=orderListService.updateShoppingcart(orderList,orderlistPK);
//                utx.commit();
//
//            }
            System.out.println("hello");

            response.sendRedirect("../customer/ConfirmPurchase.jsp");
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
