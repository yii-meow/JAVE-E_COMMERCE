/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import Domain.StaffService;
import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jensienwong
 */
public class AddStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    StaffService service = new StaffService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processAddStaff(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processAddStaff(request, response);
    }

    protected void processAddStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String submitType = request.getParameter("submitType");
        if (submitType.equals("Clear")) {
            HttpSession session = request.getSession();
            session.setAttribute("firstName", "");
            session.setAttribute("lastName", "");

            Staff staff = new Staff("", "", "");
            session.setAttribute("newStaff", staff);
            response.sendRedirect("staff/AddStaff.jsp");
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String ic = request.getParameter("ic");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        char position = 'S';


        //Validation
        boolean validateResult = validationInfo(firstName, lastName, ic, email, phoneNumber);
//        boolean validateResult = true;
        if (validateResult) {
            //Correct Info

            String id = generateNewStaffId();
            String name = lastName + " " + firstName;

            if (submitType.equals("Add")) {
                //Retrive Value From AddStaff.jsp        

                String dateJoin = generateDate();
                Staff staff = new Staff(id, name, ic, email, phoneNumber, dateJoin, position);

                HttpSession session = request.getSession();
                session.setAttribute("firstName", firstName);
                session.setAttribute("lastName", lastName);
                session.setAttribute("newStaff", staff);

                response.sendRedirect("staff/SetUpPassword.jsp");

            }
        } else {
            //Incorrect Info
            Staff staff = new Staff(ic, email, phoneNumber);
            HttpSession session = request.getSession();
            String errMsg = service.getErrMsg();
            session.setAttribute("firstName", firstName);
            session.setAttribute("lastName", lastName);
            session.setAttribute("errMsg", errMsg);
            session.setAttribute("newStaff", staff);
            session.setAttribute("webSite", "staff/AddStaff.jsp");
            response.sendRedirect("staff/StaffInfoException.jsp");
        }
    }

    public String generateNewStaffId() {

        String newId;
        String oldId;
        int generateNewId;

        Query query = em.createNamedQuery("Staff.findAll");
        List<Staff> staffList = query.getResultList();

        //Get latest id
        oldId = staffList.get(staffList.size() - 1).getStaffID();
        oldId = oldId.replaceAll(String.valueOf(oldId.charAt(0)), "");

        //ID code add 1
        generateNewId = Integer.parseInt(oldId) + 1;

        newId = String.valueOf(generateNewId);
        if (newId.length() == 1) {
            newId = "S00" + newId;
        } else if (newId.length() == 2) {
            newId = "S0" + newId;
        } else {
            newId = "S" + newId;
        }

        return newId;
    }

    public String generateDate() {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formateDate = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return currentDate.format(formateDate);
    }

    public boolean validationInfo(String firstName, String lastName, String ic, String email, String phoneNumber) {

        //Return TRUE if all corect
        //Return FALSE if all corect
        return service.staffInfoValidation(firstName, lastName, ic, email, phoneNumber);
    }

}
