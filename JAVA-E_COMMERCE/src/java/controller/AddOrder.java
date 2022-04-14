/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author sohyz
 */
import entity.Customer;
import entity.OrderList;
import entity.OrderListPK;
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
import java.util.ArrayList;
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
            Shoppingcart2Service cartService = new Shoppingcart2Service(em);
            ProductService productService = new ProductService(em);
            OrderListService orderListService = new OrderListService(em);
            int id = 0;

            HttpSession session = request.getSession();

            String DeliveryCourier = (String) session.getAttribute("DeliveryCourier");
            int customerID = (int) session.getAttribute("customerID");
            List<Shoppingcart2> itemList = (List) session.getAttribute("cartList");
            double subtotal = (Double) session.getAttribute("DiscountPrice");
            double dicountRate = (Double) session.getAttribute("DiscountRate");
            List<OrderList> orderListList = new ArrayList<>();
            System.out.println(request.getParameter("DeliveryCourier"));
            Customer customer = (Customer) session.getAttribute("Customer");
            utx.begin();
            Orders order = new Orders();
            order.setCustomerID(customer);
            em.persist(order);
            utx.commit();

            for (Shoppingcart2 item : itemList) {

                OrderListPK orderlistPK = new OrderListPK(order.getOrderId(), item.getProductId().getProductId());
                OrderList orderList
                        = new OrderList(orderlistPK, item.getQuantity() * item.getProductId().getPrice() * dicountRate, productService.findItemByID(item.getProductId().getProductId()), item.getQuantity());
                orderListList.add(orderList);
                utx.begin();
                boolean isSucess = orderListService.addOrders(orderList);
                cartService.deleteItem(item.getCartId());
                productService.updateProduct(item.getProductId().getProductId(), item.getQuantity());
                utx.commit();
            }
            utx.begin();
            boolean isUpdateSucess = itemService.updateOrders(order, orderListList, DeliveryCourier, customerID);
            utx.commit();

            System.out.println("hello");

            response.sendRedirect("../customer/orderedItem.jsp");
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
