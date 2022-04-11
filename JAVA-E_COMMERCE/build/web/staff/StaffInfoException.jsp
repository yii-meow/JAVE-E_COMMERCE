<%-- 
    Document   : AddStaffResult
    Created on : 06-Apr-2022, 21:03:36
    Author     : jensienwong
--%>
<%
    String errMsg = (String) session.getAttribute("errMsg");
    String webSite = (String) session.getAttribute("webSite");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Info Requirement</title>
    </head>
    <body>
        <p><%= errMsg%></p>
        <p><a href="../<%= webSite %>">Try Again</a></p>
    </body>
</html>
