<%@page import="java.util.List"%>
<%@page import="entity.Review"%>
<jsp:include page="sidebar.jsp"/> 
<jsp:include page="../Review"/>

<%
List<Review> review = (List<Review>) session.getAttribute("reviewList");
List<Review> CustomerList =(List<Review>) session.getAttribute("customerId");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Check Review Details</title>
      <style>
         
      </style>
   </head>
   <body>
         <div align="center">
            <table border="1" cellpadding="5" >
               <caption><h2>List of Customer Review</h2></caption>
               <tr>
                  <td>Review ID</td>
                  <td>Customer ID</td>
                  <td>Product ID</td>
                  <td>Product Name</td>
                  <td>Rating</td>
                  <td>Review Comment</td>
               </tr>
               
               <% 
               for(int a=0; a< review.size(); a++){
                  
               %>
               <tr>
                  <td id="reviewId"><%= review.get(a).getReviewId()%></td>
                  <td id="reviewId"><%= review.get(a).getCustomerId() %></td>
                  <td id="reviewId"><%= review.get(a).getProductId().getProductId() %></td>
                  <td id="reviewId"><%= review.get(a).getProductName() %></td>
                  <td id="reviewId"><%= review.get(a).getRating() %></td>
                  <td id="reviewId"><%= review.get(a).getReviewComment() %></td>
               </tr>
               
               <% }%>
            </table>
         </div>
   </body>
</html>
