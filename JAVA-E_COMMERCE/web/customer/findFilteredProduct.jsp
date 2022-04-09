<%-- 
    Document   : findFilteredProduct
    Created on : Apr 5, 2022, 10:09:26 PM
    Author     : yikso
--%>
<%@page import="entity.Product, java.util.*"%>
<% List<Product> product = (List<Product>) session.getAttribute("product");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewing Product</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="card-group" style="margin-top:20px;text-align:center">
            <%
                for (int i = 0; i < product.size(); i++) {
                    Product productDetails = product.get(i);
            %>

            <!-- PUT PRODUCT PURCHASE LINK HERE -->
            <div style="text-align:center">
                <div class="card text-white bg-dark mb-3" style="width: 15rem;height:40rem;margin-left:15px;">
                    <div class="card-body" style="height:150px;">
                        <img class="card-img-top" src="<%= productDetails.getProductImage()%>" alt="Product Image" style="width:200px;height:200px;">
                    </div>

                    <div class="card-body" id="details" style="margin-top:50px;">
                        <!-- SHOW FILTERED PRODUCT DETAILS -->
                        <p class="card-text">ID: <%= productDetails.getProductId()%></p>
                        <p class="card-text"><%= productDetails.getProductName()%></p>
                        <p class="card-text"><%= productDetails.getProductDescription()%></p>
                        <p class="card-text"><%= String.format("RM %.2f", productDetails.getPrice())%></p>
                        <p class="card-text">Stock: <%= productDetails.getStock()%></p>
                        <p class="card-text">Weight: <%=  String.format("%.2f KG", productDetails.getProductWeight())%></p>
                        <p class="card-text">Free Shipment: <%=  productDetails.getIsShipmentFree() ? "Yes" : "No"%></p>
                        <p class="card-text">Rating: </p>    
                        <p class="card-text">
                        <form action="" method="">
                            <button style="outline:none;background-color:green;border:none;"><i class="bi bi-cart"></i></button>
                        </form>
                        </p> 
                    </div>
                </div>
            </div>

            <% }%>
        </div>
    </body>
</html>
