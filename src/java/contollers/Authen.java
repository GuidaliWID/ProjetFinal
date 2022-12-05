/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contollers;

import entities.Admin;
import entities.Client;
import entities.LoginBean;
import entities.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.AdminService;
import service.ClientService;


/**
 *
 * @author hp
 */
@WebServlet(name = "Authen", urlPatterns = {"/Authen"})
public class Authen extends HttpServlet {

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
            throws ServletException, IOException{
       /* 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserService us = new UserService();
        User u = us.getByEmail(email);
        
        
       
            if(type.equals("Client")){
            
            ClientService cl = new ClientService();
            Client c = cl.getByEmail(email);
            if (c != null) {
                if (c.getPassword().equals(Util.md5(password))) {
                  HttpSession session = request.getSession();
                  session.setAttribute("client", c);
                  response.sendRedirect("Client.jsp");  
                
                } else {
                response.sendRedirect("Authentification.jsp?msg=Mot de passe incorrect");
                } 
        
            }
        else {
            response.sendRedirect("Authentification.jsp?msg=Email introuvable");
            }
        }
        
        
        else{
             AdminService al = new AdminService();
             Admin a = al.getByEmail(email);
            if (a != null) {
                 if (a.getPassword().equals(Util.md5(password))) {
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
        
       
        
            
    
    */
        String userName = request.getParameter("email");
        String password = request.getParameter("password");
        //System.out.println("Inside servlet");    
        LoginBean loginBean = new LoginBean();
 
        loginBean.setUserName(userName);
        loginBean.setPassword(password);
 
        LoginDao loginDao = new LoginDao();
 
    try
    {
        String userValidate = loginDao.authenticateUser(loginBean);
 
        if(userValidate.equals("Admin_Role"))
        {
            
            HttpSession session = request.getSession();  
            AdminService al = new AdminService();
            Admin a = al.getByEmail(userName);
            session.setAttribute("Admin", a);
 
            response.sendRedirect("html.jsp");
        }
        
        else if(userValidate.equals("Client_Role"))
        {
            
            HttpSession session = request.getSession();
            //session.setMaxInactiveInterval(10*60);
            ClientService cl = new ClientService();
            Client c = cl.getByEmail(userName);
            session.setAttribute("Client", c);
 
            response.sendRedirect("Accueil.jsp");
        }
        else
        {
            response.sendRedirect("Authen.jsp?msg=Email ou mot de passe incorrect");
 
            
        }
    }
    
    catch (Exception e2)
    {
        e2.printStackTrace();
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
