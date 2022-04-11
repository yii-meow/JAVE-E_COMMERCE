/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function pieChart(s,y,z) {

//Categories
    let labels1 = [s, y, z];
// Values
    let data1 = [60, 31, 9];
// Display Color
    let colors1 = ['49A9EA', '#36CAAB', '#b91d47'];


    let myChart1 = document.getElementById("myChart").getContext('2d');

    let chart1 = new Chart(myChart1, {

        type: 'doughnut',
        data: {
            labels: labels1,
            datasets: [{
                    data: data1,
                    backgroundColor: colors1
                }]
        },
        options: {
            title: {
                text: "Do you like doughnuts?",
                display: true
            }
        }
    });

}
