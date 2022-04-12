<%-- 
    Document   : SelectDateRange
    Created on : 10-Apr-2022, 23:43:10
    Author     : jensienwong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styling/DateRange.css"/>
        <title>Date Range</title>
        <style>
            body{
                background: rgba(255,26,104,0.2);
            }

        </style>
    </head>
    <body>
       <%@ include file="../AdminHeader.jsp" %>
        <table>
            <form action="../DateRange" method="POST">
                <tr>
                    <th id="label">From</th>
                    <td id="input"><input type="date" name="start_date"></td>
                </tr>
                <tr>
                    <th id="label">To</th>
                    <td id="input"><input type="date" name="end_date"></td>
                </tr>
                <tr>
                    <td id="submit" colspan="3"><input type="submit" value="Generate"></td>
                </tr>

            </form>    
        </table>
    </body>
</html>
