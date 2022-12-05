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
        <title>Ajout de categorie</title>
        <link href="style/new.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
        <div class="center">
        <form action="AjouterCategorie" method="POST">
            <h1>Ajouter une categorie</h1>
                
                  <table border="0" >  
                      
                       
                    <tr>
                            
                            <td>
                        <div class="txt_field"><input type="text"  name="name"  value="" required  /><span></span><label>Nom de Categorie</label></div>
               </td>
                </tr>
                
                  <tr>
                            
                            <td> 
                    <input type="submit" value="Ajouter" />
                  <button class="reset" onclick="window.location.href = 'html.jsp';">Annuler</button>
               
                  </td>
                  </tr> 
               
              
                        
                       </table>          
                   
                </div>
                
               
            
        </form>
        </div>
    </body>
    
</html>


