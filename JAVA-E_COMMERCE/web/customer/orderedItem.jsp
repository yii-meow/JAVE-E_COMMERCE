<%-- 
    Document   : OrderedItemDetails
    Created on : Apr 7, 2022, 1:44:55 AM
    Author     : sohyz
--%>

<%@page import="entity.OrderList"%>
<%@page import="java.util.*"%>
<%@page import="entity.Orders"%>
<%
    List<List<OrderList>> itemList = (List) session.getAttribute("ordersList");
    List<Orders> itemList2 = (List) session.getAttribute("Orders");
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
                <th>Order Time</th> 
                <th>Delivery Courier</th> 
                <th>Ship time</th>
                <th>Tracking number</th>
                <th>Shipment Status</th>
                <th>Add Review</th>
            </tr>

            <%
                int index = 0;

                for (List<OrderList> item : itemList) {%>
            <%  List<OrderList> orderRow = item;
                {
                    for (OrderList myItemList : orderRow) {%>


            <tr>
                
                <td>   <%= myItemList.getProduct().getProductId()%></td>
                <td>   <%=myItemList.getProduct().getProductName()%></td>
                <td>   <%= itemList2.get(index).getOrderTime()%></td>
                <td>   <%= itemList2.get(index).getDeliveryCourier()%></td>
                <td>   <%= itemList2.get(index).getShipTime()%></td>
                <td>   <%= itemList2.get(index).getTrackingNumber()%></td>
                <td>   <%= itemList2.get(index).getShipmentDetails()%></td>
                <td>
                    <form action="../Review" method="GET">
                        <input type="hidden" name="getProdName" value="<%= myItemList.getProduct().getProductName()%>">
                        <button type="submit">Review</button>
                    </form>
                </td>

            </tr>
            <% }%>

            <%}%>
            <%index++;
                }%>
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