/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.OrderListService;
import entity.OrderList;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jensienwong
 */
public class GenerateSalesReport extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processReport(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processReport(request, response);
    }

    protected void processReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
      
        try {
            // DEFINE TIME RANGE FOR THE ORDERS
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            end_date += " 23:59:59";

            Date start_time = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
            Date end_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(end_date);

            // TIME VALIDATION
            if (start_time.after(end_time)) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Starting date cannot be greater than ending date!');");
                out.println("window.history.go(-1);</script>");
                return;
            }

            // FIND ORDER IN TIME RANGE PROVIDED
            Query findAllOrdersInTimeRange = em.createNamedQuery("Orders.findOrderInTimeRangeASC").setParameter("startTime", start_time).setParameter("endTime", end_time);

            if (!findAllOrdersInTimeRange.getResultList().isEmpty()) {
                List<Orders> orderInRange = findAllOrdersInTimeRange.getResultList();

                // GET DATE VALUES
                ArrayList<String> date = new ArrayList<String>();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                for (int a = 0; a < orderInRange.size(); a++) {
                    date.add(dateFormat.format(orderInRange.get(a).getOrderTime()));
                }
                //remove duplicate element
                Set<String> s = new LinkedHashSet<String>(date);
                date = new ArrayList<String>(s);// GET LIST DATE

                Double[] subtotal = new Double[date.size()];
                OrderListService olService = new OrderListService(em);
                for (int a = 0; a < subtotal.length; a++) {
                    subtotal[a] = 0.0;
                }
                for (int a = 0; a < orderInRange.size(); a++) {
                    List<OrderList> orderList = olService.retrieveOrderListByOrderId(orderInRange.get(a).getOrderId());
                    for (int b = 0; b < orderList.size(); b++) {
                        if (orderList.get(b).getOrders().getOrderId() == orderInRange.get(a).getOrderId()) {
                            //If in the same day
                            for (int c = 0; c < date.size(); c++) {
                                if (date.get(c).equals(dateFormat.format(orderList.get(b).getOrders().getOrderTime()))) {
                                    subtotal[c] += orderList.get(b).getSubtotal();
                                }
                            }

                        }
                    }
                }

                ArrayList<Double> subTotalAL = new ArrayList<Double>();
                for (int a = 0; a < subtotal.length; a++) {
                    subTotalAL.add(subtotal[a]);
                }

                for (int a = 0; a < date.size(); a++) {
                    String str = "\'" + date.get(a) + "\'";
                    date.set(a, str);
                }
                Date[] dateRange = new Date[2];
                dateRange[0] = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
                dateRange[1] = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);

                session.setAttribute("starAndEndDate", dateRange);
                session.setAttribute("dateRange", date);// DATA RANGE
                session.setAttribute("subtotal", subTotalAL);//NUMBER OF DATE
                response.sendRedirect("staff/Report2.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('no result found!!');");
                out.println("window.history.go(-1);</script>");
            }

        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    }
}
