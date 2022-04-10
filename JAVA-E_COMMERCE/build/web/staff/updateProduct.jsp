<%-- 
    Document   : updateProduct
    Created on : Apr 8, 2022, 7:52:56 PM
    Author     : yikso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product, java.util.*"%>

<% Product product = (Product) session.getAttribute("selected_product");%>

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

        <title>Update Product</title>

    </head>
    <body>
        <!--Bootstrap Modal for Updating New Product-->
        <div class="modal fade" id="updateItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../maintainProduct" method="POST">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Product Name</label>
                                <input type="text" class="form-control" name="product_ID" value="<%= product.getProductId()%>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Product Name</label>
                                <input type="text" class="form-control" name="product_name" value="<%= product.getProductName()%>">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Product Description</label>
                                <input type="text" class="form-control" name="product_description" value="<%= product.getProductDescription()%>">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Stock</label>
                                <input type="text" class="form-control" name="stock" value="<%= product.getStock()%>">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Price</label>
                                <input type="text" class="form-control" name="price" value="<%= product.getPrice()%>">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Weight (KG)</label>
                                <input type="text" class="form-control" name="weight" value="<%= product.getProductWeight()%>">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Product Image Link</label>
                                <input type="text" class="form-control" name="product_image" value="<%= product.getProductImage()%>">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Free shipment?</label>
                                <input type="checkbox" name="shipment" value="free_shipment" style="margin-left:10px;">
                            </div>

                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="product_id" value="<%= product.getProductId()%>"/>
                    </div>

                    <div class="modal-footer">
                        <button type="button submit" class="btn btn-secondary" onclick="window.history.go(-1);">Close</button>
                        <input type="submit" name="update" class="btn btn-primary" value="Update Product"/>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="../styling/vendor/bootstrap/js/popper.js"></script>
        <script src="../styling/vendor/bootstrap/js/bootstrap.min.js"></script>

        <script>
                    $(document).ready(function () {
                        $('#updateItem').modal('show');
                    });
        </script>

    </body>



</html>
