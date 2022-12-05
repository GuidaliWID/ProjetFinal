<%@page import="entities.Admin"%>
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
        <title>Suppression des categories</title>
        <link href="style/ann.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
        <div class="center">
        <form action="SupprimerCategorie" method="POST">
            <h1>Supprimer une categorie</h1>
                
                 <table border="0" >  
                      
                       
                    <tr>
                            
                            <td>
                                
                    
                <div class="select-btn"><select
                      class="custom-select tm-select-accounts"
                      id="category"  name="categorie"                    >		
                        <option selected>Selectionner une categorie</option><%
                            CategorieService es = new CategorieService();
                            for(Categorie e : es.getAll()){
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



