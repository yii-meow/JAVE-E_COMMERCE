<%@page import="java.util.List"%>
<%@page  import="entity.Customer" %>
<%
    Customer item = (Customer) session.getAttribute("ProfileList");
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
            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Start Order</span>
            <tr><td colspan="2">My profile</td></tr>
            <tr><td colspan="2"style="font-size:20px;">view and check your profile: kindly contact customer service center if any information incorrect</td></tr>
            <tr>
                <td style="text-align: right">user name:</td>
                <td>   <%=item.getCustomerUsername()%></td>
            </tr> 
            <tr>
                <td style="text-align: right">name:</td>
                <td>   <%=item.getCustomerName()%></td>
            </tr> 
            <tr>
                <td style="text-align: right">Email:</td>
                <td>   <%=item.getCustomerEmail()%></td>
            </tr>
            <tr>
                <td style="text-align: right">Gender:</td>
                <td>   <%=item.getGender()%></td>
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
