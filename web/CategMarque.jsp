<%@page import="entities.Produit"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.Marque"%>
<%@page import="service.MarqueService"%>
<%@page import="entities.Categorie"%>
<%@page import="service.CategorieService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

 	<head>
 		<!-- Meta Tags -->
		<meta charset="UTF-8">
		<meta name="author" content="Kamran Mubarik">
		
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Title -->
 		<title>Create an E-Commerce Website using HTML, CSS and JS</title>
 		<!-- Style Sheet -->
		<link rel="stylesheet" type="text/css" href="Template/css/style_1.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	</head>
<body>

	<header>
		<div class="container">
			<div class="brand">
				
			</div> <!-- brand -->
		</div> <!-- container -->
	</header> <!-- header -->

	<main>
		
		<div class="main-content">
			
			<div class="content">
				<h3>Categories / Marques / Produits </h3>
				<div class="content-data">
					<div class="content-form">
						<form  method="POST" action="AjouterCategorie">
							<h4>Ajouter une Categorie</h4>
							<div class="form-inline">
								<div class="form-group">
									<label>Nom de categorie:</label>
									<input type="text" name="name">
								</div>
								
							</div>										
							<div class="form-group">
								<label></label>
								<input type="submit" name="addCategory" value="Ajouter ">
							</div>
						</form>
					</div>
                                    
                                    
                                    
                                    <div class="content-form">
						<form method="POST" action="AjouterMarque">
							<h4>Ajouter une Marque</h4>
							<div class="form-inline">
								<div class="form-group">
									<label>Nom de Marque:</label>
									<input type="text" name="marque">
								</div>
								
							</div>										
							<div class="form-group">
								<label></label>
								<input type="submit" name="addMarque" value="Ajouter ">
							</div>
						</form>
					</div>
                                    
                                     <div class="content-form">
						
							<h4>Ajouter un Produit</h4>
																	
							<div class="form-group">
								<label></label>
								
                                        <form action="AjouterProduit.jsp">
                                                <td><button>Ajouter</button></td>   
                        
                                                             </form>
							</div>
						
					</div>
                                     
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <form method="post" action="ModifierCategorie">
					<div class="content-detail">
                                            
                                                <h4>Liste des Categories</h4>
						<table>
							<thead>
								<tr>
                                                                        <th>id</th>
									<th>Categories</th>
									
									<th>Supprimer</th>
									<th>Modifier</th>
								</tr>
							</thead>
                                                        
                                                        
                                                        <tbody>
								<tr>
									 <%
                            CategorieService es = new CategorieService();
                            for(Categorie e : es.getAll()){
                        %>
                        <tr>
                            <td><%= e.getId() %></td>
                            <td><%= e.getNom() %></td>
                            
                            
                            <td><a href="./SupprimerCategorie?id=<%=e.getId()%> ">Supprimer</a></td>
                            
                          <td><input type="text" name="modifier"><input type="submit" value="Modifier "></td> 
                        </tr>
                        
                        <%}%>
									
								</tr>
							</tbody>
                                           
						
							
						</table>
                                            </div>
                        </form>
                        
                        
                                    <div class="content-detail">
						<h4>Liste des Marques</h4>
								<table>
							<thead>
								<tr>    
                                                                        <th>id</th>
									<th>Marques</th>
									
									<th>Supprimer</th>
									<th>Modifier</th>
								</tr>
							</thead>
                                                        
                                                        
                                                        <tbody>
								
							</tbody>
                                            
						
							
						</table>
					</div>
				</div>
			</div>
                        
		</div>		
<div class="content-detail">
						<h4>All Products</h4>
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Nom</th>
									<th>Categorie</th>
                                                                        <th>Marque</th>
                                                    
                                                                        <th>Price</th>
                                                                        <th>Description</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
                                                        
                                                        
                                                        
                                                        
							
                                                        
                                                         <tbody>
								<tr>
									 <%
                            ProduitService ps = new ProduitService();
                            for(Produit e : ps.getAll()){
                        %>
                        <tr>
                             <td><%= e.getId() %></td>
                            <td><%= e.getNom() %></td>
                            <td><%= e.getCategorie().getNom() %></td>
                            <td><%= e.getMarque().getNom() %></td>
                            <td><%= e.getPrix() %></td>
                            <td><%= e.getDesignation() %></td>
                            
                            <td><a href="./UpdateProduit?id=<%=e.getId()%> ">Modifier</a></td>
                            <td><a href="./DeleteProduit?id=<%=e.getId()%> ">Supprimer</a></td>
                        </tr>
                        
                        <%}%>
									
								</tr>
							</tbody>
                                                        
                                                        
						</table>
					</div>
                        <br>
  <div class="container">

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
            
              
              
              
								<table>
							
                                                        
                                                        
                                                        <tbody>
								<tr>
									 <%
                            MarqueService ms = new MarqueService();
                            for(Marque e : ms.getAll()){
                        %>
                        <tr>
                             
                            <td><%= e.getNom() %></td>
                            
                            
                            
                            <td><input type="text" name="modifier"><input type="submit" value="Modifier "></td>
                        </tr>
                        
                        <%}%>
									
								</tr>
							</tbody>
                                            
						
							
						</table>
              
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>

  </div>

  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</main> <!-- Main Area -->

	<footer>
		<div class="container">
			<div class="footer-bar">
				<div class="copyright-text">
					<p>Copryright 2020 - All Rights Reserved</p>
				</div>
			</div> <!-- Footer Bar -->
		</div>
	</footer> <!-- Footer Area -->

</body>

</html>
