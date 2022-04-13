<%-- 
    Document   : RetrieveStaff
    Created on : 05-Apr-2022, 23:28:50
    Author     : jensienwong
--%>
<jsp:useBean id="viewStaff" scope="session" class="entity.Staff"></jsp:useBean>
<jsp:include page="../staff/sidebar.jsp"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table, th, td{
                margin: auto;
                border-bottom: 0.5px solid gainsboro;
                padding: 10px;
            }
            tr:hover{
                background-color: gainsboro;
            }
            th{
                width: 200px;
                
            }
        </style>
        <title>Retrieve Staff</title>
        <script src="../styling/Password.js"></script>
    </head>
    <body>
        <div class="contentCenter">
            <table>
                <tr>
                    <th>ID</th>
                    <td>${viewStaff.staffID}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${viewStaff.staffName}</td>
                </tr>
                <tr>
                    <th>IC</th>
                    <td>${viewStaff.staffIc}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${viewStaff.staffEmail}</td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td>${viewStaff.staffphoneNo}</td>
                </tr>
                <tr>
                    <th>Position</th>
                        <%
                            String position;
                            if (viewStaff.getPosition() == 'M') {
                                position = "Manager";
                            } else {
                                position = "Staff";
                            }
                        %>
                    <td><%= position%></td>
                </tr>
                <tr>
                    <th>Date Join</th>
                    <td>${viewStaff.dateJoin}</td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><input type="button" onclick='showPass("${viewStaff.staffPassword}");' value="Show Password"></td>
                </tr>
                <tr>
                    <td id="backButton" colspan="2"><button onclick="location.href = '../RetrieveRecord'">Back</button></td>
                </tr>
            </table>

        </div>
    </body>
</html>
