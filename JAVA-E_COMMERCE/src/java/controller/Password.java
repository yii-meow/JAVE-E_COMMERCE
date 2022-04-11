/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author jensienwong
 */
public class Password {

    private String staffPassword;
    private String oldPassword;
    private String password;
    private String confirmPassword;
    private String exMessage;
    private final int minUpperCase = 1;
    private final int minLowerCase = 1;
    private final int minDigit = 1;
    private final int minLength = 8;
    private final int maxLength = 16;

    public Password() {
    }

    public Password(String password, String confirmPassowrd) {
        this.password = password;
        this.confirmPassword = confirmPassowrd;
    }

    public Password(String staffPassword, String oldPassword, String password, String confirmPassowrd) {
        this.staffPassword = staffPassword;
        this.oldPassword = oldPassword;
        this.password = password;
        this.confirmPassword = confirmPassowrd;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
        passwordCheck();
    }

    public boolean passwordCheck() {
        exMessage = "";
        boolean result = true;
        int upperCase = 0;
        int lowerCase = 0;
        int isDigit = 0;

        if (password.length() < minLength) {
            exMessage += "Invalid Password Exception : Minumum Password Length is <b>" + minLength + "</b> Alphanumeric Character.<br>";
        }

        if (password.length() > maxLength) {
            exMessage += "Invalid Password Exception : Maximum Password Length is <b>" + maxLength + "</b> Alphanumeric Character.<br>";
        }

        for (int a = 0; a < password.length(); a++) {
            Character ch = password.charAt(a);

            //If is uppercase
            if (Character.isUpperCase(ch)) {
                upperCase++;
            }

            //If is lowerCase
            if (Character.isLowerCase(ch)) {
                lowerCase++;
            }

            //If is Digit
            if (Character.isDigit(ch)) {
                isDigit++;
            }
        }

        if (upperCase < minUpperCase) {
            exMessage += "Invalid Password Exception : At least one <b>Uppercase</b> Required.<br>";
        }

        if (lowerCase < minLowerCase) {
            exMessage += "Invalid Password Exception : At least one <b>LowerCase</b> Required.<br>";
        }

        if (isDigit < minDigit) {
            exMessage += "Invalid Password Exception : At least one <b>Digit</b> Required.<br>";
        }

        //If Confirm Password not equals password
        if (!password.equals(confirmPassword)) {
            exMessage += "Invalid Password Exception : Passoword and Confirm Password is <b>not mathch</b>.<br>";
        }

        if (!exMessage.equals("")) {
            result = false;
        }

        return result;
    }

    public boolean checkOldPassword() {
        exMessage = "";
        if (oldPassword.equals(staffPassword)) {
            return true;
        } else {
            exMessage += "Invalid Password Exception : <b>Old Password</b> is wrong<br>";
            return false;
        }
    }

    public boolean checkEmpty(String password) {
        if (password.isEmpty() || password.equals(null)) {
            return true;
        } else {
            return false;
        }
    }

    public String getErrorMessage() {
        return exMessage;
    }

}
