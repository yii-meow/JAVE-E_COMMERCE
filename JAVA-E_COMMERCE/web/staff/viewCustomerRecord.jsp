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
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <%  for (int i = 0; i < customer.size(); i++) {
                Customer customerDetails = customer.get(i);
            %>
            
            <%= customerDetails.getCustomerName() %>

            <% }%>
        </table>
    </body>
</html