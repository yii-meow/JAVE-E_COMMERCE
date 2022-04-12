<%-- 
    Document   : Header
    Created on : 08-Apr-2022, 15:43:41
    Author     : jensienwong
--%>
<%@page import="entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean isLogin = false;
    Staff loginStaff = null;
    if (session.getAttribute("loginStaff") != null) {
        loginStaff = (Staff) session.getAttribute("loginStaff");
        isLogin = true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styling/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <!--HEADER-->
        <div class="header">


            <%
                if (isLogin) {
            %>

            <!--Login User-->
            <a href="ManagerHomePage.jsp" class="logo">Alimama</a>
            <div class="header-right">
                <a href="../RetrieveRecord">Staff</a>
                <a href="#">Product</a>
                <a href="ReportHomePage.jsp">Report</a>
                <span class="drop-down">
                    <label><i style="font-size:18px" class="fa">&#xf023;</i><%= loginStaff.getStaffName()%></label>                
                    <span class="logoutUser" onclick="location.href = '../LogOut'">Log Out</span> 
                </span>
            </div>
            <%
            } else {
            %>
            <!--No Login User-->
            <a href="index.jsp" class="logo">Alimama</a>
            <div class="header-right">
                <a href="StaffLogin.jsp">Login</a> 
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
