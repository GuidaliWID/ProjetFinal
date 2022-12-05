<%@page import="entities.Admin"%>
<%@page import="service.MarqueService"%>
<%@page import="entities.Marque"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	
        Admin a = (Admin) request.getSession().getAttribute("Admin");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suppression des marques</title>
        <link href="style/ann.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
        <div class="center">
        <form action="SupprimerMarque" method="POST">
            <h1>Supprimer une marque</h1>
                
                    <table border="0" >  
                      
                       
                    <tr>
                            
                            <td>  
                    
                <div class="select-btn"><select
                      class="custom-select tm-select-accounts"
                      id="category"  name="marque"                    >		
                        <option selected>Selectionner une marque</option><%
                            MarqueService es = new MarqueService();
                            for(Marque e : es.getAll()){
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


