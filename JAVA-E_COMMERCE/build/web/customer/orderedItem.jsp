<%-- 
    Document   : OrderedItemDetails
    Created on : Apr 7, 2022, 1:44:55 AM
    Author     : sohyz
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Orders"%>
<%
    List<Orders> itemList = (List) session.getAttribute("ordersList");  //here
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
                <th><a href="../customer/View" onclick="
                       <%
                           session.setAttribute("isIdAsc", false);
                       %>"
                       >ProductID</a></th> 
                <th><a href="../customer/View" onclick="
                       <%
                           session.setAttribute("isDesAsc", true);
                       %>"
                       >Product Name</a></th> 
                <th>Tracking Number</th>
            </tr>

            <% for (Orders item : itemList) {%>
            <tr>
                <td onclick="location.href = '..';">   <%=item.getOrderId()%></td>
                <td>   <%=item.getOrderTime()%></td>
                <td>   <%=item.getTrackingNumber()%></td>

            </tr>
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
