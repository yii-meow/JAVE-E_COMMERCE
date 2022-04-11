<%-- 
    Document   : Report1
    Created on : 08-Apr-2022, 23:12:05
    Author     : jensienwong
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Date[] startAndEndDate = (Date[]) session.getAttribute("starAndEndDate");
    ArrayList<String> dailyDate = (ArrayList<String>) session.getAttribute("dateRange");
    ArrayList<Double> subtotal = (ArrayList<Double>) session.getAttribute("subtotal");

    //Format Date
    ArrayList<String> strDateRange = new ArrayList<String>();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    strDateRange.add(dateFormat.format(startAndEndDate[0]));
    strDateRange.add(dateFormat.format(startAndEndDate[1]));

    String title = String.format("\"Sales Report From %s - %s\"", strDateRange.get(0), strDateRange.get(1));
    ArrayList<String> backgroundColorsLabel = new ArrayList<String>();
    ArrayList<String> borderColorsLabel = new ArrayList<String>();
    Double[] r = new Double[dailyDate.size()];
    Double[] g = new Double[dailyDate.size()];
    Double[] b = new Double[dailyDate.size()];

//GENERATE COLOR
    for (int a = 0; a < dailyDate.size(); a++) {
        r[a] = Math.floor(Math.random() * 255);
        g[a] = Math.floor(Math.random() * 255);
        b[a] = Math.floor(Math.random() * 255);
        String rgba = String.format("\'rgba( %.0f, %.0f, %.0f, 0.2)\'", r[a], g[a], b[a]);
        backgroundColorsLabel.add(rgba);
        rgba = String.format("\'rgba( %.0f, %.0f, %.0f, 1)\'", r[a], g[a], b[a]);
        borderColorsLabel.add(rgba);
    }
%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="../styling/DateRange.css"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js" integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <title>Report</title>
        <style>
            .chartBox{
                height: 900px;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <table>
            <form action="../DateRange" method="POST">
                <tr>
                    <th id="label">From</th>
                    <td id="input"><input type="date" name="start_date"></td>
                </tr>
                <tr>
                    <th id="label">To</th>
                    <td id="input"><input type="date" name="end_date"></td>
                </tr>
                <tr>
                    <td id="submit" colspan="3"><input type="submit" value="Generate"></td>
                </tr>

            </form>    
        </table>


        <div class="chartCard">
            <div class="chartBox">
                <canvas id="myChart"></canvas>    
            </div>
        </div>

        <script>
            //Categories
            let labels1 = <%=dailyDate%>;
            // Values
            let data1 = <%=subtotal%>
            // Display Color
            let colors1 = <%=backgroundColorsLabel.get(0)%>
            let colors2 = <%=borderColorsLabel.get(0)%>

            let title1 = <%=title%>;

            let myChart1 = document.getElementById("myChart").getContext('2d');

            let chart1 = new Chart(myChart1, {

                type: 'bar',
                data: {
                    labels: labels1,
                    datasets: [{
                            label: 'Total Amount',
                            data: data1,
                            backgroundColor: colors1,
                            borderColor: colors2,
                            borderWidth: 1,
                            yAxisID: 'amount'
                        }]
                },
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
                            min: 0
                        }
                    }
                }
            });
        </script>

    </body>
    <footer>

    </footer>
</html>

