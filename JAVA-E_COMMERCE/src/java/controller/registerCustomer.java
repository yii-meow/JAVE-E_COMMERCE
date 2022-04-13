/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import entity.Customer;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yikso
 */
@WebServlet(name = "registerCustomer", urlPatterns = {"/registerCustomer"})
public class registerCustomer extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerCustomer at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // OBTAIN THE PARAMETERS FROM FORM
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmed_password = request.getParameter("confirmed_password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Character gender = request.getParameter("gender").charAt(0);

        // CHECK IF PASSWORD MATCH
        if (password.equals(confirmed_password)) {
            try {
                HttpSession session = request.getSession();

                // UPDATE TO DATABASE
                utx.begin();
                Customer customer = new Customer(username, password, name, email, address, gender);
                em.persist(customer);
                utx.commit();

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Register successfully!');");
                out.println("</script>");

                session.setAttribute("customer", customer);
                response.sendRedirect("customer/ViewCustomerProfile");
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        } else {            
            out.println("<script type=\"text/javascript\">");            
            out.println("alert('Please make sure both of your password is matched!');");     
            out.println("window.history.go(-1);</script>");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
