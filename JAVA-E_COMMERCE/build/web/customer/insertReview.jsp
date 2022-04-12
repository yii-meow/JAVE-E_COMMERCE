
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="Entity.Product"%>
<%@page import="Entity.Review"%>

<%
   List<Product> productList = (List<Product>) session.getAttribute("productList");
   //remember modify to get the customer id 
   int customerId = 1;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="../css/ratingForm.css">

      <!--      bootstrap css-->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
            crossorigin="anonymous">

      <!--       bootstrap java script-->
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


      <script>
         $(':radio').change(function () {
            console.log('New star rating: ' + this.value);
         });
      </script>

      <title>Review</title>
   </head>
   <body>

      <h1>Product Ratings</h1><br />
      <form action ="../Review" method="POST">
         
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch rating modal
</button>
        
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product Rating</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       
         <div class="modal-body">
        <form>
          <div class="form-group">
<!--         <h3><label for="product">Product</label></h3>-->
         <select id="product" name="productName" >
            <%  for (int b = 0; b < productList.size(); b++) {
                  //    out.println("<option>");
                  //      out.println(productList.get(b).getProductName());
                  out.println("<option id='productList'>" + productList.get(b).getProductName() + "</option>");
                  //  out.println("</option>");           
               }
            %> 
         </select><br /><br />

  </div>
         <div class=" form-group rating">
            <label>
               <input type="radio" name="stars" value="1" />
               <span class="icon">★</span>
            </label>
            <label>
               <input type="radio" name="stars" value="2" />
               <span class="icon">★</span>
               <span class="icon">★</span>
            </label>
            <label>
               <input type="radio" name="stars" value="3" />
               <span class="icon">★</span>
               <span class="icon">★</span>
               <span class="icon">★</span>   
            </label>
            <label>
               <input type="radio" name="stars" value="4" />
               <span class="icon">★</span>
               <span class="icon">★</span>
               <span class="icon">★</span>
               <span class="icon">★</span>
            </label>
            <label>
               <input type="radio" name="stars" value="5" />
               <span class="icon">★</span>
               <span class="icon">★</span>
               <span class="icon">★</span>
               <span class="icon">★</span>
               <span class="icon">★</span>
            </label>
         </div>


         <h3><label>Review Comment</label></h3><br />
         <textarea name="reviewComment" placeholder="Please write your comment here"></textarea>
         <input type="hidden" id="customerId" name="customerId" value="<%= customerId%>"/>

          </div>
         
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="submit" class="btn btn-primary" value="submit" onclick="successFunction()">Rate</button>
        
        <script>
           function successFunction(){
              alert("Rating Successfully, Thank you for your review!");
           }
        </script>
      </div>
    </div>
  </div>
</div>
<!--         <input type="submit" name="submit" value="submit">-->
      </form>
   </body>
</html>
