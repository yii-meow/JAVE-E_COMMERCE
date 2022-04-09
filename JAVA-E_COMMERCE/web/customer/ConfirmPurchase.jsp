<%-- 
    Document   : Payment
    Created on : Apr 8, 2022, 8:36:54 PM
    Author     : sohyz
--%>

<%@page import="entity.Voucher"%>
<%@page import="entity.Shoppingcart2"%>
<%@page import="java.util.List"%>
<%
    List<Shoppingcart2> itemList = (List) session.getAttribute("cartList");
    List<Voucher> voucherList = (List) session.getAttribute("voucherList");
    double totalPrice = (Double) session.getAttribute("totalPrice");
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
        <h1>Review Payment</h1>

        <table id="product">
            <tr>
                <th>ProductImg</th> 
                <th>ProductID</th> 
                <th>Quantity</th>
            </tr>

            <%for (Shoppingcart2 item : itemList) {%>
            <tr>
                <td>
                    <form action="../customer/ViewProductDetails" method="post">
                        <button " onclick="test(this.id)" type="submit" value="<%=item.getProductId()%>" name="your_name" class="btn-link">Go</button>
                    </form>
                </td>
                <td>   <%=item.getProductId()%></td>
                <td>   <%=item.getQuantity()%></td>
                <%}%>
            </tr>
        </table>


        <table id="product">
            <tr>
                <th>use voucher</th> 
                <th>Voucher Name</a></th> 
                <th>Discount Rate</th>
                <th>Original Payment</th>
                <th>Price after discount</th>
            </tr>
            <form action="../customer/ViewProductDetails" method="post">
                <%int i = 0;%>
                <%for (Voucher item : voucherList) {%>
                <tr>
                    <td>

                        <input type="radio" id="voucher" name="voucher" value="<%=item.getVoucherDiscountRate()%>">

                    </td>
                    <td>   <%=item.getVoucherName()%></td>
                    <td>   <%=item.getVoucherDiscountRate()%></td>
                    <%i++;
                        }%>
                </tr>
                <input type="submit",value="Proceed to payment">
            </form>
        </table>



        <form >
            <button onclick="window.location.href = 'payment.jsp" type="submit" value="" name="your_name" class="btn-link">Go</button>
        </form>

    </body>
    <button onclick="test(<%=totalPrice%>)">testing</button>
    <script>

        function test(a) {
            alert("total price=" + a);

        }

    </script>
