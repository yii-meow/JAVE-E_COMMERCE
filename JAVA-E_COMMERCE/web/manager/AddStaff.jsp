<%-- 
    Document   : AddStaff
    Created on : 05-Apr-2022, 15:34:28
    Author     : jensienwong
--%>
<%@page import="entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../staff/sidebar.jsp"/> 
<%
//Retrieve New Staff Session
    Staff newStaff = new Staff();
    String firstName = "";
    String lastName = "";

    String ic = "";
    String email = "";
    String phoneNumber = "";

    if (ic.equals(null)) {
        ic = "";
    }
    if (email.equals(null)) {
        email = "";
    }
    if (phoneNumber.equals(null)) {
        phoneNumber = "";
    }

    if (session.getAttribute("newStaff") != null) {
        newStaff = (Staff) session.getAttribute("newStaff");
        ic = newStaff.getStaffIc();
        email = newStaff.getStaffEmail();
        phoneNumber = newStaff.getStaffphoneNo();
    }
    if (session.getAttribute("firstName") != null) {
        firstName = (String) session.getAttribute("firstName");
    }
    if (session.getAttribute("lastName") != null) {
        lastName = (String) session.getAttribute("lastName");
    }
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
        <div class="contentCenter">
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
                        <input type="submit" name="submitType" id="submit" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
