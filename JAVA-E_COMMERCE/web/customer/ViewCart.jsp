<%-- 
    Document   : ViewCart
    Created on : Apr 8, 2022, 3:33:55 AM
    Author     : sohyz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%
    List<Product> itemList = (List) session.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
    <head>
        <style><%@include  file="table.css" %></style>
    <body>
        <h1>your orders </h1>

        <table id="product">
            <tr>
                <th>ProductImg</th> 
                <th>ProductID</th> 
                <th><a href="../customer/View" onclick="
                       <%
                           if (session.getAttribute("isNameAsc").equals(false)) {
                               session.setAttribute("isNameAsc", true);
                           } else {
                               session.setAttribute("isNameAsc", false);
                           }
                       %>"
                       >Product Name</a></th> 
                <th>Product Description</th>
            </tr>

            <%
                int i = 1;
                for (Product item : itemList) {%>
            <tr>
                <td>
                    <form action="../customer/ViewProductDetails" method="post">
                        <button id="<%=i%>" onclick="test(this.id)" type="submit" value="<%=item.getProductId()%>" name="your_name" class="btn-link">Go</button>
                    </form>
                </td>
                <td>   <%=item.getProductId()%></td>
                <td>   <%=item.getProductName()%></td>
                <td>   <%=item.getProductDescription()%></td>

            </tr>
            <% i++;
                    }%>
        </table>

    </body>
