<%-- 
    Document   : shoppingCart
    Created on : Apr 8, 2022, 12:10:26 AM
    Author     : sohyz
--%>

<%@page import="entity.Shoppingcart2"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Shoppingcart2> itemList = (List) session.getAttribute("cartList");
%>





<html>
    <head>
        <style><%@include  file="table.css" %></style>
        <%@include  file="header.jsp" %>
    <body>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="../customer/ViewCustomerProfile">My Account </a>
            <a href="../customer/View">Start Order</a>
            <a href="../customer/ViewShoppingCart">Shopping Cart</a>
            <a href="../customer/ViewOrder">My Orders</a>
        </div>



        <table id="product">
            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Shopping Cart</span>
            <tr>
                <th>ProductImg</th> 
                <th>Product name</th> 
                <th>quantity ordered</th>
                <th>modify Cart</th>
                <th>Delete Cart</th>
            </tr>

            <%for (Shoppingcart2 item : itemList) {%>
            <tr>
                <td>   <img src="<%=item.getProductId().getProductImage()%>" alt="Italian Trulli" width="200" height="200"></td>
                <td>   <%=item.getProductId().getProductName()%></td>
                <td>   <%=item.getQuantity()%></td>
                <td>                     
                    <form action="../UpdateCart">
                        <input type="number" id="quantity" name="quantity" min="1" max="100">
                        <input type="hidden" id="cartID" name="cartID" value= <%=(Integer) item.getCartId()%>>
                        <input type="hidden" id="productID" name="productID" value= "<%=item.getProductId().getProductId()%>">
                        <input type="submit" value="UpdateCart" onclick="test(<%=item.getProductId()%>, 1)">
                    </form>
                </td> 
                <td>
                    <form action="../DeleteCart">
                        <input type="hidden" id="cartID" name="cartID" value= <%=(Integer) item.getCartId()%>>
                        <input type="submit" value="delete">
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
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>
