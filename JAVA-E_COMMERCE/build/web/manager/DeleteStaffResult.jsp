<%-- 
    Document   : DeleteStaffSuccess
    Created on : 06-Apr-2022, 15:51:55
    Author     : jensienwong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <%
            boolean result = (Boolean) session.getAttribute("result");

            if (result) {
                out.println("<h1>Delete Successfully</h1>");
                out.println("<p> Delete Successfully</p>");
                out.println("<a href=\"../RetrieveRecord\">Back</a>");
            } else {
                out.println("<h1>Delete Not Successfully</h1>");
                out.println("<p>Error: Confirm Message is Not Match</p>");
                out.println("<a href=\"DeleteStaff.jsp\">Try Again</a>");
            }
        %>
    </body>
</html>
