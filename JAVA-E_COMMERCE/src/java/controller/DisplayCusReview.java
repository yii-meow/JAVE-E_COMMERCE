/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Customer;
import entity.Orders;
import entity.Product;
import entity.Review;
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
 * @author allenlai
 */
public class DisplayCusReview extends HttpServlet {

   //display for staff review in staff checkReview.jsp
   @PersistenceContext
   EntityManager em;

     protected void displayCusReview(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {

      PrintWriter out = response.getWriter();     
      try {

         HttpSession session = request.getSession();

         //get itemList from product
         Product itemList = (Product) session.getAttribute("detailsList");
//         //remember delete and use line 40 
//         Product itemList = new Product();
//         itemList.setProductId(5);

         Query query = em.createNamedQuery("Review.findAll");
         List<Review> reviewList = query.getResultList();
        
         Query cusQuery = em.createNamedQuery("Customer.findAll");
         List<Customer> customerList = cusQuery.getResultList();
         
         ArrayList<String> reviewComment = new ArrayList<String>();
         ArrayList<Integer> rating = new ArrayList<Integer>();
         ArrayList<String> customerName = new ArrayList<String>();
         //first get product id is foreign key from review
         //second get product id is review table get produdt ic
         for (int a = 0; a < reviewList.size(); a++) {
            if (reviewList.get(a).getProductId().getProductId() == itemList.getProductId()) {
               reviewComment.add(reviewList.get(a).getReviewComment());
               rating.add(reviewList.get(a).getRating());
//               out.println(reviewList.get(a).getReviewComment());//commeny
//               out.println(itemList.getProductId());//prod id
//               out.println(reviewList.get(a).getRating());//rating
               for (int b = 0; b < customerList.size(); b++) {
                  if (customerList.get(b).getCustomerID() == reviewList.get(a).getCustomerId()) {
                     customerName.add(customerList.get(b).getCustomerName());
                    // out.println(customerList.get(b).getCustomerName());   //get customer namee from customer
                  }
           
               }
            }
         }
         session.setAttribute("ReviewComment", reviewComment);
         session.setAttribute("rating", rating);
         session.setAttribute("customerName", customerName);

//
         response.sendRedirect("ProductDetails.jsp");
      } catch (Exception ex) {
         out.println(ex.getMessage());
      }
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {

      displayCusReview(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      displayCusReview(request, response);
   }

}
