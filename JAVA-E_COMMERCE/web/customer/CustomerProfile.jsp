<%@page import="java.util.List"%>
<%@page  import="entity.Customer" %>
<%
    List<Customer> itemList = (List<Customer>) session.getAttribute("ProfileList");
%>
<html>
    <head>
        <style>
            #product {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 80%;

            }

            #product td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #product tr:nth-child(even){
                background-color: #f2f2f2;
            }

            #product tr:hover {
                background-color: #ddd;
            }

            #product th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #04AA6D;
                color: white;
            }


        </style>
    <body>
        <h1>your orders </h1>




        <table id="product">
            <tr>
                <th>ProfileImg</th> 
                <th>ProductID</th> 
                <th><a href="../customer/View" onclick="
                       <%
                           if (session.getAttribute("isNameAsc").equals(false)) {
                               session.setAttribute("isNameAsc", true);
                           } else {
                               session.setAttribute("isNameAsc", false);
                           }
                       %>"
                       >Product Name</a></th> 
                <th>Product Description</th>
            </tr>

            <%
                int i = 1;
                for (Customer item : itemList) {%>
            <tr>
                <td>
                    <form action="../customer/ViewProductDetails" method="post">
                        <button id="<%=i%>" onclick="test(this.id)" type="submit" value="<%=item.getCustomerName()%>" name="your_name" class="btn-link">Go</button>
                    </form>
                </td>
                <td>   <%=item.getCustomerAddress()%></td>
                <td>   <%=item.getCustomerEmail()%></td>
                <td>   <%=item.getCustomerPassword()%></td>

            </tr>
            <% i++;
                    }%>
        </table>

    </body>
    <script>
        function myFunction() {
            // Declare variables
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("product");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>