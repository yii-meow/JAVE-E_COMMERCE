<%-- 
    Document   : userMenu
    Created on : 21 Mar 2022, 9:08:33 am
    Author     : sohyz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Domain.*"  %>
<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<%@page import="java.sql.*"%>

<%
    String host = "jdbc:mysql://java-database.mysql.database.azure.com ,:3306/e-commerce?zeroDateTimeBehavior=CONVERT_TO_NULL";
    String user = "assignmentjava";
    String password = "#JAVAdatabase#";
    String tableName = "orders";
    Connection conn;
    PreparedStatement stmt;
%>
<!DOCTYPE html>
<script>



</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>


        <h1>Retrieve data from database in jsp</h1>
        <table border="1">
            <tr>
                <td>first name</td>
                <td>last name</td>
                <td>City name</td>
                <td>Email</td>

            </tr>
            <%
                String queryStr = "SELECT * FROM " + tableName;
                ResultSet rs = null;
                try {
                               stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, code);

            rs = stmt.executeQuery();
                    while (resultSet.next()) {
            %>
            <tr>
                <td>hello</td>
                <td><%=resultSet.getString("order_id")%></td>
                <td><%=resultSet.getString("order_id")%></td>
                <td><%=resultSet.getString("order_id")%></td>
                <td><%=resultSet.getString("order_id")%></td>

            </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table> 





    </body>
</html>
