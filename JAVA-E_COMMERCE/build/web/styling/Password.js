/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function showPass(psw) {
    alert("Password: " + psw);
}

var state = false;

function showPassword() {
    if (state)
    {
        document.getElementById("password").setAttribute("type", "password");
        state = false;
    } else {
        document.getElementById("password").setAttribute("type", "text");
        state = true;
    }
}

function showConfirmPassword() {
    if (state)
    {
        document.getElementById("confirmPassword").setAttribute("type", "password");
        state = false;
    } else {
        document.getElementById("confirmPassword").setAttribute("type", "text");
        state = true;
    }
}

function showOldPassword() {
    if (state)
    {
        document.getElementById("oldPassword").setAttribute("type", "password");
        state = false;
    } else {
        document.getElementById("oldPassword").setAttribute("type", "text");
        state = true;
    }
}