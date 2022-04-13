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
   <li><a href="customer/ViewCustomerProfile">Update/Delete Item</a><br>
   <li><a href="customer/ViewShoppingCart">ViewCart</a><br>
</ul>

<h1>Customer</h1>
<a href="Review">Customer insert review</a><br /><br />
<a href="IndividualReview">Customer Individual Review</a><br /><br />
<a href="StaffReview">Staff Review</a>


<h1>YOU CAN REMOVE THIS BUTTON THIS BUTTON JUST FOR TESTING PURPOSE</h1>
<a href="staff/StaffLogin.jsp"> Staff </a>
<a href="customer/index.html"> Customer </a>