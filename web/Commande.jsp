
<%@page import="service.LigneCommandeService"%>
<%@page import="service.CommandeService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Cart"%>

<%@page import="java.util.List"%>
<%@page import="service.MarqueService"%>
<%@page import="service.CategorieService"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.Produit"%>
<%@page import="service.ClientService"%>
<%@page import="service.Connexion"%>
<%@page import="entities.Client"%>
<%@page import="entities.Commande"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>E-Shop - Dashboard</title>

<link rel="shortcut icon" type="image/x-icon" href="images/im.jpeg">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/feathericon.min.css">

<link rel="stylesheet" href="assets/plugins/morris/morris.css">

<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="main-wrapper">

<div class="header">

<div class="header-left">
<a href="Accueil.jsp" class="logo">
    <img src="assets/img/cote2.png" alt="Logo" height="50">
        
        </a>
        <a href="Accueil.jsp" class="logo logo-small">
          <img src="images/im.jpeg" alt="Logo">   
        </a>
    </a> 
</div>

<a href="javascript:void(0);" id="toggle_btn">
<i class="fe fe-text-align-left"></i>
</a>
<div class="top-nav-search">

</div>

<a class="mobile_btn" id="mobile_btn">
<i class="fa fa-bars"></i>
</a>


<ul class="nav user-menu">




<li class="nav-item dropdown has-arrow">
<a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
<span class="user-img"><img class="rounded-circle" src="assets/img/profiles/TT.jpg" width="31" alt="Seema Sisty"></span>
</a>
<div class="dropdown-menu">
<div class="user-header">
<div class="avatar avatar-sm">
<img src="assets/img/profiles/TT.jpg" alt="User Image" class="avatar-img rounded-circle">
</div>
<div class="user-text">
   <% Client c = (Client) request.getSession().getAttribute("Client"); %>
<h6><%= c.getNom() + " " + c.getPrenom()%> </h6>

</div>
</div>

    <a class="dropdown-item" href="./Deconnexion">Logout</a> 
</div>
</li>

</ul>

</div>


<div class="sidebar" id="sidebar">
<div class="sidebar-inner slimscroll">
<div id="sidebar-menu" class="sidebar-menu">
<ul>
<li class="menu-title">
</li>
<li class="active">
<a href="Accueil.jsp"><i class="fe fe-home"></i> <span>Accueil</span></a>
</li>
<li class="submenu">
<a href="#"><i class="fe fe-gear"></i> <span>Mon compte</span> </a>
<ul style="display: none;">
<li><a href="Commande.jsp">Mes commandes</a></li>
</ul>
</li>

</ul>

</div>
</div>
</div>
<div class="page-wrapper">
<div class="content container-fluid">
<div class="page-header">
<div class="row align-items-center">
<div class="col">
<h3 class="page-title"></h3>
<ul class="breadcrumb">

</ul>
</div>
</div>
</div>

      
<div class="row">
<div class="col-md-12 d-flex">

<div class="card card-table flex-fill">
    <div class="card-header">
<h4 class="card-title float-start">Mes Commandes</h4>

</div>
<div class="card-body">
    <div class="table-responsive no-radius">
<table class="table table-hover table-center">

<thead>
<tr>
<th class="text-center">Quantité</th>
<th class="text-center">Nom de produit</th>
<th class="text-center">Montant</th>
<th class="text-center">Etat</th>


<th class="text-end">Action</th>
</tr>
</thead>
<tbody>
    
    <%//ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//List<Cart> cartProduct = null;
//if (cart_list != null) {
	//ProductDao pDao = new ProductDao(DbCon.getConnection());
	//cartProduct = pDao.getCartProducts(cart_list);
	//double total = pDao.getTotalCartPrice(cart_list);
	//request.setAttribute("total", total);
	//request.setAttribute("cart_list", cart_list);
//}
%>
    
     
                <%
                    
                    int id =c.getId();
                    HttpSession sessio = request.getSession();
                    CommandeService cs=new CommandeService();
                    for(Commande e : cs.getAll()){
                        if((e.getClient().getId())==id){

                %> 
<tr>
   


<% 
LigneCommandeService lcs=new LigneCommandeService();%>
<td class="text-center"><%= lcs.ligneByCommande(e.getId()).getQuantité() %></td>
<td class="text-center"><%= lcs.ligneByCommande(e.getId()).getProduit().getNom()%></td>

<td class="text-center"><%= lcs.ligneByCommande(e.getId()).getPrixVente() %>DH</td>
<td class="text-center"><%= e.getEtat()%></td>


<td class="text-end">
    
<div class="actions">
    
    <a href="SupprimerCommande?id=<%= e.getId()%>" class="btn btn-sm bg-danger-light">
        
    
<i class="fe fe-trash"></i>
 </a>


</div>
</td>

</tr>




<%    
                    }} %>
                    </tbody>
</table>






</div>
</div>
</div>
</div>
</div>

</div>
</div>
</div>
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="assets/js/script.js"></script>
</body>
</html>
