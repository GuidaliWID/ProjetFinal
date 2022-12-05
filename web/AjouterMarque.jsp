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
        <title>Ajout de marque</title>
        <link href="style/new.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
        <div class="center">
        <form action="AjouterMarque" method="POST">
            <h1>Ajouter une marque</h1>
                
                <table border="0" >     
                    
                
                    
                    <tr>
                            
                            <td>
                        <div class="txt_field"><input type="text"  name="marque"  value="" required  /><span></span><label>Nom de Marque</label></div></td>
               
              
                        </tr>
                        
                   <tr>
                            
                            <td>
                    <input type="submit" value="Ajouter" /> 
                    <button class="reset" onclick="window.location.href = 'html.jsp';">Annuler</button>
               </td>
               
              
                        </tr>
                       </table>          
                   
                
                
               
            
        </form>
        </div>
    </body>
    
</html>



