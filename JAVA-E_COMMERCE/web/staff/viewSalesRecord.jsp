<%-- 
    Document   : viewSalesRecord
    Created on : Apr 7, 2022, 4:52:17 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.OrderList,entity.Product,java.util.*"%>
<jsp:include page="../viewSalesRecord"/>
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders");%>
<% List<Object[]> order_list = (List<Object[]>) session.getAttribute("ordersGroup");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>Sales Record</title>
    </head>
    <body>

        <form action="../viewSalesRecord" method="POST">
            <input type="date" name="select_date"/>
            <input type="submit"/> 
        </form>
        </br>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Subtotal</th>
                </tr>
            </thead>
            <tbody>
            <h3>Total Sales Record</h3>
                <!-- GROUP BY RESULT FROM PRODUCT ID -->
                <% for (Object[] groupResult : order_list) {

                %>
                <tr>
                    <td><%= groupResult[0]%></td>
                    <td><%= groupResult[3]%></td>
                    <td><%= groupResult[2]%></td>
                    <td><%= groupResult[4]%></td>                    
                    <td><%=String.format("RM %.2f", groupResult[1])%></td>
                </tr>


                <% }%>

            </tbody>        
    </body>

</table>
</html>
