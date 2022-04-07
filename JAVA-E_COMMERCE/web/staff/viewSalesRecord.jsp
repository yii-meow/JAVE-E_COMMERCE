<%-- 
    Document   : viewSalesRecord
    Created on : Apr 7, 2022, 4:52:17 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.OrderList, java.util.*"%>
<jsp:include page="../viewSalesRecord"/>
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders");%>

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
                <%
                    for (int i = 0; i < orders.size(); i++) {
                        Orders order = orders.get(i);
                %>

                <%
                    for (int j = 0; j < order.getOrderListList().size(); j++) {
                        OrderList ol = order.getOrderListList().get(j);

                %>
                <tr>
                    <td><%= ol.getProduct().getProductId()%></td>
                    <td><%= ol.getProduct().getProductName()%></td>
                    <td><%= ol.getQuantity()%></td>
                    <td><%= String.format("RM %.2f", ol.getProduct().getPrice())%></td>
                        <td><%=String.format("RM %.2f", ol.getSubtotal())%></td>
                </tr>


                <% }%>

                <% }%>
            </tbody>        
    </body>

</table>
</html>
