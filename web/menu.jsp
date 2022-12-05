<%-- 
    Document   : CategMarque
    Created on : 21 nov. 2022, 20:25:50
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="service.CategorieService"%>
<%@page import="entities.Categorie"%>
<!DOCTYPE HTML>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="bootstrap.css" rel="stylesheet">
    
    
  </head>

  <body>
  <br>
  <div class="container">
      <form method="post" action="ModifierCategorie">
          <table>
			                                 
                                                        <tbody>
								<tr>
									 <%
                            CategorieService ms = new CategorieService();
                            for(Categorie e : ms.getAll()){
                        %>
                        <tr>
                             
                            <td><%= e.getNom() %></td>
                            
                        </tr>
                        
                        
									
								</tr>
							</tbody>
                          				
		</table>
              

    <button type="button" data-toggle="modal" data-target="#infos" class="btn btn-primary">Modifier</button>
    <div class="modal" id="infos">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Modifier la marque</h4>
            <button type="button" class="close" data-dismiss="modal">
              <span>&times;</span>
            </button>            
          </div>
          
              <div class="modal-body">
              	
                            <label>NOM:</label>
                            <input type="text" name="modifier" id="<%=e.getId()%>"><input type="submit" value="Modifier">
                            
                        
              
                         </div>
                               
             <%}%>
              
          
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
</form>  
  </div>

  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  </body>
</html>