<%-- 
    Document   : SetUpPassword
    Created on : 05-Apr-2022, 17:38:54
    Author     : jensienwong
--%>
<jsp:useBean id="newStaff" scope="session" class="entity.Staff"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styling/SetupAdministrator.css">
        <link rel="stylesheet" href="../styling/StaffLogin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src="../styling/Password.js"></script>
        <title>Setup Administrator</title>
        <script>
            function focusPassword(){
                document.getElementById("password").focus();
            }
            function focusConfirmPassword(){
                document.getElementById("confirmPassword").focus();
            }
        </script>
    </head>
    <body>
        <div class="form-container">
            <form action="../Password" method="POST">
                <div class="form">
                    <input class="input_Field" type="text" name="id" id="id" placeholder=" " value="${newStaff.staffID}" readonly><label class="label_Field">Staff ID</label>
                </div>
                <div class="form">
                    <input class="input_Field" type="password" name="password" id="password" placeholder=" " required><label onclick="focusPassword()" id="password" class="label_Field">Password</label>
                    <i id="showPassword-eye" class="fa" aria-hidden="true" onclick="showPassword()">&#xf06e;</i>
                </div>
                <div class="form">
                    <input class="input_Field" type="password" name="confirmPassword" id="confirmPassword" placeholder=" " required><label onclick="focusConfirmPassword()" id="confirmPassword" class="label_Field">Confirm Password</label>
                    <i id="showPassword-eye" class="fa" aria-hidden="true" onclick="showConfirmPassword()">&#xf06e;</i>
                </div>
                <table>
                    <tr>
                    <input type="hidden" name="webSite" id="webSite" value="SetUpPassword.jsp">
                    <td><input type="submit" name="submitType" value="Submit"></td>
                    <td><button name="submitType" value="Back" onclick="location.href = 'AddStaff.jsp'">Back</button></td>
                    </tr>
                </table>

            </form>
        </div>
    </body>
</html>
