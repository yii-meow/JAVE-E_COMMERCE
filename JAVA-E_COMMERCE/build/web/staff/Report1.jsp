<%-- 
    Document   : Report1
    Created on : 08-Apr-2022, 23:12:05
    Author     : jensienwong
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="sidebar.html"/>

<%
    ArrayList<String> prodName = (ArrayList<String>) session.getAttribute("prodArray");
    ArrayList<String> prodPercentagesArray = (ArrayList<String>) session.getAttribute("prodPercentagesArray");
    ArrayList<String> displayProdName = (ArrayList<String>) session.getAttribute("displayProdArray");
    ArrayList<String> displayProdPercentagesArray = (ArrayList<String>) session.getAttribute("displayProdPercentagesArray");
    ArrayList<Integer> displayQuantity = (ArrayList<Integer>) session.getAttribute("displayQuantity");

    ArrayList<String> backgroundProdColorLabels = new ArrayList<String>();
    ArrayList<String> borderProdColorLabels = new ArrayList<String>();
    ArrayList<String> backgroundProdColorLabels2 = new ArrayList<String>();
    ArrayList<String> borderProdColorLabels2 = new ArrayList<String>();

    Double[] r = new Double[prodPercentagesArray.size()];
    Double[] g = new Double[prodPercentagesArray.size()];
    Double[] b = new Double[prodPercentagesArray.size()];

//GENERATE COLOR
    for (int a = 0; a < prodPercentagesArray.size(); a++) {
        r[a] = Math.floor(Math.random() * 255);
        g[a] = Math.floor(Math.random() * 255);
        b[a] = Math.floor(Math.random() * 255);
        String rgba = String.format("\'rgba( %.0f, %.0f, %.0f, 0.3)\'", r[a], g[a], b[a]);
        backgroundProdColorLabels.add(rgba);
        rgba = String.format("\'rgba( %.0f, %.0f, %.0f, 0.7)\'", r[a], g[a], b[a]);
        borderProdColorLabels.add(rgba);
        rgba = String.format("rgba( %.0f, %.0f, %.0f, 0.3)", r[a], g[a], b[a]);
        backgroundProdColorLabels2.add(rgba);
        rgba = String.format("rgba( %.0f, %.0f, %.0f, 0.7)", r[a], g[a], b[a]);
        borderProdColorLabels2.add(rgba);
    }
%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js" integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Bootstrap core CSS -->
        <link href="../styling/bootstrap.min.css" rel="stylesheet">
        <title>Report</title>
        <style>

            body{
                background: rgba(255,26,104,0.2);
            }

            .table{
                margin: auto;
                width: fit-content;
                padding:20px;
                border-radius: 20px;
                border: 3px solid rgba(255,26,104,1);
                background: white;
                margin-bottom: 8px;
            }

            table{
                margin: auto;
            }

            table th{
                text-align: center;
                vertical-align: middle;
            }

            table th#prodName{
                min-width: 200px;
            }

            table td#quantity, td#precentage{
                min-width: 80px;
                text-align: center;
                vertical-align: middle;
            }

            table td#colorLabel{
                width: 70px;
            }

            table td#prodName{
                padding-left: 10px;
            }

            td{
                padding: 8px;
            }

            span#colorLabel{
                margin: auto;
                width: 50px;
                height: 20px;
                display: block;
                border: 1px solid black;
            }

            table tr:hover {
                background-color: #ddd;
            }

            .chartCard{
                width: 100vw;
                height: calc(100vh-40px);
                display:flex;
                align-items: center;
                justify-content: center;
            }
            .chartBox{
                width: 40%;
                padding:20px;
                border-radius: 20px;
                border: 3px solid rgba(255,26,104,1);
                background: white;
            }
            
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
    </head>
    <body>
        
        <div class="table">
            <table>
                <tr>
                    <th id="colorLabel">Label</th>
                    <th id="prodName">Product Name</th>
                    <th id="quantity">Quantity</th>
                    <th id="precentage">Percentage</th>
                </tr>
                <%                    
                    for (int a = 0; a < prodPercentagesArray.size(); a++) {
                %>
                <tr>
                    <td id="colorLabel"><span id="colorLabel" style="background-color: <%= backgroundProdColorLabels2.get(a)%>; border: 2px solid <%=borderProdColorLabels2.get(a)%>;"></span></td>
                    <td id="prodName"><%= displayProdName.get(a)%></td>
                    <td id="quantity"><%= displayQuantity.get(a)%></td>
                    <td id="precentage"><%= displayProdPercentagesArray.get(a) + "%"%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div class="chartCard">
            <div class="chartBox">
                <canvas id="myChart"></canvas>    
            </div>
        </div>



        <script>
//prodId
            let labels1 = <%= prodName%>;
// prodQuantity
            let data1 = <%= prodPercentagesArray%>;
// Label Color
            let colors1 = <%= backgroundProdColorLabels%>;
            let colors2 = <%= borderProdColorLabels%>;

            let pieChartTitle = 'Most Popular Product';
            let myChart1 = document.getElementById("myChart").getContext('2d');
            let chart1 = new Chart(myChart1, {
                type: 'pie',
                data: {
                    labels: labels1,
                    datasets: [{
                            data: data1,
                            backgroundColor: colors1,
                            borderColor: colors2
                        }],
                    borderwidth: 0.5
                },
                options: {
                    title: {
                        display: true,
                        text: pieChartTitle
                    },
                    legend: {
                        position: 'right'
                    },
                    tooltips: {
                        enabled: true
                    }
                }
            });
        </script>
        
    </body>
    <footer>

    </footer>
</html>

