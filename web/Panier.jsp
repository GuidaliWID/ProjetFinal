<%@page import="entities.Panier"%>
<%@page import="java.util.List"%>
<%@page import="service.MarqueService"%>
<%@page import="service.CategorieService"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.Produit"%>
<%@page import="service.ClientService"%>
<%@page import="entities.Client"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>E-Shop - Dashboard</title>

<link rel="shortcut icon" type="image/x-icon" href="images/m.jfif">

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
<a href="Panier.jsp" class="logo">
    <img src="assets/img/cote2.png" alt="Logo" height="50">
        
        </a>
        <a href="Panier.jsp" class="logo logo-small">
          <img src="assets/img/m.jfif" alt="Logo">  
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

<li class="nav-item dropdown noti-dropdown">
<a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
<i class="fa fa-bell"></i> <span class="badge badge-pill">3</span>
</a>
<div class="dropdown-menu notifications">
<div class="topnav-dropdown-header">
<span class="notification-title">Notifications</span>
<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
</div>
<div class="noti-content">
<ul class="notification-list">
<li class="notification-message">
<a href="#">
<div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg">
</span>
<div class="media-body flex-grow-1">
<p class="noti-details"><span class="noti-title">Carlson Tech</span> has approved <span class="noti-title">your estimate</span></p>
<p class="noti-time"><span class="notification-time">4 mins ago</span></p>
</div>
</div>
</a>
</li>
<li class="notification-message">
<a href="#">
<div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-11.jpg">
</span>
<div class="media-body flex-grow-1">
<p class="noti-details"><span class="noti-title">International Software Inc</span> has sent you a invoice in the amount of <span class="noti-title">$218</span></p>
<p class="noti-time"><span class="notification-time">6 mins ago</span></p>
</div>
</div>
</a>
</li>
<li class="notification-message">
<a href="#">
<div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-17.jpg">
</span>
<div class="media-body flex-grow-1">
<p class="noti-details"><span class="noti-title">John Hendry</span> sent a cancellation request <span class="noti-title">Apple iPhone XR</span></p>
<p class="noti-time"><span class="notification-time">8 mins ago</span></p>
</div>
</div>
</a>
</li>
<li class="notification-message">
<a href="#">
<div class="media d-flex">
<span class="avatar avatar-sm flex-shrink-0">
<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-13.jpg">
</span>
<div class="media-body flex-grow-1">
<p class="noti-details"><span class="noti-title">Mercury Software Inc</span> added a new product <span class="noti-title">Apple MacBook Pro</span></p>
<p class="noti-time"><span class="notification-time">12 mins ago</span></p>
</div>
</div>
</a>
</li>
</ul>
</div>
<div class="topnav-dropdown-footer">
<a href="#">View all Notifications</a>
</div>
</div>
</li>


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
<p class="text-muted mb-0">Administrator</p>
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
<a href="index.jsp"><i class="fe fe-home"></i> <span>Accueil</span></a>
</li>
<li class="submenu">
<a href="#"><i class="fe fe-users"></i> <span>Users</span> <span class="menu-arrow"></span></a>
<ul style="display: none;">
<li><a href="Users.jsp" >Clients</a></li>
</ul>
</li>
<li class="submenu">
<a href="#"><i class="fe fe-gear"></i> <span>Gestion</span> <span class="menu-arrow"></span></a>
<ul style="display: none;">
<li><a href="Produit.jsp">Produits</a></li>
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
<form  action="AjouterCommande" method="Post" >
      
<div class="row">
<div class="col-md-12 d-flex">

<div class="card card-table flex-fill">
<div class="card-body">
<div class="table-responsive">
<table class="table table-hover table-center mb-0">
<thead>
<tr>
<th>Quatité</th>
<th>Nom de produit</th>
<th>Prix</th>
<th></th>

<th class="text-end">Action</th>
</tr>
</thead>
<tbody>
     <%! double total = 0;%>
                <%
                    HttpSession sessio = request.getSession();
                    List<Panier> paniers = (List<Panier>) sessio.getAttribute("listpr");
                    if (paniers != null) {
                        for (Panier p : paniers) {
                            total += p.getQte() * p.getProduit().getPrix();

                %>
<tr height="20px">
   

<td><%= p.getQte()%></td>

<td><%= p.getProduit().getNom()%></td>
<td><%= p.getProduit().getPrix()%> DH</td>
<td><img src=<%="ressource\\images\\" + p.getProduit().getImage()%>></td>

<td class="text-end">
    
<div class="actions">

<a href="./SupprimerPanier?id=<%= p.getId()%>" class="btn btn-sm bg-danger-light">
<i class="fe fe-trash"></i>
 </a>
</div>
</td>

</tr>

<%    }
         }%>
</tbody>
</table>

<table class="table table-hover table-center mb-0">
<thead>
<tr>
<th style="text-align: center;">Total: <%=total%> DH</th>

<th style="text-align: center;"><input type="submit" value="Valider la commande" /></th>



</tr>
</thead>
</table>
</div>
</div>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="assets/js/script.js"></script>
</body>
</html>
