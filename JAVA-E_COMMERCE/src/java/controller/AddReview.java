package controller;

import entity.Customer;
import entity.Product;
import entity.Review;

import com.sun.xml.wss.util.DateUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.RowFilter;
import javax.transaction.UserTransaction;

public class AddReview extends HttpServlet {

   @PersistenceContext
   private EntityManager em;

   @Resource
   UserTransaction utx;

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      reviewCategory(request, response);
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {

      Query query = em.createNamedQuery("Product.findAll");
      List<Product> productList = query.getResultList();
      HttpSession session = request.getSession();
      session.setAttribute("productList", productList);
      session.setAttribute("customerList", query);
    
//       Query CusQuery = em.createNamedQuery("Customer.findAll");
//       List<Customer> customerList = query.get;
//        session.setAttribute("customerList", query);
       
       
      response.sendRedirect("customer/insertReview.jsp");
   }

   protected void reviewCategory(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      try {
         PrintWriter out = response.getWriter();
//        out.print("halo");
//      String comment = request.getParameter("comment");
//         Product productId = em.find(Product.class, request.getParameter("prodName"));
//         String productName = request.getParameter("productName");
//         double rating = Double.parseDouble(request.getParameter("rating"));
//         String reviewComment = request.getParameter("reviewComment");
         Date reviewDate = new Date();
         String prodName = request.getParameter("productName");
         int rating =Integer.parseInt(request.getParameter("stars"));
         String comment = request.getParameter("reviewComment");

         //get product id
         Query query = em.createNamedQuery("Product.findByProductName").setParameter("productName", prodName);
         List<Product> prod = query.getResultList();
         
         //get customer id+
         int customerId = Integer.parseInt(request.getParameter("customerId"));
         
       
       
         Review review = new Review(prod.get(0), prodName, reviewDate, rating,comment ,customerId);
         
         utx.begin();
         em.persist(review); //insert record 
         utx.commit();
         
         response.sendRedirect("index.html");

      } catch (Exception ex) {
         
      }

//    if(request.getParameter("Staff") !=null){
//       response.sendRedirect("StaffCRUD.jsp");
//    }
   }
}
