<%@page import="entities.Admin"%>
<%@page import="service.LigneCommandeService"%>
<%@page import="java.util.List"%>
<%@page import="entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.LigneCommandePK"%>
<%@page import="service.CommandeService"%>
<%@page import="service.ClientService"%>
<%@page import="entities.Client"%>
<%@page import="entities.Commande"%>
<%
	
        Admin a = (Admin) request.getSession().getAttribute("Admin");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<script src="script/filter.js" type="text/javascript"></script>
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
<a href="html.jsp" class="logo">
    <img src="assets/img/cote2.png" alt="Logo" height="50">
        
        </a>
        <a href="html.jsp" class="logo logo-small">
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
<h6>Admin</h6>

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
<a href="html.jsp"><i class="fe fe-home"></i> <span>Dashboard</span></a>
</li>
<li class="submenu">
<a href="Users.html"><i class="fe fe-users"></i> <span>Users</span> <span class="menu-arrow"></span></a>
<ul style="display: none;">
<li><a href="Users.jsp" >Clients</a></li>
</ul>

</li>
<li class="submenu">
<ul style="display: none;">
</ul>
</li>
<li class="submenu">
<a href="#"><i class="fe fe-gear"></i> <span>Gestion</span> <span class="menu-arrow"></span></a>
<ul style="display: none;">
<li><a href="Produit.jsp">Produits</a></li>
</ul>
</li>



<li class="submenu">
</li>
<li class="submenu">
</li>
<li>
</li>
</ul>


</div>
</div>
</div>


<div class="page-wrapper">
<div class="content container-fluid">
<div class="row">
<div class="col-xl-4 col-sm-4 col-12">
<div class="card">
<div class="card-body">
<div class="dash-widget-header">
<span class="dash-widget-icon bg-primary">
<i class="fa fa-archive"></i>
</span>
<div class="dash-count">
<a href="AjouterProduit.jsp" class="count-title">Ajouter Produit</a>
<a href="SupprimerProduit.jsp" class="count-title">Supprimer Produit</a>
</div>
</div>
</div>
</div>
</div>
<div class="col-xl-4 col-sm-4 col-12">
<div class="card">
<div class="card-body">
<div class="dash-widget-header">
<span class="dash-widget-icon bg-warning">
<i class="fa fa-shopping-bag"></i>
</span>
<div class="dash-count">
<a href="AjouterCategorie.jsp" class="count-title">Ajouter Categorie</a>
<a href="SupprimerCategorie.jsp" class="count-title">Supprimer Categorie</a>
</div>
</div>
</div>
</div>
</div>
<div class="col-xl-4 col-sm-4 col-12">
<div class="card">
<div class="card-body">
<div class="dash-widget-header">
<span class="dash-widget-icon bg-danger">
<i class="fa fa-bookmark-o"></i>
</span>
<div class="dash-count">
<a href="AjouterMarque.jsp" class="count-title">Ajouter marque</a>
<a href="SupprimerMarque.jsp" class="count-title">Supprimer Marque</a>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-md-12 d-flex">

<div class="card card-table flex-fill">
<div class="card-header">
<h4 class="card-title float-start">Liste des commandes</h4>

</div>
<div class="card-body">
<div class="table-responsive no-radius">
    <form method="post" action="ModifierEtat">
<table id="emp-table" class="table table-hover table-center">
<thead>
<tr>
<th class="text-center" col-index = 1>ID de commande</th>
<th class="text-center" col-index = 2>Produit</th>
<th class="text-center" col-index = 3>Quantité</th>
<th class="text-center" col-index = 4>Prix de vente</th>
<th class="text-center" col-index = 5>Client</th>

<th class="text-center" col-index = 6>Email</th>
<th class="text-center" col-index = 7>Etat de commande <select class="table-filter" onchange="filter_rows()"><option value="all"></option></select> </th>

</tr>
</thead>
<tbody>


<%
                            CommandeService cs = new CommandeService();
                            
                            for(Commande e : cs.getAll()){
                        %>
<tr>
<td class="text-center"><%= e.getId() %></td>

<% 
LigneCommandeService lcs=new LigneCommandeService();%>
<td class="text-center"><%= lcs.ligneByCommande(e.getId()).getProduit().getNom()%></td>
<td class="text-center"><%= lcs.ligneByCommande(e.getId()).getQuantité() %></td>
<td class="text-center"><%= lcs.ligneByCommande(e.getId()).getPrixVente() %>DH</td>

<td class="text-center"><%= (e.getClient()).getNom() %> <%= (e.getClient()).getPrenom() %></td>

<td class="text-center"><%= (e.getClient()).getEmail()%></td>
<td class="text-center"><%= e.getEtat()%></td>

<td>
    <select
                      class="custom-select tm-select-accounts"
                      id="<%=e.getId()%>"  name="etat"                    >		
                        <option selected>Changer l'état</option>
                        <option value="value1">En cours</option>
                        <option value="value2">Annulée</option>
                        <option value="value3">Approuvée</option>
                        <option value="value3">Livrée</option>
                         
        </select><input type="submit" value="Modifier ">
    
    </td>

</tr>

<%}%>
</tbody>
</table>
</form>
<script>
        window.onload = () => {
            console.log(document.querySelector("#emp-table > tbody > tr:nth-child(1) > td:nth-child(7) ").innerHTML);
        };

        updateSelectOptions(unique_col_values_dict)
        
    </script>
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
