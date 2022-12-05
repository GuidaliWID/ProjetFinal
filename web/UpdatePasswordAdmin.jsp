<%-- 
    Document   : UpdatePasswordAdmin
    Created on : 20 nov. 2022, 18:06:00
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modification du mot de passe</title>
    </head>
    <body>
        <fieldset>
            <legend>Nouveau mot de passe</legend>
            <form action="UpdatePasswordAdmin" method="post">
                <table>
                    <tr>
                        <td>Mot de passe :</td>
                        <td><input type="password" name="password"></td>
                        <td>Confirmer le mot de passe :</td>
                        <td><input type="password" name="passwordcnf"></td>
                        <td><input type="submit" value="Modifier"</td>
                    </tr>
                    <tr>
                        <td><a href="Admin.jsp">Annuler</a></td>
                    </tr>
                    </table>
                
                        <%
                            if(request.getParameter("msg")!=null){%>
                        <h4><%= request.getParameter("msg")%></h4>
                        <%}%>
                    
                
            </form>
        </fieldset>
    </body>
</html>
