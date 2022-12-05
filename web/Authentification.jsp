<%-- 
    Document   : Authentification
    Created on : 18 nov. 2022, 23:04:57
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentification</title>
        <link href="script/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <form action="Authentification" method="POST">
                <fieldset>
            <legend>Authentification</legend>
            
                <table border="0">
                    
                    <tr>
                        <td>Admin<input id="ad" type="radio" name="type" value="Admin" checked="checked" onclick="showA();" />
                            Client<input id="cl" type="radio" name="type" value="Client" onclick="showC();"/></td>
                        <td>*</td>
                    </tr>
                </table>
            
            
                <table border="0" id="cli">
                    <tr>
                        <td>Login :</td>
                       
                        <td><input type="text" name="email" value="<%= request.getParameter("email")%>"></td>
                        
                        <td>Mot de passe :</td>
                        <td> <input type="password" name="password"></td>
                        
                        <td><input type="submit" value="Connexion"></td>
                    </tr>
                </table>
                        
                        
                <table border="0" id="adm">
                    <tr>
                        <td>Login :</td>
                        
                        <td><input type="text" name="emails" value="<%= request.getParameter("emails")%>"></td>
                        
                        <td>Mot de passe :</td>
                        <td> <input type="password" name="passwords"></td>
                        
                        <td><input type="submit" value="Connexion"></td>
                    </tr>
                </table>
                        
                <table>
                    
                    <tr>   
                    <td><a href="Inscription.jsp">Creer un nouveau compte</a></td>
                    </tr>
                    
                    <tr>
                        <%
                            if(request.getParameter("msg")!=null){%>
                        <td><h3><%= request.getParameter("msg") %></h3></td>
                        <%}%>
                    </tr>
                </table>
            
        </fieldset>
       </form>
    </body>
    <script src="script/scriptt.js" type="text/javascript"></script>
</html>

