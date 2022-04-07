<%-- 
    Document   : viewSalesRecord
    Created on : Apr 7, 2022, 4:52:17 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.OrderList,entity.Product,java.util.*"%>
<% List<Object[]> order_list = (List<Object[]>) session.getAttribute("ordersGroup");%>

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
        <form action="../viewSalesRecord" method="POST">
            <input type="hidden" name="action" value="daySalesRecord"/>
            <input type="date" name="select_date" id="select_date"/>
            <input type="submit" value="Search"/> 
        </form>

        </br>Date: <span id="time">${time}</span>

        </br>
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

            <h3>Total Sales Record</h3>
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


</body>
<script>
    $(document).ready(function () {
        // SET DATE FOR DATE PICK INPUT        
        console.log("hi");
        console.log($('#time').text());
        $('#select_date').val($('#time').text());
    });
</script>
</html>
