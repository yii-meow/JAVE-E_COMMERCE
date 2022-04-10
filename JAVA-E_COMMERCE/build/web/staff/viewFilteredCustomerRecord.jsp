<%-- 
    Document   : viewCustomerRecord
    Created on : Apr 6, 2022, 11:37:28 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Customer, java.util.*"%>
<jsp:include page="../viewCustomerRecord"/>
<% List<Customer> customer = (List<Customer>) session.getAttribute("customer");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!-- Import jquery cdn -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity=
                "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous">
        </script>

        <script src=
                "https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity=
                "sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
                crossorigin="anonymous">
        </script>

        <link href="../styling/css/profilePage.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">

        <title>Viewing Existing Customer Record</title>
    </head>
    <body>
        <table class="table table-dark table-hover">            
            <thead>
                <tr style="text-align:center">

                    <% String sort = request.getParameter("sort") + "";
                        String orderBy = request.getParameter("orderBy") + "";
                    %>

                    <th scope="col"><a href="?sort=ID">Customer ID 
                            <%
                                if (sort.equals("null") || sort.equals("ID")) {
                            %>
                            <i class='bi bi-arrow-up'></i>
                            <% }%>
                        </a>
                    </th>

                    <th scope="col">
                        <% if (!sort.equals("name")) {%>         
                        <a href="?sort=name&orderBy=asc">Customer Name
                            <% } else {%>
                            <%= orderBy.equals("asc") ? "<a href='?sort=name&orderBy=desc'>Customer Name<i class='bi bi-arrow-up'></i></a>" : "<a href='?sort=name&orderBy=asc'>Customer Name<i class='bi bi-arrow-down'></i>"%>
                            <% } %>
                        </a>
                    </th>

                    <th scope="col">                        
                        <% if (!sort.equals("email")) {%>         
                        <a href="?sort=email&orderBy=asc">Customer Email
                            <% } else {%>
                            <%= orderBy.equals("asc") ? "<a href='?sort=email&orderBy=desc'>Customer Email<i class='bi bi-arrow-up'></i></a>" : "<a href='?sort=email&orderBy=asc'>Customer Email<i class='bi bi-arrow-down'></i>"%>
                            <% } %>
                        </a>
                    </th>

                    <th scope="col">
                        <% if (!sort.equals("gender")) {%>         
                        <a href="?sort=gender&orderBy=asc">Gender
                            <% } else {%>
                            <%= orderBy.equals("asc") ? "<a href='?sort=gender&orderBy=desc'>Gender<i class='bi bi-arrow-up'></i></a>" : "<a href='?sort=gender&orderBy=asc'>Gender<i class='bi bi-arrow-down'></i>"%>
                            <% } %>
                        </a>
                    </th>

                    <th scope="col">
                        Total number of order<a href="?sort=orderNum">
                            <%
                                if (false) {
                            %>
                            <i class='bi bi-arrow-up'></i>
                            <% } %>
                        </a>
                    </th>

                    <th scope="col">
                        <a href="?sort=totalPurchase">Total Purchase</a>
                        <%
                            if (false) {
                        %>
                        <i class='bi bi-arrow-up'></i>
                        <% } %>
                    </th>

                    <th scope="col">Check Customer Purchase Record</th>
                </tr>
            </thead>
            <tbody>
                <%  for (int i = 0;
                            i < customer.size();
                            i++) {
                        Customer customerDetails = customer.get(i);
                %>

                <!-- Customer Record -->
                <tr style="text-align:center;">
                    <td style="width:5%"><%= customerDetails.getCustomerID()%></td>
                    <td><%= customerDetails.getCustomerName()%></td>
                    <td><%= customerDetails.getCustomerEmail()%></td>
                    <td style="width:5%"><%= customerDetails.getGender()%></td>
                    <td style="width:10%"><%= customerDetails.getOrdersList().size()%></td>
                    <td><%= String.format("RM %.2f", customerDetails.calculateTotalPurchaseAmount())%></td>
                    <td style="width:15%">
                        <form action="../viewCustomerRecord" method="POST">
                            <input type="hidden" name="customer_ID" value="<%= customerDetails.getCustomerID()%>"/>
                            <button class='btn btn-success btn-sm rounded-0' type='button submit' data-id="<%= customerDetails.getCustomerID()%>"><i class="bi bi-arrow-90deg-right"></i></button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html