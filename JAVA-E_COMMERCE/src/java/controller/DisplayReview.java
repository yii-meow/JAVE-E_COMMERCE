 package controller;

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

public class DisplayReview extends HttpServlet {

   //staff check customer review
   @PersistenceContext
   private EntityManager em;

   protected void checkReview(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      try {
         HttpSession session = request.getSession();
         Query query = em.createNamedQuery("Review.findAll");
         List<Review> reviewList = query.getResultList();

         //        int customerId = Integer.parseInt(request.getParameter("customerId"));
//         session.setAttribute("customerList", customerId); 
         for (int c = 0; c < reviewList.size(); c++) {
            for (int d = 0; d < reviewList.size(); d++) {
               Review tempoProductId = new Review();
              
               if (reviewList.get(c).getProductId().getProductId() < reviewList.get(d).getProductId().getProductId()) {
                  tempoProductId = reviewList.get(c);
                  reviewList.set(c, reviewList.get(d)); // reviewlist.get(c) = reviewlist.get(d)
                  reviewList.set(d, tempoProductId);

               }
            }
         }

         ArrayList<Integer> allRating = new ArrayList();
         ArrayList<String> ratingLabel = new ArrayList();

         for (int r = 1; r <= 5; r++) {
            ratingLabel.add("\"" + r + " star Label\"" );
            allRating.add(0);
         }

         for (int z = 0; z < reviewList.size(); z++) {

            switch (reviewList.get(z).getRating()) {
               case 1:
                  allRating.set(0, allRating.get(0) + 1);
                  break;

               case 2:
                  allRating.set(1, allRating.get(1) + 1);
                  break;

               case 3:
                  allRating.set(2, allRating.get(2) + 1);
                  break;

               case 4:
                  allRating.set(3, allRating.get(3) + 1);
                  break;

               case 5:
                  allRating.set(4, allRating.get(4) + 1);
                  break;
            }

         }
         
         session.setAttribute("allRating", allRating);
         session.setAttribute("ratingLabel", ratingLabel);
         session.setAttribute("reviewList", reviewList);
         response.sendRedirect("staff/CheckReview.jsp");

      } catch (Exception ex) {

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
