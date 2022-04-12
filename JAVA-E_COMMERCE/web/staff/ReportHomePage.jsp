<%-- 
    Document   : ReportHomePage
    Created on : 08-Apr-2022, 22:34:09
    Author     : jensienwong
--%>
<%@ include file="../AdminHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                background: rgba(255,26,104,0.2);
            }
            .reportSelect{
                text-align: center;
                margin:auto;
                align-content: center;
            }

            .noselect {
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                -webkit-tap-highlight-color: transparent;
            }

            button {
                width: 150px;
                height: 50px;
                cursor: pointer;
                font-size: 20px;
                font-weight: bold;
                color: salmon;
                background: transparent;
                border: 2px solid white;
                box-shadow: 5px 5px 0 black,
                    -5px -5px 0 black,
                    -5px 5px 0 black,
                    5px -5px 0 black;
                transition: 500ms ease-in-out;
                margin: 8px;
            }

            button:hover {
                box-shadow: 20px 5px 0 black, -20px -5px 0 black;
                border: 2px solid red;
                color:red;
                background: white;
            }

            button:focus {
                outline: none;
            }
        </style>
        <title>Reports</title>
    </head>
    <body>        
        <h1>Select Report</h1>
        <div class="reportSelect">
            <form action="../GenerateReport" method="GET">
                <button class="name noselect" type="submit" name="submitType" id="submitType" value="MostPopularCategories">Hot Product</button><br>
                <button class="name noselect" type="submit" name="submitType" id="submitType" value="SalesReport">Sales Report</button><br>
                <button class="name noselect" type="submit" name="submitType" id="submitType" value="CustomerAnalysisReport">Customer Analysis Report</button><br>
            </form>
        </div>


    </body>
</html>
