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
        <link href="style/stylee.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
        <div class="center">
        <form action="Inscription" method="POST">
            <h1>Inscription</h1>
                
                    
                    
                <table border="0" >    
                    
                    
                        <tr>
                            
                            <td><div class="txt_field"><input type="text" name="nom" placeholder="Nom" value=""  /><span></span></div></td>
                        </tr>
                        <tr>
                            
                            <td><div class="txt_field"><input type="text" name="prenom" placeholder="Prénom" value=""  /><span></span></div></td>
                        </tr>
                        <tr>
                            
                            <td><div class="txt_field"><input type="text" name="telephone" placeholder="Téléphone" value=""  /><span></span></div></td>
                        </tr>
                        <tr>
                            
                            <td><div class="txt_field"><input type="text" name="adresse" placeholder="Adresse" value=""  /><span></span></div></td>
                        </tr>
                        <tr>
                           
                            <td><div class="txt_field"><input type="text" name="email" placeholder="Email" value=""  /><span></span></div></td>
                        </tr>
                        <tr>
                            
                            <td><div class="txt_field"><input type="password" name="password" placeholder="Password" value=""  /><span></span></div></td>
                        </tr>
                        <tr>
                            
                            <td><input type="submit" value="Valider" />
                                <input type="reset" value="Annuler" /></td>
                        </tr>
                   
                </table>
                
               
            <div class="signup_link">Vous avez déjà un compte?<a href="Authen.jsp">Se connecter</a></div>
                    
           
            
            
            
        </form>
        </div>
    </body>
    <script src="script/Script.js" type="text/javascript"></script>
</html>

