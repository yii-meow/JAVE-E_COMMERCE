<%-- 
    Document   : Report3
    Created on : 10-Apr-2022, 23:27:25
    Author     : jensienwong
--%>
<jsp:include page="sidebar.jsp"/> 
<%@page import="java.util.ArrayList"%>
<%

    ArrayList<String> prodName = (ArrayList<String>) session.getAttribute("prodName");
    ArrayList<Integer> numOfMale = (ArrayList<Integer>) session.getAttribute("numOfMale");
    ArrayList<Integer> numOfFemale = (ArrayList<Integer>) session.getAttribute("numOfFemale");
    String backgroundMaleColor = "\'rgba(3,198,252,0.3)\'";
    String borderMaleColor = "\'rgba(3,198,252,1)\'";
    String backgroundFemaleColor = "\'rgba(245,110,209,0.3)\'";
    String borderFemaleColor = "\'rgba(245,110,209,1)\'";

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js" integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="../styling/DateRange.css"/>
        <title>Report</title>     
        <style>
            .chartBox{
                height: 300px;
            }
        </style>
    </head>
    <body>
        <div class="chartCard">
            <div class="chartBox">
                <canvas id="myChart"></canvas>    
            </div>
        </div>

        <script>
            //Categories
            let labels1 = <%= prodName%>;
            // Values
            let data1 = <%= numOfMale%>;
            let data2 = <%= numOfFemale%>;
            let bgcolors1 = <%= backgroundMaleColor%>
            let bgcolors2 = <%= backgroundFemaleColor%>
            let bcolors1 = <%= borderMaleColor%>
            let bcolors2 = <%= borderFemaleColor%>
            let title1 = 'Customer Gender Analaysis';

            const data = {

                labels: labels1,
                datasets: [{
                        label: 'Male',
                        data: data1,
                        backgroundColor: bgcolors1,
                        borderColor: bcolors1,
                        borderWidth: 1
                    }, {
                        label: 'Female',
                        data: data2,
                        backgroundColor: bgcolors2,
                        borderColor: bcolors2,
                        borderWidth: 1
                    }]


            };
            // Display Color

            let myChart1 = document.getElementById("myChart").getContext('2d');
            let chart1 = new Chart(myChart1, {

                type: 'bar',
                data: data,
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: title1
                        }
                    },
                    scales: {
                        amount: {
                            type: 'linear',
                            position: 'left',
                            min: 0,
                            max: 20
                        }
                    }
                }
            });
        </script>
    </body>
</html>
