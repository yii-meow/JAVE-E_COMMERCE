package controller;

import entity.OrderList;
import entity.OrderListService;
import java.io.*;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import entity.Orders;
import entity.OrdersService;
import java.util.ArrayList;

public class ViewOrder extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            OrdersService itemService = new OrdersService(em);
            OrderListService OrderListService = new OrderListService(em);

            HttpSession session = request.getSession();
            List<Orders> itemList = itemService.findItemByID(7);
            int orderID[] = new int[itemList.size()];
            List<List<OrderList>> myOrderList = new ArrayList<>();
            int index = 0;

            for (Orders item : itemList) {

                orderID[index] = item.getOrderId();
                myOrderList.add(item.getOrderListList());

                index++;

            }

            session.setAttribute("ordersList", myOrderList);
            response.sendRedirect("orderedItem.jsp");
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
