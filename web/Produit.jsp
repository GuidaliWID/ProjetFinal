<%@page import="entities.Admin"%>
<%@page import="service.MarqueService"%>
<%@page import="service.CategorieService"%>
<%@page import="service.ProduitService"%>
<%@page import="entities.Produit"%>
<%@page import="service.ClientService"%>
<%@page import="entities.Client"%>
<%
	
        Admin a = (Admin) request.getSession().getAttribute("Admin");
%>
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
<p class="text-muted mb-0"></p>
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
<h3 class="page-title">Produits</h3>
<ul class="breadcrumb">

</ul>
</div>
</div>
</div>
<div class="row">
<div class="col-md-12 d-flex">

<div class="card card-table flex-fill">
<div class="card-body">
<div class="table-responsive">
<table class="table table-hover table-center mb-0">
<thead>
<tr>
<th>Nom</th>
<th>Categorie</th>
<th>Marque</th>
<th>Prix</th>
<th>Description</th>
<th class="text-end">Action</th>
</tr>
</thead>
<tbody>
<tr>
    <%
                            ProduitService es = new ProduitService();
                            CategorieService cs = new CategorieService();
                            MarqueService ms = new MarqueService();
                            for(Produit e : es.getAll()){
                        %>

<td><%= e.getNom() %></td>

<td><%= (e.getCategorie()).getNom() %></td>
<td><%= (e.getMarque()).getNom() %></td>
<td><%= e.getPrix() %> DH</td>
<td><%= e.getDesignation() %></td>
<td class="text-end">
    
<div class="actions">

<a href="./SupprimerProduit?produit=<%=e.getNom()%>" class="btn btn-sm bg-danger-light">
<i class="fe fe-trash"></i>
 </a>
</div>
</td>

</tr>
<%}%>

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
