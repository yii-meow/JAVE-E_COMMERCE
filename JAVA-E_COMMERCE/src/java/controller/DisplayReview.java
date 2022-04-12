package controller;

import entity.Review;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DisplayReview extends HttpServlet{
   
   @PersistenceContext
   private EntityManager em;
   
   protected void checkReview (HttpServletRequest request, HttpServletResponse response) 
           throws ServletException, IOException {
      try{
         HttpSession session = request.getSession();
        Query query = em.createNamedQuery("Review.findAll");
        List<Review> reviewList =query.getResultList();
        session.setAttribute("reviewList", reviewList);
        response.sendRedirect("staff/CheckReview.jsp");
        int customerId = Integer.parseInt(request.getParameter("customerId"));
         session.setAttribute("customerList", customerId);
        
        
      }catch(Exception ex){
         
      }
   }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        checkReview(request, response);
    }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         checkReview(request, response);
    }
}
