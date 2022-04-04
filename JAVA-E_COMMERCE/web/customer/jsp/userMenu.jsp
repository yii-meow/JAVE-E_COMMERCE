<%-- 
    Document   : userMenu
    Created on : 21 Mar 2022, 9:08:33 am
    Author     : sohyz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="Util.JsonRead"  %>
<%@page import="Domain.*"  %>
<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<!DOCTYPE html>
<script>



</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <%
            JsonRead jsonRead= new JsonRead();
            List<Customer> customers=jsonRead.JsonRead("C:\\\\Users\\\\sohyz\\\\OneDrive\\\\Documents\\\\NetBeansProjects\\\\ASGM\\\\build\\\\web\\\\WEB-INF\\\\classes\\\\json\\\\order.json");
        %>
        <table>
            <tr>
                <th>orderID</th>
                <th>userName</th>
                <th>orderNumber</th>
                <th>orderDetails</th>
                <th>orderDestination</th>
                <th>time</th>
                <th>status</th>
            </tr>
            <%for (int i=0;i<customers.size();i++){%>
            <tr>
                <th><%= customers.get(i).getOrderID() %></th>
                <th><%= customers.get(i).getUserName() %></th>
                <th><%= customers.get(i).getOrderNumber() %></th>
                <th><%= customers.get(i).getOrderDetails() %></th>
                <th><%= customers.get(i).getOrderDestination() %></th>
                <th><%= customers.get(i).getTime() %></th>
                <th><%= customers.get(i).getStatus() %></th>
            </tr>
            <%}%>


        </table>





    </body>
</html>
