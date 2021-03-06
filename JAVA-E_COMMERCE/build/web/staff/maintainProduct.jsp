<%-- 
    Document   : maintainProduct
    Created on : Apr 6, 2022, 1:14:47 PM
    Author     : yikso
--%>
<%@page import="java.lang.Math.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product, java.util.*"%>
<jsp:include page="sidebar.jsp"/>
<jsp:include page="../maintainProduct"/>

<% List<Product> product = (List<Product>) session.getAttribute("product");%>
<% Double overall_rating = (Double) session.getAttribute("overall_rating");%>
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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


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

        <title>Maintain Product</title>
    </head
    <body>
        <div class="contentCenter">

            <div style="font-size:20px;color:#a2ec15;font-weight:bold;margin-left:25px;">
                <!-- Display Shop Overall Rating in Star -->
                Shop Average Rating </br>
                <span style="font-size:30px;"><%= String.format("%.2f", overall_rating)%> / 5.0</span></br>

                <div style="font-size:40px;">
                    <!-- CHECK THE WHOLE NUMBER OF RATING AND DISPLAY A COMPLETE STAR -->
                    <% for (int i = 0; i < Math.floor(overall_rating % 10); i++) {
                            out.println("<i class='bi bi-star-fill'></i>");
                        }

                        // IF > 0.5 WILL BE GRANTED A HALF STAR
                        if ((overall_rating % 1.0) >= 0.5) {
                            out.println("<i class='bi bi-star-half'></i>");
                        } else if (overall_rating % 1.0 != 0) {

                            // IF < 0.5 WILL BE GRANTED AN EMPTY STAR
                            out.println("<i class='bi bi-star'></i>");
                        }

                        // PRINT REMAINING EMPTY STAR
                        for (int i = 0; i < Math.floor(5 - overall_rating); i++) {
                            out.println("<i class='bi bi-star'></i>");
                        }
                    %>

                </div>
            </div>


            <div style="text-align:center">
                <span class="badge badge-success badge-pill" style="font-size:1.5rem;">
                    Maintain Product
                </span>
            </div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createProduct" data-whatever="@mdo" style="margin-left:15px;margin-top:20px;">
                Create New Product
            </button>

            <div class="card-group" style="margin-top:20px;text-align:center">
                <%                for (int i = 0; i < product.size(); i++) {
                        Product productDetails = product.get(i);
                %>
                <div style="text-align:center">
                    <div class="card text-white bg-dark mb-3" style="width: 16.5rem;height:40em;margin-left:15px;">
                        <div class="card-body" style="height:230px;">
                            <img class="card-img-top" src="<%= productDetails.getProductImage()%>" alt="Product Image" style="width:200px;height:200px;">
                        </div>

                        <div class="card-body" id="details">
                            <form action="../maintainProduct" method="POST">                            
                                <!-- SHOW PRODUCT DETAILS -->
                                <p class="card-text">ID: <%= productDetails.getProductId()%></p>
                                <p class="card-text"><%= productDetails.getProductName()%></p>
                                <p class="card-text"><%= productDetails.getProductDescription()%></p>
                                <p class="card-text"><%= String.format("RM %.2f", productDetails.getPrice())%></p>
                                <p class="card-text">Stock: <%= productDetails.getStock()%></p>
                                <p class="card-text">Weight: <%=  String.format("%.2f KG", productDetails.getProductWeight())%></p>
                                <p class="card-text">
                                    Free Shipment: <%= productDetails.getIsShipmentFree()%>
                                </p>
                                <p class="card-text"> 
                                    Rating: <%= productDetails.getAverageRating() != 0 ? productDetails.getAverageRating() : "None"%>
                                </p>    

                                <!-- UPDATE PRODUCT -->
                                <button class='btn btn-success btn-sm rounded-0 editButton' type='button submit' title='Edit' formaction='../updateProduct?id=<%=productDetails.getProductId()%>'"><i class='fa fa-edit'></i></button>

                                <!-- DELETE PRODUCT -->
                                <button class='btn btn-danger btn-sm rounded-0 deleteButton' type='button submit' data-toggle='tooltip' data-placement='top' title='Delete' type='submit'><i class='fa fa-trash'></i></button></a>

                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="delete_item" value="<%= productDetails.getProductId()%>"/>
                            </form>

                        </div>
                    </div>
                </div>
                <% }%>

                <!--===============================================================================================-->
                <script src="../styling/vendor/bootstrap/js/popper.js"></script>
                <script src="../styling/vendor/bootstrap/js/bootstrap.min.js"></script>
            </div>
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
                                <label for="message-text" class="col-form-label">Product Image Link</label>
                                <input type="text" class="form-control" name="product_image">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Free shipment?</label>
                                <input type="checkbox" name="shipment" value="free_shipment" style="margin-left:10px;">
                            </div>

                            <input type="hidden" name="action" value="create"/>
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
