<%@page import="java.util.ArrayList"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Review"%>
<%@page import="java.util.List"%>
<%@page  import="entity.Product" %>
<%
   String test = (String) session.getAttribute("test");
   Product itemList = (Product) session.getAttribute("detailsList");
   System.out.println(itemList.getPrice());
   int ProductId = (Integer) session.getAttribute("productId");
   

//List<Review> review = (List<Review>) session.getAttribute("reviewList");
   ArrayList<String> customer = (ArrayList<String>) session.getAttribute("customerName");
   ArrayList<Integer> rating = (ArrayList<Integer>) session.getAttribute("rating");
   ArrayList<String> reviewComment = (ArrayList<String>) session.getAttribute("ReviewComment");
   String noReview = "";
   if (reviewComment.size() == 0) {
      noReview = "There have no any review for this product";
   }
//List<Product> itemList = (List<Product>) session.getAttribute("itemList");
// out.println(customer);
//  out.println(reviewComment);
//   out.println(rating);
// 
%>
<html>
   <head>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <style>
         #product {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 80%;

         }

         #product td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
         }

         #product tr:nth-child(even){
            background-color: #f2f2f2;
         }

         #product tr:hover {
            background-color: #ddd;
         }

         #product th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
         }

         .checked {
            color: orange;
         }

      </style>
   </head>

   <body>
      <h1>your orders </h1>


      <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by productID.."> 

      <table id="product">
         <tr>

            <th>Product ID</th> 
            <th>Product Name</th> 
            <th>Product Description</th>
            <th></th>
         </tr>
         <tr>
            <td>   <%=itemList.getProductId()%></td>
            <td>   <%=itemList.getProductName()%></td>
            <td>   <%=itemList.getProductDescription()%></td>
            <td>
               <form action="../addShoppingCart">
                  <input type="number" id="quantity" name="quantity" min="1" max="100">
                  <input type="hidden" id="productID" name="productID" value= <%=(Integer) session.getAttribute("productId")%>>
                  <input type="hidden" id="customerID" name="customerID" value= "1">
                  <input type="submit" value="add to cart">
               </form>
         </tr>
      </table>

      <h1>Product Rating</h1>


      <%
         if (noReview.equals("")) {

            for (int k = 0; k < reviewComment.size(); k++) {
      %>
      <hr style="width:50%;text-align:left;margin-left:0">
      <p id="customerId"><%= customer.get(k)%></p>
      <!--     <p id="reviewId">Product Name: </p>-->
      <p id="reviewId">Rating:
         <%
            switch (rating.get(k)) {
               case 1:
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  break;

               case 2:
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  break;

               case 3:
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  break;

               case 4:
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  break;

               case 5:
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  out.println("<span class=\"fa fa-star checked\"></span>");
                  break;

            }
         %></p> 
      <p id="reviewId">Comment:<%= reviewComment.get(k)%></p>

      <%   }
         } else {
            out.println(noReview);
         }

      %>


   </body> 
   <script>
      function test(test) {

         alert("quantity of:" + document.getElementById("quantity").value + "  and productID:" + test + "\n Added to cart");
         location.href = "../customer/addShoppingCart";
      }
   </script>

