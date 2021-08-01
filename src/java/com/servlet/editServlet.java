/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.userDao;
import com.entities.message;
import com.entities.user;
import com.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ektar
 */
@MultipartConfig
public class editServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String userPassword=request.getParameter("password");
            String userAbout=request.getParameter("about");
            
            Part part=request.getPart("image");
            String imgName=part.getSubmittedFileName();
            
          out.println(imgName);
            
            HttpSession s=request.getSession();
            user u = (user)s.getAttribute("current_user");
            String oldImgName=u.getProfile();
            u.setAbout(userAbout);
            if(userPassword.length()>0)
            u.setPassword(userPassword);
            
            
             if(imgName.length()>0){
              u.setProfile(imgName);
            
            }
            userDao dao=new userDao();
            boolean f=dao.updateUser(u);
            
            if (f == true) {
                      message msg=new message("Profile Updated","error","alert-success");
                    
                      if( imgName.length()>0 && imgName!="default.png")
                      {
                       String oldPath=request.getRealPath("/")+"pics"+File.separator+oldImgName;
                       helper.deleteFile(oldPath);
                      
                      String path=request.getRealPath("/")+"pics"+File.separator+u.getProfile();
                      helper.saveFile(part.getInputStream(), path);
                      }
                      
               s.setAttribute("msg",msg);
               
                     response.sendRedirect("profile.jsp");

                } else {
                   message msg=new message("Updation Unsuccessful","error","alert-danger");
              
               s.setAttribute("msg",msg);
                response.sendRedirect("profile.jsp");
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
