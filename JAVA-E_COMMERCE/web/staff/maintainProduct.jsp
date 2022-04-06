<%-- 
    Document   : maintainProduct
    Created on : Apr 6, 2022, 1:14:47 PM
    Author     : yikso
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product, java.util.*"%>
<jsp:include page="../maintainProduct"/>

<% List<Product> product = (List<Product>) session.getAttribute("product");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../styling/css/profilePage.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">

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


        <title>Maintain Product</title>
    </head>
    <body>
        <h2>Maintain Product</h2>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createProduct" data-whatever="@mdo">
            Create New Product
        </button>

        <div class="card-group">
            <%
                for (int i = 0; i < product.size(); i++) {
                    Product productDetails = product.get(i);
            %>
            <div style="text-align:center">
                <div class="card border-info mb-3" style="width: 15rem;">
                    <img class="card-img-top" src="..." alt="Product Image">

                    <div class="card-body">
                        <p class="card-text" id="ID-<%= i%>">ID: <%= productDetails.getProductId()%></p>
                        <p class="card-text"><%= productDetails.getProductName()%></p>
                        <p class="card-text">RM <%= productDetails.getPrice()%></p>
                        <p class="card-text">Rating: </p>
                        <button class='btn btn-success btn-sm rounded-0 editButton' type='button' data-whatever='@mdo' data-placement='top' title='Edit'><i class='fa fa-edit'></i></button>

                        <form action="../maintainProduct?action=delete" method="POST">
                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="delete_item" value="<%= productDetails.getProductId()%>"/>
                            <button class='btn btn-danger btn-sm rounded-0 deleteButton' type='button submit' data-toggle='tooltip' data-placement='top' title='Delete' type='submit'><i class='fa fa-trash'></i></button></a>
                        </form>

                    </div>
                </div>
            </div>
            <% }%>
        </div>

        <script>
            $(document).ready(function () {
                $('.editButton').on('click', function () {
                    $('#updateItem').modal('show');

                    $p = $("div").closest("p");

                    var data = $p.children("p").map(function () {
                        return $(this).text();
                    }).get();

                    console.log(data);

                    alert($("#ID-1").html());

                    //alert(document.getElementById("ID").text());
                    // REPLACE THE 'T' IN BETWEEN DATE AND TIME TO SOLVE MISREADING
                    $('#appointment_ID').val(data[0]);
                    $('#appointment_time').val(data[2].replace(/\s/g, 'T'));
                    $('#appointment_name').val(data[3]);
                    $('#appointment_description').val(data[4]);
                });
            });
        </script>

        <!--Bootstrap Modal for Updating New Product-->
        <div class="modal fade" id="updateItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Item Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../maintainProduct" method="POST">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Product Name</label>
                                <input type="text" class="form-control" readonly" id="product_name">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Appointment Name</label>
                                <input type="text" class="form-control" id="appointment_name" name="appointment_name">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Appointment Description</label>
                                <input type="text" class="form-control" id="appointment_description"
                                       name="appointment_description">
                            </div>
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="appointment_ID" id="appointment_ID" ?>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" name="update" class="btn btn-primary" value="Update Appointment"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--===============================================================================================-->
            <script src="../styling/vendor/bootstrap/js/popper.js"></script>
            <script src="../styling/vendor/bootstrap/js/bootstrap.min.js"></script>
        </div>

        <!--Bootstrap Modal for Creating New Product-->
        <div class="modal fade" id="createProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Item Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../maintainProduct" method="POST">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Product Name</label>
                                <input type="text" class="form-control" name="product_name">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Product Description</label>
                                <input type="text" class="form-control" name="product_description">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Stock</label>
                                <input type="text" class="form-control" name="stock">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Price</label>
                                <input type="text" class="form-control" name="price">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Weight</label>
                                <input type="text" class="form-control" name="weight">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Free shipment?</label>
                                <input type="checkbox" name="shipment" value="free_shipment" style="margin-left:10px;">
                            </div>

                            <input type="hidden" name="action" value="update"/>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" name="update" class="btn btn-primary" value="Create New Product"/>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!--===============================================================================================-->
        <script src="../styling/vendor/bootstrap/js/popper.js"></script>
        <script src="../styling/vendor/bootstrap/js/bootstrap.min.js"></script>
    </div>
</body>
</html>
