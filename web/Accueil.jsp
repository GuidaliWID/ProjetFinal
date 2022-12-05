<%@page import="entities.Client"%>

<%@page import="java.util.ArrayList"%>
<%@page import="entities.Cart"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.Produit"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Shop</title>
    
    <link rel="shortcut icon" type="image/x-icon" href="images/im.jpeg">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<!-- header section starts  -->

<header>

    <input type="checkbox" name="" id="toggler">
    <label for="toggler" class="fas fa-bars"></label>

    <a href="Accueil.jsp" class="logo"><img src="images/im.jpeg" alt="Logo" height="50"><span><img src="assets/img/cote2.png" alt="Logo" height="50"></span></a>

    

    <div class="icons">
        
        <a href="Cart.jsp" class="fas fa-shopping-cart"></a>
        <a href="Commande.jsp" class="fa fa-archive"></a>
        <a href="./Deconnexion" class="fas fa-user"></a>
        
    </div>
    

</header>

<!-- header section ends -->

<!-- home section starts  -->



<!-- home section ends -->

<!-- about section starts  -->

<section class="about" id="about">

    <h1 class="heading"> <span>  </span>  </h1>

    

</section>

<!-- about section ends -->

<!-- icons section starts  -->


<!-- icons section ends -->

<!-- prodcuts section starts  -->

<section class="products" id="products">

    <h1 class="heading"> Notre <span>produits</span> </h1>
 <form action="" method="GET">
    <div class="box-container">
       

                <%
                    Client c = (Client) request.getSession().getAttribute("Client");
                    HttpSession sessio = request.getSession();
                    //ProduitService pd = new ProductService();
                    ArrayList<Cart> paniers = (ArrayList<Cart>) sessio.getAttribute("listpr");
                    if (paniers != null) {
	request.setAttribute("listpr", paniers);}
                    
                        ProduitService p = new ProduitService();
                        List<Produit> products = p.getAll();
                        
                        for (Produit pp : p.getAll()) {
                    
                %>
        <div class="box">
            
            <div class="image">
                <img src=<%="ressource\\images\\" + pp.getImage()%>>
                <div class="icons">
                    
                    <a name="id" href="AddToCart?id=<%= pp.getId()%>" class="cart-btn">ajouter au panier</a>
                    
                </div>
            </div>
            <div class="content">
                <h3><%= pp.getNom()%></h3>
                <div class="price"> <%= pp.getPrix()%>DH <span></span> </div>
            </div>
        </div>
    
<%}%>
    </div>
</form>
</section>

<!-- prodcuts section ends -->

<!-- review section starts  -->



<!-- review section ends -->

<!-- contact section starts  -->



<!-- contact section ends -->

<!-- footer section starts  -->

<section class="footer">

    

    <div class="credit">   All rights reserved </div>

</section>

<!-- footer section ends -->


















    
</body>
</html>