<%-- 
    Document   : viewCustomerPurchaseRecord
    Created on : Apr 7, 2022, 1:54:54 AM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.Product,entity.OrderList,java.util.*"%>
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <title>JSP Page</title>
    </head>
    <body>
        <h4>Below are all the order by <%= orders.get(0).getCustomerID().getCustomerName()%></h4>

        <% for (int i = 0; i < orders.size(); i++) {
                Orders ordersDetails = orders.get(i);
        %>        

        <div class="card" style="width: 50rem;">
            <div class="card-header">
                <i class="bi bi-card-list"></i>
                <%= ordersDetails.getShipmentDetails()%>
                <span style="margin-left:440px;"><%= ordersDetails.getOrderTime()%></span>
                </br>Tracking Number: <%= ordersDetails.getTrackingNumber()%>
            </div>
            <div class="card-body">
                <% for (int j = 0; j < ordersDetails.getOrderListList().size(); j++) {
                    OrderList orderlist = ordersDetails.getOrderListList().get(j);
                %>
                <img src="<%= orderlist.getProduct().getProductImage() %>" style="width:50px;height:50px;"/>
                <h5 class="card-title"><%= orderlist.getProduct().getProductName() %></h5>               
                <p class="card-text"><%= orderlist.getProduct().getProductDescription() %></p>
                <hr>
                <% } %>
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Vestibulum at eros</li>
            </ul>
        </div>

        <% }%>
    </body>
</html>
