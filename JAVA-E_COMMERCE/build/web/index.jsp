<h1><%= application.getInitParameter("appName")%></h1>
<p>Contact Us: <%= application.getInitParameter("contactUs")%></p>
<%
    if (session.getAttribute("isNameAsc") == null) {
        session.setAttribute("isNameAsc", false);
    }


%>

<ul>
    <li><a href="customer/View">View All Items</a><br>
    <li><a href="customer/ViewOrder">Add New Item</a><br>
    <li><a href="customer/ViewCustomerProfile">View Customer Profile</a><br>
    <li><a href="customer/ViewShoppingCart">ViewCart</a><br>
</ul>