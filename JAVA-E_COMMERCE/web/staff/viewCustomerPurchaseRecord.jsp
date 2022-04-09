<%-- 
    Document   : viewCustomerPurchaseRecord
    Created on : Apr 7, 2022, 1:54:54 AM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.Product,entity.OrderList,java.util.*"%>
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

        <title>View Customer Purchase Record</title>
    </head>
    <body>

        <p class="h6">Customer: <%= orders.get(0).getCustomerID().getCustomerName()%></p>
        <% for (int i = 0; i < orders.size(); i++) {
                Orders ordersDetails = orders.get(i);
        %>     

        <div class="card" style="width: 46rem;margin-left:auto;margin-right:auto;">
            <div class="card-header">

                <i class="bi bi-card-list"></i>
                <%= ordersDetails.getShipmentDetails()%>

                <button class='btn btn-success btn-sm rounded-0 editButton' type='button' data-id="<%= ordersDetails.getOrderId()%>" data-whatever='@mdo' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>
                <span style="margin-left:320px;"><%= ordersDetails.getOrderTime()%></span>
                </br>Tracking Number: <%= ordersDetails.getTrackingNumber()%>
            </div>

            <!-------------- Order Content ------------->
            <div class="card-body">

                <% for (int j = 0; j < ordersDetails.getOrderListList().size(); j++) {
                        OrderList orderlist = ordersDetails.getOrderListList().get(j);
                %>
                <div width="500px;">
                    <img src="<%= orderlist.getProduct().getProductImage()%>" style="width:100px;height:100px;"/>
                </div>
                </br>
                <span>
                    <h5>
                        <div style="width:200px;">
                            <%= orderlist.getProduct().getProductName()%>
                        </div>
                        <span style="margin-left:535px;font-weight:normal"><%= String.format("RM %.2f", orderlist.getProduct().getPrice())%></span>
                        <span style="font-weight:100">x <%= orderlist.getQuantity()%></span>
                    </h5>
                </span>

                <p class="card-text">Description : <%= orderlist.getProduct().getProductDescription()%></p>
                <hr>
                <% }%>
            </div>

            <!-------------- Order Content ------------->

            <ul class="list-group list-group-flush">

                <li class="list-group-item">                    
                    <div style='width:10rem;display:inline-block'>Total Payment</div> 
                    <div style="width:33rem;text-align:right;display:inline-block;">
                        <%= String.format("RM %.2f", ordersDetails.calculateTotal())%>
                    </div>
                </li>

                <li class="list-group-item">
                    <div style='width:10rem;display:inline-block'>Logistic Information</div> 
                    <div style="width:33rem;text-align:right;display:inline-block;">
                        <%= ordersDetails.getDeliveryCourier()%>
                    </div>
                </li>

                <li class="list-group-item">
                    <div style='width:10rem;display:inline-block'>Shipment Date</div> 
                    <div style="width:33rem;text-align:right;display:inline-block;">
                        <% String ship_time = ordersDetails.getShipTime() + "";
                            out.println(ship_time);
                        %>
                    </div>
                </li>

                </li>
                <li class="list-group-item">
                    <div style='width:10rem;display:inline-block'>Paid Time</div> 
                    <div style="width:33rem;text-align:right;display:inline-block;">
                        <%= ordersDetails.getOrderTime()%>
                    </div>
                </li>
            </ul>
        </div>
        </br>
        <% }%>

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
