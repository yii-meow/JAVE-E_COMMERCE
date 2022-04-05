<%-- 
    Document   : viewProduct
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

    </head>
    <body>
        <%
            for (int i = 0; i < product.size(); i++) {
                Product productDetails = product.get(i);
        %>

        <div class="card" style="width: 18rem;">
            <img class="card-img-top" src="..." alt="Card image cap">
            <div class="card-body">
                <p class="card-text"><%= productDetails.getProductName()%></p>
                <p class="card-text">RM <%= productDetails.getPrice()%></p>
                <p class="card-text">Sold: </p>
            </div>
        </div>

        <% }%>
    </body>
</html>
