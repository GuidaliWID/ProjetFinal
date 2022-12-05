<%-- 
    Document   : Client
    Created on : 18 nov. 2022, 23:24:44
    Author     : hp
--%>
<%@page import="entities.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenue</title>
    </head>
    <body>
        <%!Client c ;%>
        <%
         
        HttpSession sessionn = request.getSession();
        if (sessionn != null) {
             c = (Client) sessionn.getAttribute("Client");
        }
        else{
            response.sendRedirect("Authentification.jsp");
        }
        %>
        <h1>Welcome Mr/Madame : <%= c.getNom() + " " + c.getPrenom()%> </h1>
        <table>
            <tr>
        <form action="Deconnexion">
            <td><input type="submit" value="Deconnecter"> </td>
        </form>
            </tr>
            
            
            <tr>
        <form action="UpdatePassword.jsp">
            <td><button type="submit">Modifier le mot de passe</button></td>   
        </form>
            </tr>
        </table>

    </body>
</html>

