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
    double totalPriceList[] = (double[]) session.getAttribute("oriprice");
    String[] deliveryCourier = {"DAL", "LAJU", "ANB", "GREX"};
%>
<html>
    <head>
        <style><%@include  file="table.css" %></style>
    <body>
        <h1>Review Payment</h1>

        <table id="product">
            <tr>
                <th>ProductImg</th> 
                <th>Quantity Ordered</th>
                <th>Total Price</th>
            </tr>

            <%
                int index = 0;

                for (Shoppingcart2 item : itemList) {%>
            <tr>
                <td>   <img src="<%=item.getProductId().getProductImage()%>" alt="Italian Trulli" width="200" height="200"></td>
                <td>   <%=item.getQuantity()%></td>
                <td>   <%=totalPriceList[index]%></td>
                <%index++;
                    }%>
            </tr>
        </table>

        <form action="../customer/ConfirmPayment" method="post">
            <table id="product">
                <tr>
                    <th>use voucher</th> 
                    <th>Voucher Name</th> 
                    <th>Discount Rate</th>
                    <th>delivery Courier</th> 
                </tr>

                <%int i = 0;%>
                <%for (Voucher item : voucherList) {%>
                <tr>
                    <td>

                        <input type="radio" id="voucher" name="voucher" value="<%=item.getVoucherDiscountRate()%>">

                    </td>
                    <td>   <%=item.getVoucherName()%></td>
                    <td>   <%=item.getVoucherDiscountRate()%></td>
                    <td><input type="radio" id="DeliveryCourier" name="DeliveryCourier" value="<%=deliveryCourier[i]%>"><%=deliveryCourier[i]%> 

                    </td>
                    <%i++;
                        }%>
                </tr>
            </table>
            <input type="submit" value="Proceed to Payment">
        </form>




    </body>

    <script>

        function test(a) {
            alert("total price=" + a);

        }

    </script>
