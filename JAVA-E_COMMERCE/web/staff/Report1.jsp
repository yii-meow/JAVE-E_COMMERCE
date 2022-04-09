<%-- 
    Document   : Report1
    Created on : 08-Apr-2022, 23:12:05
    Author     : jensienwong
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<String> prodName = (ArrayList<String>) session.getAttribute("prodArray");
    ArrayList<Integer> prodQuantity = (ArrayList<Integer>) session.getAttribute("prodQuantity");
%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js" integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <title>Report</title>
        <style>

            .chartCard{
                width: 100vw;
                height: calc(100vh-40px);
                background: rgba(255,26,104,0.2);
                display:flex;
                align-items: center;
                justify-content: center;
            }
            .chartBox{
                width: 700px;
                padding:20px;
                border-radius: 20px;
                border: 3px solid rgba(255,26,104,1);
                background: white;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>

        <div class="chartCard">
            <div class="chartBox">
                <canvas id="myChart"></canvas>    
            </div>
        </div>

        <script>
//generate color
            const colorLabel = [];
            for (i = 0; i < <%= prodName.size()%>; i++) {
                const r = Math.floor(Math.random() * 255);
                const g = Math.floor(Math.random() * 255);
                const b = Math.floor(Math.random() * 255);
                colorLabel.push("rgba(" + r + ", " + g + ", " + b + ", 0.5)");
            }

//prodId
            let labels1 = <%= prodName%>;
// prodQuantity
            let data1 = <%= prodQuantity%>;
// Label Color
            let colors1 = colorLabel;
            let pieChartTitle = 'Most Popular Product';
            let myChart1 = document.getElementById("myChart").getContext('2d');
            let chart1 = new Chart(myChart1, {
                type: 'pie',
                data: {
                    labels: labels1,
                    datasets: [{
                            data: data1,
                            backgroundColor: colors1
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: pieChartTitle
                    },
                    legend: {
                        position: 'right'
                    },
//                    plugins: {
//                        tooltip: {
//                            enabled: false;
//                        }
//                    }
                },
                plugins: [ChartDataLabels]
            });


        </script>
    </body>
    <footer>

    </footer>
</html>

