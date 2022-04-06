<%-- 
    Document   : viewOrder
    Created on : Apr 6, 2022, 8:52:48 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders, java.util.*"%>

<jsp:include page="../maintainOrders"/>
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

        <title>View Order</title>
    </head>
    <body>
        <table class="table table-dark table-hover">
            <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Order Time</th>
                    <th scope="col">Shipment Time</th>
                    <th scope="col">Tracking Number</th>
                    <th scope="col">Delivery Courier</th> 
                    <th scope="col">Shipment Details</th>   
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%  for (int i = 0; i < orders.size(); i++) {
                        Orders order = orders.get(i);
                %>

                <tr class="table-primary">
                    <td><%= order.getOrderId()%></td>
                    <td><%= order.getOrderTime()%></td>
                    <td><%= order.getShipTime()%></td>
                    <td><%= order.getTrackingNumber()%></td>
                    <td><%= order.getDeliveryCourier()%></td>
                    <td><%= order.getShipmentDetails()%></td>
                    <td>
            <li class='list-inline-item'>
                <button class='btn btn-success btn-sm rounded-0 editButton' type='button' data-id="<%= order.getOrderId()%>" data-whatever='@mdo' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>
            </li>
        </td>
    </tr>


    <% }%>
</tbody>
</table>

<script>
    $(document).ready(function () {
        $('.editButton').on('click', function () {
            $('#updateAppointmentModal').modal('show');
            $('#order_ID').val($(this).data('id'));
        }
        );
    });
</script>

<!--Bootstrap Modal for Updating New Appointment-->
<div class="modal fade" id="updateAppointmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
