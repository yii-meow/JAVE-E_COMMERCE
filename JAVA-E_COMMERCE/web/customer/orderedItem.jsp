<%-- 
    Document   : OrderedItemDetails
    Created on : Apr 7, 2022, 1:44:55 AM
    Author     : sohyz
--%>

<%@page import="entity.OrderList"%>
<%@page import="java.util.*"%>
<%@page import="entity.Orders"%>
<%
    List<List<OrderList>> itemList = (List) session.getAttribute("ordersList");  //here
%>

<html>
    <head>
        <style>
            <%@include  file="table.css" %>
            button{
                cursor: pointer;
            }
        </style>
        <%@include  file="header.jsp" %>
    </head>
    <body>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="../customer/ViewCustomerProfile">My Account </a>
            <a href="../customer/View">Start Order</a>
            <a href="../customer/ViewShoppingCart">Shopping Cart</a>
            <a href="../customer/ViewOrder">My Orders</a>
        </div>



        <table id="product">
            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Product List</span>
            <tr>
                <th>Product ID</th> 
                <th>Product Name</th> 
                <th>Order ID</th>
                <th>Order Time</th> 
                <th>Delivery Courier</th> 
                <th>Ship time</th>
                <th>Tracking number</th>
                <th>Shipment Status</th>
                <th>Add Review</th>
            </tr>

            <% for (List<OrderList> item : itemList) {%>
            <%  List<OrderList> orderRow = item;
                {
                    for (OrderList myItemList : orderRow) {%>


            <tr>
                <td>   <%= myItemList.getProduct().getProductId()%></td>
                <td>   <%=myItemList.getProduct().getProductName()%></td>
                <td>   <%= myItemList.getOrders().getOrderId()%></td>
                <td>   <%= myItemList.getOrders().getOrderTime()%></td>
                <td>   <%= myItemList.getOrders().getDeliveryCourier()%></td> 
                <td>   <%= myItemList.getOrders().getShipTime()%></td>
                <td>   <%=  myItemList.getOrders().getTrackingNumber()%></td> 
                <td>   <%=  myItemList.getOrders().getShipmentDetails()%></td>
                <td><button onclick="location.href = '../Review'">Review</td>
            </tr>
            <% }%>

            <%}%>
            <%}%>
        </table>

    </body>


    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>