<%-- 
    Document   : Admin
    Created on : 19 nov. 2022, 17:30:07
    Author     : hp
--%>

<%@page import="service.MarqueService"%>
<%@page import="entities.Marque"%>
<%@page import="service.CategorieService"%>
<%@page import="entities.Categorie"%>
<%@page import="entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion des commandes</title>
    </head>
    <body>
        <%!Admin a ;%>
        <%
         
        HttpSession sessionn = request.getSession();
        if (sessionn != null) {
             a = (Admin) sessionn.getAttribute("admin");
        }
        else{
            response.sendRedirect("Authen.jsp");
        }
        %>
        <h1>Welcome Mr/Madame Admin:</h1>
        <table>
            <tr>
        <form action="Deconnexion">
            <td><input type="submit" value="Deconnecter"> </td>
        </form>
            </tr>
            <tr>
        <form action="UpdatePasswordAdmin.jsp">
            <td><button type="submit">Modifier le mot de passe</button></td>   
        </form>
            </tr>
        </table>
        
        
        
        
        <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="index.html">
          <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">
            <li class="nav-item">
              <a class="nav-link" href="index.html">
               
                <span class="sr-only">(current)</span>
              </a>
            </li>
           
            <li class="nav-item">
              <a class="nav-link active" href="Admin.jsp">
                 <i class='bx bxs-cart'></i>  Products
              </a>
                
            </li>
            
            
    
            

            <li class="nav-item">
              <a class="nav-link" href="Add.jsp">
                <i class='bx bxs-t-shirt'></i>Categories et Marques
              </a>
            </li>
            
            
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link d-block" href="Authen.jsp">
                Admin, <b>Logout</b>
              </a>
            </li>
          </ul>
        </div>
      </div>
    
    </nav>
      
      
      
      
      
      
      
                  
                  
                  
    <div class="container tm-mt-big tm-mb-big">
      <div class="row ">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto ">
            <div class="row text-center">
              <div class="col-12 justify-content-center">
                <h2 class="tm-block-title d-inline-block ">Add Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row justify-content-center">
              <div class="col-xl-6 col-lg-6 col-md-12 ">
                  <form method="POST" action="AjouterProduit" class="tm-edit-product-form">
                  <div class="form-group mb-3">
                    <label
                      for="name"
                      >Product Name
                    </label>
                    <input
                      id="name"
                      name="name"
                      type="text"
                      class="form-control validate"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="description"
                      >Description</label
                    >
                    <textarea
                      class="form-control validate"
                      rows="3" name="description"
                      required
                    ></textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="category"
                      >Category</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="category"  name="categorie"                    >		
                        <option selected>Select categorie</option><%
                            CategorieService es = new CategorieService();
                            for(Categorie e : es.getAll()){
                        %>
                            
                            <option><%= e.getNom() %></option>
                           
                       
                        <%}%>
                      
                    </select>
                    
                    
                    
                  </div>
                 
                      <div class="form-group mb-3">
                    <label
                      for="marque"
                      >Marque</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="category" name="marque"                     >		
                        <option selected>Select marque</option><%
                            MarqueService ms = new MarqueService();
                            for(Marque e : ms.getAll()){
                        %>
                            
                            <option> <%= e.getNom() %></option>
                           
                       
                        <%}%>
                      
                    </select>
                  </div>
                        <div class="form-group mb-3 ">
                          <label
                            for="prix"
                            >Prix
                          </label>
                          <input
                            id="prix"
                            name="prix"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>
                    
                    
                    
                          
                    
                    <div class="form-group text-center ">
                         <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                         </form>
                  </div>   
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          
        </div>
    </footer> 

    <script src="Template/assets/bootstrap/css/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
  
    
    <script src="Template/assets/bootstrap/css/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
     <script src="Template/assets/bootstrap/css/js/moment.min.js"></script>
      <script src="Template/assets/bootstrap/css/js/tooplate-scripts.js"></script>
    <script src="Template/assets/bootstrap/css/js/Chart.min.js"></script>
   
        
        
        
    </body>
</html>
