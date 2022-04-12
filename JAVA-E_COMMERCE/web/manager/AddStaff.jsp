<%-- 
    Document   : AddStaff
    Created on : 05-Apr-2022, 15:34:28
    Author     : jensienwong
--%>
<%@page import="entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
//Retrieve New Staff Session
    Staff staff = (Staff) session.getAttribute("newStaff");
    String firstName = (String) session.getAttribute("firstName");
    String lastName = (String) session.getAttribute("lastName");

    String ic = staff.getStaffIc();
    String email = staff.getStaffEmail();
    String phoneNumber = staff.getStaffphoneNo();

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Staff</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styling/AddStaff.css">
    </head>
    <body>
        <%@ include file="../AdminHeader.jsp" %>
        <div class="container">
            <h1>Add Staff</h1>
            <form action="../AddStaff" method="POST">                
                <input class="inputField" type="text" name="firstName" id="firstName" placeholder="First Name" value="<%= firstName%>">
                <input class="inputField" type="text" name="lastName" id="lastName" placeholder="Last Name" value="<%= lastName%>">
                <br>
                <input class="inputField" type="text" name="ic" id="ic" placeholder="IC Number" value="<%= ic%>">
                <br>
                <input class="inputField" type="email" name="email" id="email" placeholder="Email" value="<%= email%>">
                <input class="inputField" type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone Number" value="<%= phoneNumber%>"><br>
                <div class="button">
                    <input type="submit" name="submitType" id="submit" value="Add"><input type="submit" name="submitType" id="reset" value="Clear">
                </div>
            </form>
        </div>

    </body>
</html>
