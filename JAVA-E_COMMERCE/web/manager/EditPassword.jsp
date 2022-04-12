<%-- 
    Document   : EditPassword
    Created on : 07-Apr-2022, 12:35:39
    Author     : jensienwong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styling/SetupAdministrator.css">
        <link rel="stylesheet" href="../styling/StaffLogin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src="../styling/Password.js"></script>
        <title>Change Password</title>
    </head>
    <body>
        <%@ include file="../AdminHeader.jsp" %>
        <div class="form-container">
            <form action="../Password" method="POST">
                <div class="form">
                    <input class="input_Field" type="password" name="oldPassword" id="oldPassword" placeholder=" "><label class="label_Field">Old Password</label>
                    <i id="showPassword-eye" class="fa" aria-hidden="true" onclick="showOldPassword()">&#xf06e;</i>
                </div>
                <div class="form">
                    <input class="input_Field" type="password" name="newPassword" id="password" placeholder=" "><label class="label_Field">New Password</label>
                    <i id="showPassword-eye" class="fa" aria-hidden="true" onclick="showPassword()">&#xf06e;</i>
                </div>
                <div class="form">
                    <input class="input_Field" type="password" name="confirmPassword" id="confirmPassword" placeholder=" "><label class="label_Field">Confirm Password</label>
                    <i id="showPassword-eye" class="fa" aria-hidden="true" onclick="showConfirmPassword()">&#xf06e;</i>
                </div>
                <table>
                    <tr>
                    <input type="hidden" name="webSite" id="webSite" value="EditPassword.jsp">
                    <td><input type="submit" name="submitType" value="Submit"></td>
                    <td><input type="submit" name="submitType" value="Back"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
