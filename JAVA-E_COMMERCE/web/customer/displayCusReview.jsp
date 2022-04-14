<%@page import="entity.Product"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Review"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
List<Review> review = (List<Review>) session.getAttribute("reviewList");
List<Customer> customer = (List<Customer>) session.getAttribute("customerList");
List<Product> itemList = (List<Product>) session.getAttribute("itemList");


%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Customer Review</title>
   </head>
   <body>
      
      <h1>Product Rating</h1>
      
<!--       <select id="product" name="productName" >
            <%  for (int b = 0; b < itemList.size(); b++) {
                  //    out.println("<option>");
                  //      out.println(productList.get(b).getProductName());
                  out.println("<option id='itemList'>" + itemList.get(b).getProductName() + "</option>");
                  //  out.println("</option>");           
               }
            %> 
         </select><br /><br />-->

      
      <%
            for(int k=0; k <customer.size(); k++ ){
            
            for(int i=0; i< review.size(); i++ ){
            
      %>
     <hr style="width:50%;text-align:left;margin-left:0">
     <p id="customerId"><%= customer.get(k).getCustomerName() %></p>
     <p id="reviewId">Product Name:<%= review.get(i).getProductName()%></p>
      <p id="reviewId">Rating:<%= review.get(i).getRating() %></p> 
      <p id="reviewId">Comment:<%= review.get(i).getReviewComment() %></p>
      
      <%   } } %>
 
   </body>
</html>
