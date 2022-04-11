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
            #product {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 80%;

            }

            #product td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #product tr:nth-child(even){
                background-color: #f2f2f2;
            }

            #product tr:hover {
                background-color: #ddd;
            }

            #product th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #04AA6D;
                color: white;
            }


        </style>
    <body>
        <h1>your orders </h1>


        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by productID.."> 

        <table id="product">
            <tr>
                <th>ProductID</th> 
                <th>Product Name</th> 
                <th>OrderID</th>
                <th>OrderTime</th> 
                <th>DeliveryCourier</th> 
                <th>Ship time</th>
                <th>Tracking number</th>
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
            </tr>











            <% }%>

            <%}%>
            <%}%>
        </table>

    </body>
    <script>
        function myFunction() {
            // Declare variables
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("product");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
