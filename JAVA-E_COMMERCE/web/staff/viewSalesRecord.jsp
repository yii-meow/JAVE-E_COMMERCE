<%-- 
    Document   : viewSalesRecord
    Created on : Apr 7, 2022, 4:52:17 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.OrderList,entity.Product,java.util.*"%>
<jsp:include page="../viewSalesRecord"/>
<jsp:include page="navbar.jsp"/>
<% List<Object[]> order_list = (List<Object[]>) session.getAttribute("ordersGroup");%>
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>Sales Record</title>
    </head>
    <body>
        <span class="badge bg-info text-dark" style="font-size:1.5rem;margin-left:auto;margin-right:auto;">Overall Sales Record</span>

        <table class="table table-striped">
            <thead>
                <tr style="text-align:center">
                    <th scope="col" ><a href="../viewSalesRecord?sort=ID&ascending=true">Product ID</a></th>
                    <th scope="col"><a href="?sort=name&ascending=true">Product Name</th></a>
                    <th scope="col"><a href="?sort=quantity&ascending=true">Quantity</th></a>
                    <th scope="col"><a href="?sort=price&ascending=true">Price</th></a>
                    <th scope="col"><a href="?sort=subtotal&ascending=true">Subtotal</th></a>
                </tr>
            </thead>
            <tbody>
                </br></br>
                Time Range : 
            <form action="../viewSalesRecord" method="POST">
                <input type="date" name="start_date" id="start_date"/>&nbsp;&nbsp; ->
                <input type="date" name="end_date" id="end_date" style="margin-left:10px;"/>
                <input type="submit" value="Search" style="margin-left:10px;"/> 
            </form>
            </br>

            </br>
            <!-- GROUP BY RESULT FROM PRODUCT ID -->
            <% for (Object[] groupResult : order_list) {
            %>

            <tr style="text-align:center">                    
                <td><%= groupResult[0]%></td>
                <td><%= groupResult[3]%></td>
                <td><%= groupResult[2]%></td>
                <td><%= String.format("RM %.2f", groupResult[4])%></td>                    
                <td><%=String.format("RM %.2f", groupResult[1])%></td>
            </tr>
            <% }%>
        </form>
    </tbody>
</table>

<div style="text-align:center;margin-top:50px;">
    <span style=""><h2><u>Order History</u></h2></span>   
</div>
<table class="table">
    <thead>
        <tr style="text-align:center">
            <th scope="col" ><a href="../viewSalesRecord?sort=ID&ascending=true">Order Time</a></th>
            <th scope="col" ><a href="../viewSalesRecord?sort=ID&ascending=true">Product ID</a></th>
            <th scope="col"><a href="?sort=name&ascending=true">Product Name</th></a>
            <th scope="col"><a href="?sort=quantity&ascending=true">Quantity</th></a>
            <th scope="col"><a href="?sort=price&ascending=true">Price</th></a>
            <th scope="col"><a href="?sort=subtotal&ascending=true">Subtotal</th></a>
        </tr>
    </thead>
    <tbody>

        </br>
        <!-- GROUP BY RESULT FROM PRODUCT ID -->
        <% for (int i = 0; i < orders.size(); i++) {
                Orders order = orders.get(i);
        %>
        <tr style="text-align:center;font-weight:bold;color:#cc0099">
            <td><%= order.getOrderTime()%></td>
            <% for (int j = 0; j < order.getOrderListList().size(); j++) {
                    OrderList ol = order.getOrderListList().get(j);
            %>
        <tr style="text-align:center;border-style:hidden">
            <td class="table-light"></td>

            <td class="table-success"><%= ol.getProduct().getProductId()%></td>
            <td class="table-success"><%= ol.getProduct().getProductName()%></td>
            <td class="table-success"><%= ol.getQuantity()%></td> 
            <td class="table-success"><%= String.format("RM %.2f", ol.getProduct().getPrice())%></td>                    
            <td class="table-success"><%=String.format("RM %.2f", ol.getSubtotal())%></td>
        </tr>
        <% }%>

        </tr>
        <tr style="border-style:hidden;"><td colspan="6"></td></tr>
            <% }%>

        </form>
    </tbody>
</table>

</body>
<script>
    $(document).ready(function () {
        // SET CURRENT DATE FOR DATE PICK INPUT
        var date = new Date();
        var currentDate = date.toISOString().substring(0, 10);
        $('#start_date').val(currentDate);
        $('#end_date').val(currentDate);
    });
</script>
</html>