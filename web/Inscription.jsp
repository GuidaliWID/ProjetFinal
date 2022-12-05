<%-- 
    Document   : Inscription
    Created on : 18 nov. 2022, 23:06:28
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscription</title>
        <link href="script/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <form action="Inscription" method="POST">
            <fieldset><legend>
                Inscription
                </legend>
                <table border="0">
                    
                    
                    
                    <tr>
                        <td>Admin<input id="ad" type="radio" name="type" value="Admin" checked="checked" onclick="showA();"/>
                            Client<input id="cl" type="radio" name="type" value="Client" checked="checked" onclick="showC();"/></td>
                        <td>*</td>
                    </tr>
                </table>
                    
                    
                <table border="0" id="cli">    
                    
                    
                        <tr>
                            <td>Nom</td>
                            <td><input type="text" name="nom" value="" /></td>
                        </tr>
                        <tr>
                            <td>Prenom</td>
                            <td><input type="text" name="prenom" value="" /></td>
                        </tr>
                        <tr>
                            <td>Telephone</td>
                            <td><input type="text" name="telephone" value="" /></td>
                        </tr>
                        <tr>
                            <td>Adresse</td>
                            <td><input type="text" name="adresse" value="" /></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="" /></td>
                        </tr>
                        <tr>
                            <td>Mot de passe</td>
                            <td><input type="password" name="password" value="" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Valider" />
                                <input type="reset" value="Annuler" /></td>
                        </tr>
                   
                </table>
                
                <table border="0" id="adm">    
                    
                
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="emails" value="" /></td>
                        </tr>
                        <tr>
                            <td>Mot de passe</td>
                            <td><input type="password" name="passwords" value="" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Valider" />
                                <input type="reset" value="Annuler" /></td>
                        </tr>
                   
                </table>
                    <a href="Authen.jsp">J'ai deja un compte</a>
            </fieldset>
            
            
            
        </form>
    </body>
    <script src="script/Script.js" type="text/javascript"></script>
</html>

