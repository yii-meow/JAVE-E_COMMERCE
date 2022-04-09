<%-- 
    Document   : Payment
    Created on : Apr 8, 2022, 8:36:54 PM
    Author     : sohyz
--%>

<%@page import="entity.Voucher"%>
<%@page import="entity.Shoppingcart2"%>
<%@page import="java.util.List"%>
<%
    List<Shoppingcart2> itemList = (List) session.getAttribute("cartList");
    double originalPrice = (Double) session.getAttribute("OriginalPrice");
    double disocuntPrice = (Double) session.getAttribute("DiscountPrice");
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
        <h1>Confirm Purchase</h1>

        <table id="product">
            <tr>
                <th>ProductImg</th> 
                <th>ProductID</th> 
                <th>Quantity</th>
            </tr>

            <%for (Shoppingcart2 item : itemList) {%>
            <tr>
                <td>
                    <form action="../customer/ViewProductDetails" method="post">
                        <button " onclick="test(this.id)" type="submit" value="<%=item.getProductId()%>" name="your_name" class="btn-link">Go</button>
                    </form>
                </td>
                <td>   <%=item.getProductId().getProductId()%></td>
                <td>   <%=item.getQuantity()%></td>
                <%}%>
            </tr>
        </table>

        <table id="product">
            <tr>
                <th>total price</th>
                <th>price after discount</th>
            </tr>
            <tr>
                <td><%=originalPrice%></td>
                <td><%=disocuntPrice%></td>
            </tr>
        </table>

        <form action="../customer/AddOrder">
            <input type="submit" value="confirm purchase">

        </form>


    </body>

    <script>

        function test(a) {
            alert("total price=" + a);

        }

    </script>
