<%@page  import="entity.Product" %>
<%
    String test = (String) session.getAttribute("test");
    Product itemList = (Product) session.getAttribute("detailsList");
    System.out.println(itemList.getPrice());
    int ProductId = (Integer) session.getAttribute("productId");
%>
<style><%@include  file="table.css" %></style>


<html>
    <head>

        <%@include  file="header.jsp" %>
    <body>

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="../customer/ViewCustomerProfile">My Account </a>
            <a href="../customer/View">Product List</a>
            <a href="../customer/ViewShoppingCart">Shopping Cart</a>
            <a href="../customer/ViewOrder">My Orders</a>
        </div>


        <table id="product"> 
            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Product List</span>
            <tr>

                <th>ProductID</th> 
                <th>Product Name</a></th> 
                <th>Product Description</th>
                <th></th>
            </tr>


            <tr>
                <td>   <%=itemList.getProductId()%></td>
                <td>   <%=itemList.getProductName()%></td>
                <td>   <%=itemList.getProductDescription()%></td>
                <td>
                    <form action="../addShoppingCart">
                        <input type="number" id="quantity" name="quantity" min="1" max="100">
                        <input type="hidden" id="productID" name="productID" value= <%=(Integer) session.getAttribute("productId")%>>
                        <input type="hidden" id="customerID" name="customerID" value= "<%=session.getAttribute("customerID")%>">
                        <input type="submit" value="add to cart">
                    </form>


            </tr>


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

