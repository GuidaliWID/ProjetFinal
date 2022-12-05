<%-- 
    Document   : Authentification
    Created on : 18 nov. 2022, 23:04:57
    Author     : hp
--%>

<%@page import="entities.Admin"%>
<%@page import="entities.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	Client c = (Client) request.getSession().getAttribute("Client");
        Admin a = (Admin) request.getSession().getAttribute("Admin");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentification</title>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
                
            <div class="center">
                 <form action="Authen" method="POST">
                        <h1>Authentification</h1> 
                 
                <div >
                    
                    <div class="txt_field"><input type="text"  name="email" value="" required><span></span><label>Email</label></div>
                    <div class="txt_field"><input type="password"  name="password" required><span></span><label>Password</label></div>
                    
        
                    <input type="submit" value="Connexion" >
                     <%
                            if(request.getParameter("msg")!=null){%>
                        <h3><%= request.getParameter("msg") %></h3>
                        <%}%>
                </div>
                
                 
                <div class="signup_link">Vous n'êtes pas membre?<a href="Insc.jsp">Créer un compte</a></div>
                    
                        
                    
            
        </form>
              
         </div>
        
             
    </body>
    <script src="script/scriptt.js" type="text/javascript"></script>
</html>

