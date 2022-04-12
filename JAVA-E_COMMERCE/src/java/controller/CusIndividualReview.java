/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Review;
import java.io.IOException;
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
public class CusIndividualReview extends HttpServlet{
   @PersistenceContext
   EntityManager em;
   
   protected void IndividualReview (HttpServletRequest request, HttpServletResponse response) 
           throws ServletException, IOException {
      try{
         
         
         HttpSession session = request.getSession();
         Query query = em.createNamedQuery("Review.findAll");
         List<Review> reviewList = query.getResultList();
         session.setAttribute("reviewList", reviewList);
         response.sendRedirect("customer/IndividualReview.jsp");
         
         
      }catch(Exception ex){
         
      }
      
   }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{
      IndividualReview(request, response);
   }
   
   protected void doPost (HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{
      IndividualReview(request, response);
   }
}
