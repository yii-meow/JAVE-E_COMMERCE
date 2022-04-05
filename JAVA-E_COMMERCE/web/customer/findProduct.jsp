<html lang="en">
    <head>
        <title>Customer Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="../styling/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../styling/css/util.css">
        <link rel="stylesheet" type="text/css" href="../styling/css/main.css">
        <!--===============================================================================================-->

        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            .topnav {
                overflow: hidden;
                background-color: #e9e9e9;
            }

            .topnav a {
                float: left;
                display: block;
                color: black;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            .topnav a.active {
                background-color: #2196F3;
                color: white;
            }

            .topnav .search-container {
                float: right;
            }

            .topnav input[type=text] {
                padding: 6px;
                margin-top: 8px;
                font-size: 17px;
                border: none;
            }

            .topnav .search-container button {
                float: right;
                padding: 6px 10px;
                margin-top: 8px;
                margin-right: 16px;
                background: #ddd;
                font-size: 17px;
                border: none;
                cursor: pointer;
            }

            .topnav .search-container button:hover {
                background: #ccc;
            }
        </style>
    </head>
    <body>        
        <div class="topnav">
            <a class="active" href="#home">Home</a>

            <div class="search-container">
                <form action="../filterProduct" method="POST">
                    <input type="text" placeholder="Search.." name="item_name">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>

        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#AdvancedfilterProduct">Filter
        </button>

        <!--Bootstrap Modal for Filtering Product-->
        <div class="modal fade" id="AdvancedfilterProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Filter Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="filterProduct" method="POST">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Stock</label>
                                <select>
                                    <option value="item_name">Name</option>
                                    <option value="stock">Name</option>
                                    <option value="min_price">Name</option>
                                    <option value="max_price">Name</option>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Price</label>
                                <input type="text" class="form-control" name="username">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Shipment free</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Register"/>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="../styling/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="../styling/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="../styling/vendor/bootstrap/js/popper.js"></script>
        <script src="../styling/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="../styling/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="../styling/vendor/daterangepicker/moment.min.js"></script>
        <script src="../styling/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="../styling/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="../styling/js/main.js"></script>

    </body>
</html>