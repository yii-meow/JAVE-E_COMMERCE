<%@page  import="entity.Product" %>
<%
    String test = (String) session.getAttribute("test");
    Product itemList = (Product) session.getAttribute("detailsList");
    System.out.println(itemList.getPrice());
    int ProductId = (Integer) session.getAttribute("productId");
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


        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by productID.."> 

        <table id="product">
            <tr>

                <th>ProductID</th> 
                <th>Product Name</a></th> 
                <th>Product Description</th>
                <th></th>
            </tr>


            <tr>
                <td>   <%=itemList.getProductId()%></td>
                <td>   <%=itemList.getProductName()%></td>
                <td>   <%=itemList.getProductDescription()%></td>
                <td>
                    <form action="../addShoppingCart">
                        <input type="number" id="quantity" name="quantity" min="1" max="100">
                        <input type="hidden" id="productID" name="productID" value= <%=(Integer) session.getAttribute("productId")%>>
                        <input type="hidden" id="customerID" name="customerID" value= "1">
                        <input type="submit" value="add to cart">
                    </form>


            </tr>


        </table>

    </body> 
    <script>
        function test(test) {

            alert("quantity of:" + document.getElementById("quantity").value + "  and productID:" + test + "\n Added to cart");
            location.href = "../customer/addShoppingCart";
        }
    </script>

