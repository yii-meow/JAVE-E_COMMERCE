<%-- 
    Document   : InvalidPasswordRequirement
    Created on : 05-Apr-2022, 19:10:30
    Author     : jensienwong
--%>
<%
    String errMsg = (String) session.getAttribute("passwordErrorMessage");
    String website = (String) session.getAttribute("webSite");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invalid Password Requirement</title>
    </head>
    <body>
        <h1>Password Exception</h1>
        <hr>
        <p><%= errMsg %></p>
        <p><a href="../<%= website %>">Try Again</a></p>
    </body>
</html>
