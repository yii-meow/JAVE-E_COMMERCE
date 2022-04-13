<%@page import="java.util.List"%>
<%@page  import="entity.Product" %>
<%
    List<Product> itemList = (List) session.getAttribute("productList");
%>

<style><%@include  file="table.css" %>

    input[type=text], select {
        width: 50%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-left: auto;
        margin-right: auto;
    }

</style>


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

            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Product List</span><br>
            <input type="text" id="myInput" onkeyup="Filter()" placeholder="Search for names..">
            <tr>
                <th>Product Image</th> 
                <th><a href="../customer/View" onclick="
                       <%
                           if (session.getAttribute("isNameAsc").equals(false)) {
                               session.setAttribute("isNameAsc", true);
                           } else {
                               session.setAttribute("isNameAsc", false);
                           }
                       %>"
                       >Product Name</a></th> 
                <th>Product Price</th> 
                <th>Product Stock</th> 
                <th>Product Description</th>
                <th>purchase</th>
            </tr>

            <%
                int i = 1;
                for (Product item : itemList) {%>
            <tr>
                <td>   <img src="<%=item.getProductImage()%>" alt="Italian Trulli" width="200" height="200"></td>
                <td id="ProductName">   <%=item.getProductName()%></td>
                <td>  RM <%= item.getPrice()%></td>
                <td>   <%= item.getStock()%></td>
                <td>   <%=item.getProductDescription()%></td>
                <td>
                    <form action="../customer/ViewProductDetails" method="post">
                        <button id="<%=i%>" onclick="test(this.id)" type="submit" value="<%=item.getProductId()%>" name="your_name" class="btn-link">Go</button>
                    </form>
                </td>
            </tr>
            <option value="<%=item.getProductDescription()%>">
                <% i++;
                    }%>
        </table>

    </body>


    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }


        function Filter() {
            // Declare variables
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("product");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
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


