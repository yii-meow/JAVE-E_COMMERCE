<%-- 
    Document   : shoppingCart
    Created on : Apr 8, 2022, 12:10:26 AM
    Author     : sohyz
--%>

<%@page import="entity.Shoppingcart"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Shoppingcart> itemList = (List) session.getAttribute("cartList");
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
        <h1>ShoppingCart</h1>

        <table id="product">
            <tr>
                <th>ProductImg</th> 
                <th>ProductID</th> 
                <th>customer id</a></th> 
                <th>quantity ordered</th>
                <th>modify Cart</th>
            </tr>

            <%for (Shoppingcart item : itemList) {%>
            <tr>
                <td>
                    <form action="../customer/ViewProductDetails" method="post">
                        <button " onclick="test(this.id)" type="submit" value="<%=item.getProductId()%>" name="your_name" class="btn-link">Go</button>
                    </form>
                </td>
                <td>   <%=item.getProductId()%></td>
                <td>   <%=item.getCustomerId()%></td>
                <td>   <%=item.getQuantity()%></td>
                <td>                     
                    <form action="../UpdateCart">
                        <input type="number" id="quantity" name="quantity" min="1" max="100">
                        <input type="hidden" id="cartID" name="cartID" value= <%=(Integer) item.getCartId()%>>
                        <input type="hidden" id="productID" name="productID" value= "<%=item.getProductId()%>">
                        <input type="hidden" id="customerID" name="customerID" value= "1">
                        <input type="submit" value="UpdateCart" onclick="test(<%=item.getProductId()%>, 1)">
                    </form>
                </td>
                <%}%>
            </tr>
        </table>
        <form action="../customer/PaymentCalculate" method="post">
            <input type="hidden" id="cartID" name="cartID" value= <%=itemList%>>
            <input type="submit" value="Proceed to Payment">
        </form>

    </body>

    <script>

        function test(a, b, ) {
            alert("product iD:" + a + "customer ID" + b);

        }

    </script>