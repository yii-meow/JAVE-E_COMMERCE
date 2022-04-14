<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.Review"%>
<jsp:include page="sidebar.jsp"/>
<%
    List<Review> review = (List<Review>) session.getAttribute("reviewList");
    ArrayList<Integer> allRating = (ArrayList<Integer>) session.getAttribute("allRating");
    ArrayList<String> ratingLabel = (ArrayList<String>) session.getAttribute("ratingLabel");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="../styling/DateRange.css"/>
        <title>Check Review Details</title>
        <style>
            .ratingTable{
                margin: auto;
                background-color: white;
                width: 70%;
            }
            .ratingTable th,.ratingTable td{
                border: 1px solid black;
            }
            .ratingTable th{
                background-color: gainsboro;
                text-align: center;
            }
            .ratingTable tr:hover{
                background-color: gainsboro;
            }
            
            #reviewId{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="contentCenter">
            <div align="center">
                <table class="ratingTable" border="1" cellpadding="5" >
                    <caption><h2>List of Customer Review</h2></caption>
                    <tr>
                        <th>Review ID</th>
                        <th>Customer ID</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Rating</th>
                        <th>Review Comment</th>
                    </tr>

                    <%                  for (int a = 0; a < review.size(); a++) {
                    %>
                    <tr>
                        <td id="reviewId"><%= review.get(a).getReviewId()%></td>
                        <td id="reviewId"><%= review.get(a).getCustomerId()%></td>
                        <td id="reviewId"><%= review.get(a).getProductId().getProductId()%></td>
                        <td ><%= review.get(a).getProductName()%></td>
                        <td id="reviewId"><%= review.get(a).getRating()%></td>
                        <td><%= review.get(a).getReviewComment()%></td>
                    </tr>

                    <% }%>
                </table>
                <div class="chartCard">
                    <div class="chartBox">
                        <canvas id="myChart"></canvas>    
                    </div>
                </div>
                <script>
                    //prodId
                    let labels1 = <%= ratingLabel%>;
                    // prodQuantity
                    let data1 = <%= allRating%>;
                    // Label Color
                    let colors1 = "rgba(153, 102, 255,0.3)";
                    let colors2 = "rgba(153, 102, 255,0.7)";
                    let pieChartTitle = 'Average Rating of Product ';
                    let myChart1 = document.getElementById("myChart").getContext('2d');
                    let chart1 = new Chart(myChart1, {
                        type: 'bar',
                        data: {
                            labels: labels1,
                            datasets: [{
                                    label: 'Rating',
                                    data: data1,
                                    backgroundColor: colors1,
                                    borderColor: colors2,
                                    axis: 'y'
                                }],
                            borderwidth: 1
                        },
                        options: {
                            indexAxis: 'y'
                        }
                    });
                </script>
            </div>
        </div>
    </body>
</html>