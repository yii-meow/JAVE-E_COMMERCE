/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import Domain.OrderListService;
import entity.OrderList;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
            secondReport(request, response);
        }
//
//        if (submitType.equals("MostPopularProduct")) {
//
//        }
    }

    protected void popularProductReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OrderListService olService = new OrderListService(em);
        query = em.createNamedQuery("Product.findAll");

        List<Product> prod = query.getResultList();
        List<OrderList> ol = olService.retrieveOrderListOrderByProdId();

        int[] prodId = new int[prod.size()];
        int[] prodQuantity = new int[prod.size()];
        String[] prodName = new String[prod.size()];

        for (int a = 0; a < prod.size(); a++) {
            prodId[a] = prod.get(a).getProductId();
            prodName[a] = prod.get(a).getProductName();
            prodQuantity[a] = 0;
        }

        for (int a = 0; a < ol.size(); a++) {
            for (int b = 0; b < prod.size(); b++) {
                if (ol.get(a).getProduct().getProductId() == prodId[b]) {
                    prodQuantity[b] += ol.get(a).getQuantity();
                }
            }
        }

        ArrayList<String> prodNameArray = new ArrayList<String>();
        ArrayList<Integer> prodQuantityArray = new ArrayList<Integer>();
        for (int a = 0; a < prod.size(); a++) {
            prodNameArray.add("\'" + prodName[a] + "\'");
            prodQuantityArray.add(prodQuantity[a]);
        }

        HttpSession session = request.getSession();
        session.setAttribute("prodArray", prodNameArray);
        session.setAttribute("prodQuantity", prodQuantityArray);

        response.sendRedirect("staff/Report1.jsp");
    }

    protected void secondReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        out.println("HERE");

    }

}
