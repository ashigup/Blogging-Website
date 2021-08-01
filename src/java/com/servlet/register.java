/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.userDao;
import com.entities.message;
import com.entities.user;
import com.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ektar
 */
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");
           
            out.println("</head>");
            out.println("<body>");

//            fetching data
            String check = request.getParameter("check");

            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String about = request.getParameter("about");

            if (check == null || first_name.isEmpty() || last_name.isEmpty() || email.isEmpty() || password.isEmpty() || gender.isEmpty()) {
               
              message msg=new message("Registration Unsuccessful","error","alert-danger");
               HttpSession s=request.getSession();
               s.setAttribute("msg",msg);
                response.sendRedirect("sign_up.jsp");

                
            } else {

                user u = new user(first_name, last_name, email, password, gender, about);

                userDao dao = new userDao();
                boolean f = dao.saveUser(u);

                if (f == true) {
                      message msg=new message("Registration Successful","error","alert-success");
               HttpSession s=request.getSession();
               s.setAttribute("msg",msg);
               
                     response.sendRedirect("login.jsp");

                } else {
                   message msg=new message("Registration Unsuccessful","error","alert-danger");
               HttpSession s=request.getSession();
               s.setAttribute("msg",msg);
                response.sendRedirect("sign_up.jsp");
                }
            }

            
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
        processRequest(request, response);
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
