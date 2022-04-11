/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import Domain.OrderListService;
import Domain.OrderService;
import entity.OrderList;
import entity.Orders;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import static java.util.concurrent.TimeUnit.DAYS;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.Order;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jensienwong
 */
public class GenerateReport extends HttpServlet {

    @PersistenceContext()
    EntityManager em;

    private Query query;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processReport(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processReport(request, response);
    }

    protected void processReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submitType = request.getParameter("submitType");
        //Report 1
        if (submitType.equals("MostPopularCategories")) {
            popularProductReport(request, response);
        } else if (submitType.equals("SalesReport")) {
//            secondReport(request, response);
            response.sendRedirect("staff/SelectDateRange.jsp");
        }
//
//        if (submitType.equals("MostPopularProduct")) {
//
//        }
    }

    protected void popularProductReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        OrderListService olService = new OrderListService(em);
        List<OrderList> ol = olService.retrieveOrderListOrderByProdId();

        query = em.createNamedQuery("Product.findAll");
        List<Product> prod = query.getResultList();

        int[] prodId = new int[prod.size()];
        int[] prodQuantity = new int[prod.size()];
        String[] prodName = new String[prod.size()];
        int totalQuantity = 0;

        for (int a = 0; a < prod.size(); a++) {
            prodId[a] = prod.get(a).getProductId();
            prodName[a] = prod.get(a).getProductName();
            prodQuantity[a] = 0;
        }

        for (int a = 0; a < ol.size(); a++) {
            for (int b = 0; b < prod.size(); b++) {
                if (ol.get(a).getProduct().getProductId() == prodId[b]) {
                    prodQuantity[b] += ol.get(a).getQuantity();
                    totalQuantity += ol.get(a).getQuantity();
                }
            }
        }

        int values = 0;
        for (int a = 0; a < prod.size(); a++) {
            if (prodQuantity[a] != 0) {
                values++;
            }
        }

//SORTING
        for (int i = 0; i < prodQuantity.length; i++) {
            for (int j = i + 1; j < prodQuantity.length; j++) {
                int tmpProdQuantity = 0;
                String tmpProdName = "";
                if (prodQuantity[i] < prodQuantity[j]) {
                    tmpProdQuantity = prodQuantity[i];
                    prodQuantity[i] = prodQuantity[j];
                    prodQuantity[j] = tmpProdQuantity;

                    tmpProdName = prodName[i];
                    prodName[i] = prodName[j];
                    prodName[j] = tmpProdName;

                }
            }
        }

        double percentage;
        ArrayList<String> prodNameArray = new ArrayList<String>();
        ArrayList<String> prodPercentagesArray = new ArrayList<String>();
        ArrayList<String> displayProdNameArray = new ArrayList<String>();
        ArrayList<String> displayProdPercentagesArray = new ArrayList<String>();
        ArrayList<Integer> displayQuantity = new ArrayList<Integer>();

        for (int a = 0; a < prod.size(); a++) {
            if (prodQuantity[a] != 0) {
                percentage = Double.valueOf(prodQuantity[a]) / totalQuantity * 100.0;

                prodNameArray.add("\'" + prodName[a] + "\'");
                prodPercentagesArray.add(String.format("\'%.2f\'", percentage));
                displayProdNameArray.add(prodName[a]);
                displayProdPercentagesArray.add(String.format("%.2f", percentage));
                displayQuantity.add(prodQuantity[a]);
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("prodArray", prodNameArray);
        session.setAttribute("prodPercentagesArray", prodPercentagesArray);
        session.setAttribute("displayProdArray", displayProdNameArray);
        session.setAttribute("displayProdPercentagesArray", displayProdPercentagesArray);
        session.setAttribute("displayQuantity", displayQuantity);

        response.sendRedirect("staff/Report1.jsp");
    }

    protected void secondReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
