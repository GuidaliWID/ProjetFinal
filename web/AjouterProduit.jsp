<%@page import="entities.Admin"%>
<%@page import="service.MarqueService"%>
<%@page import="entities.Marque"%>
<%@page import="service.CategorieService"%>
<%@page import="entities.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	
        Admin a = (Admin) request.getSession().getAttribute("Admin");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajout des produits</title>
        <link href="style/styleproduit.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
        
    </head>
    <body>
        
        <div class="center">
        <form action="AjouterProduit" method="POST" enctype="multipart/form-data">
            <h1>Ajouter un produit</h1>
                
            
                        <div class="field fname"><div class="input-area">
                                        <input type="text" id="name" name="name" placeholder="Nom de produit"  value=""  />
                        </div></div>
            
            
                        <div class="field lname"><div class="input-area">
                                        <input type="text" name="description" placeholder="Description"  value=""  />
                                        
                        </div></div>
                          
            
                        <div class="field lname"><div class="input-area">
                            <input type="text" name="prix" placeholder="Prix" value=""  />
                                
                                        </div></div>
            
                        <div class="select-btn"><select
                      class="custom-select tm-select-accounts"
                      id="category"  name="categorie">		
                        <option selected>Selectionner une categorie</option><%
                            CategorieService es = new CategorieService();
                            for(Categorie e : es.getAll()){
                        %>
                            
                            <option><%= e.getNom() %></option>
                           
                       
                        <%}%>
                     </select>
                        </div>
                        
                        <div class="select-btn"><select
                      class="custom-select tm-select-accounts"
                      id="category" name="marque"                     >		
                        <option selected>Selectionner une marque</option><%
                            MarqueService ms = new MarqueService();
                            for(Marque e : ms.getAll()){
                        %>
                            
                            <option> <%= e.getNom() %></option>
                           
                       
                        <%}%>
                      
                    </select></div>
                        
                        
                        
                        
                    <div class="field lname"><div class="input-area">
                            <input type="file" name="image" placeholder="Image"  value=""  />
                                
                                    </div></div>
                        
                        <table> <tr>  <td>
                           
                        <input type="submit" value="Ajouter" />
                        <input class="reset" onclick="window.location.href = 'html.jsp';" value="    Annuler">
                           </td>     
                   <tr>
                </table>
                
               
            
        </form>
        </div>
    </body>
    
</html>

