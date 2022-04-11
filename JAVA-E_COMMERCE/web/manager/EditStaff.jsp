<%-- 
    Document   : EditStaff
    Created on : 06-Apr-2022, 01:08:59
    Author     : jensienwong
--%>
<jsp:useBean id="editStaff" scope="session" class="entity.Staff"></jsp:useBean>
<%
    session.setAttribute("changePasswordStatus", "false");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Information</title>
        <script src="../styling/showPassword.js"></script>
    </head>
    <body>
        <%@ include file="../staff/Header.jsp" %>
        <h1>Edit Form</h1>
        <form action="../EditStaff" method="POST">
            <table>
                <tr>
                    <td colspan="2"><button type="reset">Reset</button></td>
                </tr>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="staffId" id="staffId" value="${editStaff.staffID}" readonly></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="staffName" id="staffName" value="${editStaff.staffName}"></td>
                </tr>
                <tr>
                    <th>IC</th>
                    <td><input type="text" name="staffIc" id="staffIc" value="${editStaff.staffIc}"></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input type="text" name="staffEmail" id="staffEmail" value="${editStaff.staffEmail}"></td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td><input type="text" name="staffPhoneNumber" id="staffPhoneNumber" value="${editStaff.staffphoneNo}"></td>
                </tr>
                <tr>
                    <th>Position</th>
                        <%
                            String position;
                            if (editStaff.getPosition() == 'M') {
                                position = "Manager";
                            } else {
                                position = "Staff";
                            }
                        %>
                    <td><input type="text" name="staffPosition" id="staffPosition" value="<%= position%>"readonly></td>
                </tr>
                <tr>
                    <th>Date Join</th>
                    <td><input type="text" name="staffDateJoin" id="staffDateJoin" value="${editStaff.dateJoin}" readonly></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>
                        <input type="hidden" name="staffPassword" id="staffPassword" value="${editStaff.staffPassword}">
                        <input type="submit" name="submitType" id="editPassword" value="Change Password">
                    </td>
                </tr>
            </table>


            <input type="submit" name="submitType" value="Update">
            <input type="submit" name="submitType" value="Cancel">
            <!--            <button type="submit" name="submit">Update</button>-->

        </form>
    </body>
</html>
