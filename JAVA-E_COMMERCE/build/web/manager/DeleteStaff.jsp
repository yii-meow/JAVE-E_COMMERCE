<%-- 
    Document   : DeleteStaff
    Created on : 06-Apr-2022, 08:55:48
    Author     : jensienwong
--%>
<%@page import="entity.Staff"%>
<jsp:useBean id="deleteStaff" scope="session" class="entity.Staff"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../staff/sidebar.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Staff</title>
        <style>
            input[type=submit]{
                margin: 5px;
            }
        </style>
    </head>
    <body>
        <div class="contentCenter">
            <h1>Delete Staff</h1>
            <table>
                <tr>
                    <th>ID</th>
                    <td>${deleteStaff.staffID}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${deleteStaff.staffName}</td>
                </tr>
                <tr>
                    <th>IC</th>
                    <td>${deleteStaff.staffIc}</td>
                </tr>
                <tr>
                    <th>Position</th>
                        <%
                            String position;
                            if (deleteStaff.getPosition() == 'M') {
                                position = "Manager";
                            } else {
                                position = "Staff";
                            }
                        %>
                    <td><%= position%></td>
                </tr>
                <tr>
                    <th>Date Join</th>
                    <td>${deleteStaff.dateJoin}</td>
                </tr>
            </table>
            <form action="../DeleteStaff">
                <%
                      Staff lgstf = (Staff) session.getAttribute("loginStaff");
                    String confirmMsg = lgstf.getStaffID() + "/" + deleteStaff.getStaffID();
                %>
                <p>
                    This action cannot be undone. This will permanently delete the <b><%= confirmMsg%></b>.<br> 
                    Please type <b><%= confirmMsg%></b> to confirm.<br>
                </p>
                <h3><%= confirmMsg%></h3>
                <input type="hidden" name="staffId" id="staffId" value="${deleteStaff.staffID}">
                <input type="hidden" name="confirmMsg" id="confirmMsg" value="<%= confirmMsg%>">
                <input type="input" name="confirm" id="confirm" placeholder="<%= confirmMsg%>"><br>
                <input type="submit" name="submit" value="Confirm"><input type="submit" name="submit" value="Cancel">
            </form>
        </div>
    </body>
</html>
