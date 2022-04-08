<%-- 
    Document   : viewOrder
    Created on : Apr 9, 2022, 12:52:34 AM
    Author     : yikso
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.OrderList, java.util.*"%>
<jsp:include page="../viewSalesRecord" />
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

        <!-- Import jquery cdn -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity=
                "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous">
        </script>

        <script src=
                "https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity=
                "sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
                crossorigin="anonymous">
        </script>

        <link href="../styling/css/profilePage.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">

        <title>View Order</title>
    </head>
    <body>
        <div class="card">
            <div class="header" style="margin-left:auto;margin-right:auto;">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="viewOrder.jsp">All <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="?shipment=Preparing">Preparing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="?shipment=Shipped">Shipped</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="?shipment=Delivered">Delivered</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <div class="card-body">
                    <% for (int i = 0; i < orders.size(); i++) {
                            Orders ordersDetails = orders.get(i);
                    %>     

                    <div class="card" style="width: 45rem;margin-left:auto;margin-right:auto;">
                        <div class="card-header">
                            <i class="bi bi-card-list"></i>
                            <%= ordersDetails.getShipmentDetails()%>
                            <button class='btn btn-success btn-sm rounded-0 editButton' type='button' data-id="<%= ordersDetails.getOrderId()%>" data-whatever='@mdo' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>
                            <span style="margin-left:320px;"><%= ordersDetails.getOrderTime()%></span>
                            </br>Tracking Number: <%= ordersDetails.getTrackingNumber()%>
                        </div>

                        <div class="card-body">
                            <!-------------- Order Content ------------->
                            <% for (int j = 0; j < ordersDetails.getOrderListList().size(); j++) {
                                    OrderList orderlist = ordersDetails.getOrderListList().get(j);
                            %>
                            <img src="<%= orderlist.getProduct().getProductImage()%>" style="width:50px;height:50px;"/>
                            <span>
                                <h5 class="card-title">
                                    <%= orderlist.getProduct().getProductName()%>            
                                    <span style="margin-left:450px;font-weight:normal"><%= String.format("RM %.2f", orderlist.getProduct().getPrice())%></span>
                                    <span style="margin-left:600px;font-weight:100">x <%= orderlist.getQuantity()%></span>
                                </h5>
                            </span>
                            <p class="card-text"><%= orderlist.getProduct().getProductDescription()%></p>
                            <hr>
                            <% }%>
                        </div>

                        <!-------------- Order Content ------------->


                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Total Payment <span style="margin-left:450px;"><%= String.format("RM %.2f", ordersDetails.calculateTotal())%></span></li>
                            <li class="list-group-item">Logistic Information <span style="margin-left:450px;"><%= ordersDetails.getDeliveryCourier()%></span></li>
                            <li class="list-group-item">Shipment Date 
                                <% String ship_time = ordersDetails.getShipTime() + "";
                                %>
                                <span style="margin-left:350px;"><%= ship_time.equals("null") ? "N/A" : ordersDetails.getShipTime()%>
                                </span>
                            </li>
                            <li class="list-group-item">Paid Time
                                <span style="margin-left:380px;"><%= ordersDetails.getOrderTime()%>
                                </span>
                            </li>
                        </ul>
                    </div>
                    </br>
                    <% }%>
                </div>
            </div>

            <script>
                $(document).ready(function () {
                    $('.editButton').on('click', function () {
                        $('#updateShipment').modal('show');
                        $('#order_ID').val($(this).data('id'));
                    }
                    );
                });
            </script>

            <!--Bootstrap Modal for Updating New Shipment-->
            <div class="modal fade" id="updateShipment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">

                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Shipment Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="../maintainOrders" method="POST">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Shipment Status : </label>
                                    <select name="shipment_status">
                                        <option value=""/>No status
                                        <option value="Preparing"/>Preparing
                                        <option value="Shipped"/>Shipped
                                        <option value="Delivered"/>Delivered                            
                                    </select>
                                </div>
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="order_ID" id="order_ID"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" name="update" class="btn btn-primary" value="Update Shipment"/>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
