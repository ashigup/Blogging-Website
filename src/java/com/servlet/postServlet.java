/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.postDao;
import com.entities.message;
import com.entities.post;
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
public class postServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet postServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("herereee");
            String cIds=request.getParameter("category");
             HttpSession s=request.getSession();
            
           
            
            String pTitle=request.getParameter("pTitle");
            String pDesc=request.getParameter("pDesc");
            Part part=request.getPart("pImg");
            String pImage=part.getSubmittedFileName();
             
             if( cIds==null || pTitle.isEmpty() )
            {
                 message msg=new message("Posting Failed","error","alert-danger");
                System.out.println("Hereeeeeeeeeeeeeeeee");
                s.setAttribute("msg",msg);
                 response.sendRedirect("profile.jsp");
            }
             
             
             else{
            int cid=Integer.parseInt(cIds);
             user u=(user)s.getAttribute("current_user");
             int userId=u.getID();
             out.println( cid+"  "+pTitle+"  "+pDesc+"  "+pImage+ "  "+userId);
             if(pImage.isEmpty())
                 pImage="default.png";
             post p=new post(cid,pTitle,pDesc,pImage,userId);
             postDao pDao=new postDao();
             
             out.println("posted");  
             
             if(    pDao.savePost(p)==true)
             {
               out.println("Successfully posted");  
               String path=request.getRealPath("/")+"blog_pics"+File.separator+pImage;
                      helper.saveFile(part.getInputStream(), path);
                      
                      
                       message msg=new message("Posted successfully","error","alert-success");
              
               s.setAttribute("msg",msg);
                response.sendRedirect("profile.jsp");
             }
             else
             {
                  message msg=new message("Posting Failed","error","alert-error");
              
                s.setAttribute("msg",msg);
                 response.sendRedirect("profile.jsp");
             }
             
            out.println("</body>");
            out.println("</html>");
        }
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
