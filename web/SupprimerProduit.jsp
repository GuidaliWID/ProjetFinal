<%@page import="service.ProduitService"%>
<%@page import="entities.Produit"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suppression des produits</title>
        <link href="style/ann.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
        <div class="center">
        <form action="SupprimerProduit" method="POST">
            <h1>Supprimer un produit</h1>
                
                 <table border="0" >  
                      
                       
                    <tr>
                            
                            <td>   
                    
              <div class="select-btn"><select
                      class="custom-select tm-select-accounts"
                      id="category"  name="produit"                    >		
                        <option selected>Selectionner un produit</option><%
                            ProduitService es = new ProduitService();
                            for(Produit e : es.getAll()){
                        %>
                            
                            <option><%= e.getNom() %></option>
                           
                       
                        <%}%>
                      
                    </select></div>
                         </td>
                </tr>
                 <tr>
                            
                            <td>
                        <input type="submit" value="Supprimer" />
                        <input class= "reset" onclick="window.location.href = 'html.jsp';" value="    Annuler">
                        
                  </td>
                  </tr> 
               
              
                        
                       </table> 
                  </form>             
               
                        
                       
               
               
            
        
        </div>
                        
    </body>
    
</html>
