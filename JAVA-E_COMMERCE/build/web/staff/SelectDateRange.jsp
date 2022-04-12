<%-- 
    Document   : SelectDateRange
    Created on : 10-Apr-2022, 23:43:10
    Author     : jensienwong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="sidebar.html"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styling/DateRange.css"/>
        <!-- Bootstrap core CSS -->
        <link href="../styling/bootstrap.min.css" rel="stylesheet">
        <title>Date Range</title>
        <style>
            body{
                background-color:#7e31aa;
            }

        </style>
        <!-- Custom styles for this template -->
        <link href="../styling/sidebars.css" rel="stylesheet">
    </head>
    <body>

        <div class="contentCenter">
            <table>
                <form action="../DateRange" method="POST">
                    <tr>
                        <th id="label" style="color:white;">From</th>
                        <td id="input"><input type="date" name="start_date"></td>
                    </tr>
                    <tr>
                        <th id="label" style="color:white;">To</th>
                        <td id="input"><input type="date" name="end_date"></td>
                    </tr>
                    <tr>
                        <td id="submit" colspan="3"><input type="submit" value="Generate"></td>
                    </tr>

                </form>    
            </table>
        </div>
    </body>

</html>
