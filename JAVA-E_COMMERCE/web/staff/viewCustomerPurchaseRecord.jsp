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

        <title>View Customer Purchase Record</title>
    </head>
    <body>
        <p class="h4">Below are all the order by <%= orders.get(0).getCustomerID().getCustomerName()%></p>
        <% for (int i = 0; i < orders.size(); i++) {
                Orders ordersDetails = orders.get(i);
        %>     

        <div class="card" style="width: 45rem;">
            <div class="card-header">
                <i class="bi bi-card-list"></i>
                <%= ordersDetails.getShipmentDetails()%>
                <span style="margin-left:350px;"><%= ordersDetails.getOrderTime()%></span>
                </br>Tracking Number: <%= ordersDetails.getTrackingNumber()%>
            </div>
            <div class="card-body">
                <% for (int j = 0; j < ordersDetails.getOrderListList().size(); j++) {
                        OrderList orderlist = ordersDetails.getOrderListList().get(j);
                %>
                <img src="<%= orderlist.getProduct().getProductImage()%>" style="width:50px;height:50px;"/>
                <span>
                    <h5 class="card-title">
                        <%= orderlist.getProduct().getProductName()%>            
                        <span style="margin-left:450px;font-weight:normal"><%= String.format("RM %.2f", orderlist.getProduct().getPrice())%></span>
                        <span style="margin-left:600px;font-weight:100">x <%= orderlist.getQuantity()%></span>
                    </h5>
                </span>
                <p class="card-text"><%= orderlist.getProduct().getProductDescription()%></p>
                <hr>
                <% }%>
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item">Total Payment <span style="margin-left:450px;"><%= String.format("RM %.2f", ordersDetails.calculateTotal())%></span></li>
                <li class="list-group-item">Logistic Information <span style="margin-left:450px;"><%= ordersDetails.getDeliveryCourier()%></span></li>
                <li class="list-group-item">Shipment Date 
                    <% String ship_time = ordersDetails.getShipTime() + "";
                    %>
                    <span style="margin-left:450px;"><%= ship_time.equals("null") ? "N/A" : ordersDetails.getShipTime()%>
                    </span>
                </li>
                <li class="list-group-item">Paid Time
                    <span style="margin-left:380px;"><%= ordersDetails.getOrderTime()%>
                    </span>
                </li>
            </ul>
        </div>

        <% }%>
    </body>
</html>
