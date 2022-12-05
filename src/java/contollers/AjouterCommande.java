/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contollers;

import entities.Cart;
import entities.Client;
import entities.Commande;
import entities.DBConnection;
import entities.LigneCommande;
import entities.LigneCommandePK;
import entities.Produit;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CommandService;
import service.CommandeService;
import service.Connexion;
import service.LigneCommandeService;
import service.ProduitService;

/**
 *
 * @author hp
 */
@WebServlet(name = "AjouterCommande", urlPatterns = {"/AjouterCommande"})
public class AjouterCommande extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            Client c = (Client) request.getSession().getAttribute("Client");

            //if (auth != null) {
                String productId = request.getParameter("id");
                //int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                //if (productQuantity <= 0) {
                //	productQuantity = 1;
                //}
                //Commande commandeModel = new Commande();
                //commandeModel.setId(Integer.parseInt(productId));
               // commandeModel.setClient(c);
                //commandeModel.setEtat("En cours");
               // commandeModel.setDate(new Date());
                CommandeService cs=new CommandeService();
                Commande commande = new Commande(new Date(),"En cours",c);
                cs.create(commande);
                
                //ProduitService ps=new ProduitService();
                //Produit p=ps.getById(Integer.parseInt(productId));
                //Cart cc =new Cart()
                float total=0;
                int quantite=0;
                HttpSession sessio = request.getSession();
                ArrayList<Cart> paniers = (ArrayList<Cart>) sessio.getAttribute("listpr");
                    List<Cart> cartProduct = null;
                    if (paniers != null) {
                        ProduitService pDao = new ProduitService();
                        cartProduct=pDao.getCartProducts(paniers);
                        for (Cart pp : cartProduct) {
                            total += pp.getPrix();
                            if(pp.getId()==Integer.parseInt(productId)){
                                quantite=pp.getQuantity();
                                
                                LigneCommandePK pk= new LigneCommandePK();
                                pk.setCommandeId(commande.getId());
                                pk.setProduitId(pp.getId());
                                
                                LigneCommande lc=new LigneCommande(pk,pp.getPrix(),quantite);
                                LigneCommandeService lcs=new LigneCommandeService();
                                lcs.create(lc);
                                //response.sendRedirect("html.jsp?id="+Integer.parseInt(productId));
                            }
                        }
                    }
                
                
                
                //CommandService orderDao = new CommandService(Connexion.getInstance().getConnection());
                //boolean result = orderDao.insertOrder(commandeModel);
                //if (result) {
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("listpr");
                    if (cart_list != null) {
                        for (Cart ca : cart_list) {
                            if (ca.getId() == Integer.parseInt(productId)) {
                                cart_list.remove(cart_list.indexOf(ca));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("Accueil.jsp");
                //} else {
                //    out.println("order failed");
               // }
           // } else {
            //    response.sendRedirect("Authen.jsp");
           // }

        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
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
