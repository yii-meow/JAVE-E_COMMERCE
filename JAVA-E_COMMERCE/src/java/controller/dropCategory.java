/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import entity.Staff;
import java.io.*;
import java.util.*;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

public class dropCategory extends HttpServlet{
 
   @PersistenceContext
   EntityManager em;
   
   @Resource
    UserTransaction utx;
   
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws  ServletException,IOException{
   
   }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException,IOException{
      recordViewAction(request, response);
   }

   protected void recordViewAction(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
      
    if(request.getParameter("Staff") !=null){
       response.sendRedirect("StaffCRUD.jsp");
    }
   }
    
}
