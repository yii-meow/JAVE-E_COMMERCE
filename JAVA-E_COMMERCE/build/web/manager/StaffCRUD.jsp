<%-- 
    Document   : StaffCRUD
    Created on : 05-Apr-2022, 10:50:43
    Author     : jensienwong
--%>
<%@page import="java.util.List"%>
<%@page import="entity.Staff"%>
<jsp:useBean id="staff" scope="session" class="entity.Staff"></jsp:useBean>
<jsp:include page="../staff/sidebar.jsp"/> 
<%
//    if(session.getAttribute("loginStaff") );
    Staff lgstf = (Staff) session.getAttribute("loginStaff");
    if (lgstf.getPosition() != 'M') {
        response.sendRedirect("../Unauthorized.html");
    }

    List<Staff> staffList = null;
    String recordForm = null;
    if (session.getAttribute("staffList") != null || session.getAttribute("recordFrom") != null) {
        staffList = (List<Staff>) session.getAttribute("staffList");
        recordForm = (String) session.getAttribute("recordFrom");
    } else {
        response.sendRedirect("../Unauthorized.html");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../styling/StaffCRUD.css"/>
        <title>Staff CRUD</title>
        <script>
            function check(x) {
                document.getElementById(x).checked = true;
                document.getElementById("search").disabled = false;
            }
        </script>

    </head>
    <body>
        <div class="contentCenter">


            <h1>Staff Control</h1>
            <div class="searchByPosition">
                <form action="../Search" method="GET">

                    <label for="f-option" class="l-radio">
                        <input type="radio" id="ID" name="SearchBy" value="staffId" tabindex="1">
                        <span onclick="check('ID')">ID</span>
                    </label>

                    <label for="s-option" class="l-radio">
                        <input type="radio" id="Name" name="SearchBy" value="staffName" tabindex="2">
                        <span onclick="check('Name')">Name</span>
                    </label>

                    <label for="t-option" class="l-radio">
                        <input type="radio" id="Position" name="SearchBy" value="staffPosition" tabindex="3">
                        <span onclick="check('Position')" >Position</span>
                    </label>
                    <br>

                    <input type="text" name="search" id="search" placeholder="Search" disabled>
                    <button id="search" type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>

            <form action="../RecordAction" method="POST">
                <button id="addNew" name="addStaffId" type="submit" value="add">Add New Staff</button>
                <!--Table-->
                <table>
                    <!--Table Heading-->
                    <thead>
                    <th>No</th>
                    <th>Staff ID</th>
                    <th>Name</th>
                    <th>Position</th>
                    <th colspan="3">Action</th>
                    </thead>

                    <!--Table Body-->
                    <tbody>
                        <%                        for (int a = 0; a < staffList.size(); a++) {
                        %>
                        <tr>
                            <td id="no"><%= a + 1%></td>
                            <td id="id"><%= staffList.get(a).getStaffID()%></td>
                            <td id="name"><%= staffList.get(a).getStaffName()%></td>
                            <%
                                String position;
                                if (staffList.get(a).getPosition() == 'M') {
                                    position = "Manager";
                                } else {
                                    position = "Staff";
                                }
                            %>
                            <td id="position"><%= position%></td>

                            <td id="action"><button type="submit" id="action" name="viewStaffId" value="<%= staffList.get(a).getStaffID()%>">View</button></td><!--Go to view more information about the staff-->
                            <td id="action"><button type="submit" id="action" name="editStaffId" value="<%= staffList.get(a).getStaffID()%>">Edit</button></td><!--Go to edit information about the staff-->
                            <td id="action"><button type="submit" id="action" name="deleteStaffId" value="<%= staffList.get(a).getStaffID()%>">Delete</button></td><!--Go to delete the staff-->
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </form>
            <%
                if (recordForm.equals("Search")) {
            %>
            <a href="StaffCRUD.jsp"></a>
            <button onclick="location.href = '../RetrieveRecord'">Reset</button>
            <%
                }
            %>
        </div>
    </body>
</html>
