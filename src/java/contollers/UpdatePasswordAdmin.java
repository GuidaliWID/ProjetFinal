/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contollers;

import entities.Admin;
import entities.Client;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.AdminService;
import service.ClientService;
import service.UserService;
import util.Util;

/**
 *
 * @author hp
 */
@WebServlet(name = "UpdatePasswordAdmin", urlPatterns = {"/UpdatePasswordAdmin"})
public class UpdatePasswordAdmin extends HttpServlet {

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
        String password=request.getParameter("password");
        String passwordcnf=request.getParameter("passwordcnf");
        //AdminService as = new AdminService();
        UserService us=new UserService();
      if(password.equals(passwordcnf)){
          HttpSession session = request.getSession();
          //Admin a = (Admin) session.getAttribute("admin");
          User u = (User)session.getAttribute("admin");
          //a.setPassword(Util.md5(password));
          //as.update(a);
          u.setPassword(Util.md5(password));
          us.update(u);
          response.sendRedirect("Authen.jsp?email="+u.getEmail());
      }
      else{
          response.sendRedirect("UpdatePassword.jsp?msg=Vous n'avez pas saisi le meme mot de passe");
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
