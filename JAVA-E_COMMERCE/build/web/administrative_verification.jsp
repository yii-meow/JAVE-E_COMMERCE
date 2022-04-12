<%-- 
    Document   : administrative_verification
    Created on : 12-Apr-2022, 11:27:42
    Author     : jensienwong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Verification</title>
    </head>
    <body>
        <form action="j_security_check" method="POST">
            Key Word: <input type="text" name="j_username"><br>
            Password: <input type="password" name="j_password">
            <input type="submit" value="Verify">
        </form>
    </body>
</html>
