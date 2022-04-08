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
