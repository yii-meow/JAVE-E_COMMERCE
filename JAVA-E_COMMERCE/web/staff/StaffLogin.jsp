<%-- 
    Document   : StaffLogin
    Created on : 05-Apr-2022, 01:15:18
    Author     : jensienwong
--%>
<jsp:useBean id="staff" scope="session" class="entity.Staff"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styling/StaffLogin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src="../styling/Password.js"></script>
        <script>
            function focusInputId(){
                document.getElementById("staffId").focus();
            }
            function focusInputPassword(){
                document.getElementById("password").focus();
            }
        </script>
    </head>
    <body>
        <%@ include file="../AdminHeader.jsp" %>
        <div class="form-container">
            <h1>Administrator Login</h1>
            <form action="../staffLogin" method="POST">  
                <div class="form">
                    <input class="input_Field" type="text" name="staffId" id="staffId" placeholder=" " value="${staff.staffID}" required><label onclick="focusInputId()" class="label_Field">Staff ID</label>
                </div>
                <div class="form">
                    <input class="input_Field" type="password" name="staffPassword" id="password" placeholder=" " required><label onclick="focusInputPassword()" class="label_Field">Password</label>
                    <i id="showPassword-eye" class="fa" aria-hidden="true" onclick="showPassword()">&#xf06e;</i>
                </div>
                <input type="submit" value="Login">
            </form>
        </div>
    </body>
</html>