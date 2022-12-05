/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contollers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ClientService;
import entities.Client;
import javax.servlet.http.HttpSession;
import service.UserService;
import entities.User;
import entities.Admin;
import service.AdminService;
import util.Util;

/**
 *
 * @author hp
 */
@WebServlet(name = "Authentification", urlPatterns = {"/Authentification"})
public class Authentification extends HttpServlet {

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
        
        String type  = request.getParameter("type");
        //UserService cl = new UserService();
        //User c = cl.getByEmail(email);
        if(type.equals("Client")){
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            ClientService cl = new ClientService();
            Client c = cl.getByEmail(email);
        if (c != null) {
            if (c.getPassword().equals(Util.md5(password))) {
                  HttpSession session = request.getSession();
                  session.setAttribute("client", c);
                //c.setEtat(1);
                //cl.update(c);
                  response.sendRedirect("Client.jsp");  
                
            } else {
                response.sendRedirect("Authentification.jsp?msg=Mot de passe incorrect");
            } 
        
        }
        else {
            response.sendRedirect("Authentification.jsp?msg=Email introuvable");
            }
        }
        
        
        if(type.equals("Admin")){
            String emails = request.getParameter("emails");
            String passwords = request.getParameter("passwords");
            AdminService al = new AdminService();
            Admin a = al.getByEmail(emails);
        if (a != null) {
            if (a.getPassword().equals(Util.md5(passwords))) {
               
                  HttpSession session = request.getSession();
                  session.setAttribute("admin", a);
                  response.sendRedirect("Admin.jsp"); 
                
                
            } else {
                response.sendRedirect("Authentification.jsp?msg=Mot de passe incorrect");
            } 
        
        }
        else {
            response.sendRedirect("Authentification.jsp?msg=Email introuvable");
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
