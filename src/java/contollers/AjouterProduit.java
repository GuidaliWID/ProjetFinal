/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contollers;

import java.io.File;
import entities.Produit;
import entities.Categorie;
import entities.Marque;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CategorieService;
import service.MarqueService;
import service.ProduitService;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Part;
import java.io.InputStream;

import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author hp
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024* 2, maxFileSize = 1024 * 1024* 10,maxRequestSize = 1024 * 1024* 50)
@WebServlet(name = "AjouterProduit", urlPatterns = {"/AjouterProduit"})
public class AjouterProduit extends HttpServlet {

    
        private String UPLOAD_DIRECTORY;
       
        String path;
        
        
    
        
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
       
    }

    public boolean uploadFile(InputStream is, String path){
            boolean test=false;
            try {
            
                byte[] byt = new byte[is.available()];
                is.read();
                FileOutputStream fops =new FileOutputStream(path);
                fops.write(byt);
                fops.flush();
                fops.close();
                test=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
            return test;
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
        
       /* UPLOAD_DIRECTORY = getServletContext().getRealPath("/").replace("build\\", "") + "ressource" + File.separator + "images";
        //process only if its multipart content
        
                String nom = request.getParameter("name");
                String des = request.getParameter("description");
                        String cat = request.getParameter("categorie");
                    String marque = request.getParameter("marque");
                    float prix = Float.parseFloat(request.getParameter("prix"));
                    
            try {
                
                
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                String name = null;
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        name = new File(item.getName()).getName();
                        System.out.println(item.getName());
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                        path = UPLOAD_DIRECTORY + File.separator + name;
                    } 
                    
                    
                }
                //File uploaded successfully
                
                ProduitService ps = new ProduitService();
                    MarqueService ms = new MarqueService();
                    CategorieService cs = new CategorieService();
                    ps.create(new Produit(nom,des,prix,name,ms.findByNom(marque),cs.findByNom(cat)));
                
            } catch (Exception ex) {
                
            }
        
           response.sendRedirect("AjouterProduit.jsp");*/
        
            UPLOAD_DIRECTORY = getServletContext().getRealPath("/").replace("build\\", "") + "ressource" + File.separator + "images";
            
            
            String nom = request.getParameter("name");
            String des = request.getParameter("description");
            String cat = request.getParameter("categorie");
            String marque = request.getParameter("marque");
            float prix = Float.parseFloat(request.getParameter("prix"));
            
            ProduitService ps = new ProduitService();
            MarqueService ms = new MarqueService();
            CategorieService cs = new CategorieService();
        
        
           if (ServletFileUpload.isMultipartContent(request)) { 
            
            Part part = request.getPart("image");
            String name=null;
            //String namep=part.getSubmittedFileName();
             String namep=extract(part);
            
            name =new File(UPLOAD_DIRECTORY +File.separator+namep).getName();
            
            path= UPLOAD_DIRECTORY +File.separator + namep;
            
            //part.write(path+File.separator);
            
                InputStream is=part.getInputStream();
                uploadFile(is,path);
                
              
            ps.create(new Produit(nom,des,prix,name,ms.findByNom(marque),cs.findByNom(cat)));
           } 
            
            
            //name = new File(request.getParameter("description")).getName();
            //Part part = request.getPart("image");
       
           response.sendRedirect("AjouterProduit.jsp");
            
            

        
        
        
        
        
        /*String nom = request.getParameter("name");
            String des = request.getParameter("description");
            String cat = request.getParameter("categorie");
            String marque = request.getParameter("marque");
            float prix = Float.parseFloat(request.getParameter("prix"));
            String image = request.getParameter("image");
            ProduitService ps = new ProduitService();
            MarqueService ms = new MarqueService();
            CategorieService cs = new CategorieService();
         
            ps.create(new Produit(nom,des,prix,image,ms.findByNom(marque),cs.findByNom(cat)));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/AjouterProduit.jsp");
            dispatcher.forward(request, response);*/
        
        
            
        
        
        //InputStream inputStream = null;
        //Part filePart = request.getPart("photo");
        //inputStream = filePart.getInputStream();
        
         
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

    private String extract(Part part){
        String cont=part.getHeader("content-disposition");
        String [] items=cont.split(";");
        for(String s:items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2,s.length()-1);
            }
        }
        return "";
    }
    
}
