<%-- 
    Document   : ConfirmStaffInfo
    Created on : 05-Apr-2022, 19:19:47
    Author     : jensienwong
--%>
<%@page import="entity.Staff"%>
<%
    Staff staff = (Staff) session.getAttribute("newStaff");
    String password = (String) session.getAttribute("password");
    String position;
    if (staff.getPosition() == 'M') {
        position = "Manager";
    } else {
        position = "Staff";
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../staff/sidebar.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../styling/Password.js"></script>
        <title>Confirm Information</title>
    </head>
    <body>
        <div class="contentCenter">
            <h1>Confirm Staff Information</h1>
            <table>
                <tr>
                    <th>ID</th>
                    <td><%= staff.getStaffID()%></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><%= staff.getStaffName()%></td>
                </tr>
                <tr>
                    <th>IC</th>
                    <td><%= staff.getStaffIc()%></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= staff.getStaffEmail()%></td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td><%= staff.getStaffphoneNo()%></td>
                </tr>
                <tr>
                    <th>Position</th>
                    <td><%= position%></td>
                </tr>
                <tr>
                    <th>Date Join</th>
                    <td><%= staff.getDateJoin()%></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><button onclick='showPass("<%= password%>");'>Show Password</button></td>
                </tr>
            </table>

            <form action="../SaveStaff" method="POST">
                <input type="submit" name="submitType" value="Confirm">
                <input type="submit" name="submitType" value="Back">
            </form>
        </div>
    </body>
</html>
