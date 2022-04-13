<%-- 
    Document   : viewCustomerPurchaseRecord
    Created on : Apr 7, 2022, 1:54:54 AM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders,entity.Product,entity.OrderList,java.util.*"%>
<% List<Orders> orders = (List<Orders>) session.getAttribute("orders");%>
<jsp:include page="sidebar.jsp"/> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src=
                "https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity=
                "sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
                crossorigin="anonymous">
        </script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="../styling/css/profilePage.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <!-- Bootstrap core CSS -->
        <link href="../styling/bootstrap.min.css" rel="stylesheet">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="../styling/sidebars.css" rel="stylesheet">

        <title>View Customer Purchase Record</title>
    </head>
    <body>
        <div class="contentCenter">

            <div class="alert alert-success" role="alert" style="text-align:center;">
                Record of Customer : <%= orders.get(0).getCustomerID().getCustomerName()%>
            </div>

            <% for (int i = 0; i < orders.size(); i++) {
                    Orders ordersDetails = orders.get(i);
            %>     

            <div class="card" style="width: 46rem;margin-left:auto;margin-right:auto;">
                <div class="card-header">

                    <i class="bi bi-card-list"></i>
                    <%= ordersDetails.getShipmentDetails()%>

                    <button class='btn btn-success btn-sm rounded-0 editButton' type='button' data-id="<%= ordersDetails.getOrderId()%>" data-whatever='@mdo' data-placement='top' title='Edit' style='margin-left:8px;'><i class='fa fa-edit'></i></button>

                    <div style='display:inline-block;width:35rem;text-align:right;'>
                        Order Time: <%= ordersDetails.getOrderTime()%>
                    </div>
                    </br>

                    Tracking Number: <%= ordersDetails.getTrackingNumber()%>
                </div>

                <!-------------- Order Content in Card Body ------------->
                <div class="card-body">

                    <% for (int j = 0; j < ordersDetails.getOrderListList().size(); j++) {
                            OrderList orderlist = ordersDetails.getOrderListList().get(j);
                    %>
                    <div width="500px;">

                        <!--------------- Image ----------------->
                        <img src="<%= orderlist.getProduct().getProductImage()%>" style="width:100px;height:100px;"/>
                    </div>

                    </br>

                    <span>
                        <h5>
                            <div style="width:200px;">
                                <!--------------- Product Name ----------------->
                                <%= orderlist.getProduct().getProductName()%>
                            </div>
                            <div style='width:43rem;text-align:right;'>
                                <!--------------- Product Price and Quantity ----------------->
                                <span style="font-weight:normal"><%= String.format("RM %.2f", orderlist.getProduct().getPrice())%></span>
                                <span style="font-weight:100">x <%= orderlist.getQuantity()%></span>
                            </div>
                        </h5>
                    </span>

                    <!--------------- Product Description ----------------->
                    <p class="card-text">Description : <%= orderlist.getProduct().getProductDescription()%></p>

                    <hr>

                    <% }%>

                </div>

                <!-------------- Order Content in Card Body ------------->

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
