<%-- 
    Document   : ReportHomePage
    Created on : 08-Apr-2022, 22:34:09
    Author     : jensienwong
--%>
<%@ include file="Header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
    </head>
    <body>        
        <h1>Select Report</h1>
        <form action="../GenerateReport" method="GET">
            <button type="submit" name="submitType" id="submitType" value="MostPopularCategories">Hot Product</button>
            <button type="submit" name="submitType" id="submitType" value="SalesReport">Sales Report</button>
            <button type="submit" name="submitType" id="submitType" value="CustomerAnalysisReport">Customer Analysis Report</button> 
        </form>
    </body>
</html>
