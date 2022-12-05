<!DOCTYPE HTML>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
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
                            <td><a href="./ModifierCategorie?id=<%=e.getId()%> ">Modifier</a></td> 
                            
                        
              
                         </div>
                               
             
              
          
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
</form>  
  </div>

  
  </body>
</html>