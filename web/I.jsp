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
                <table border="0">
                    
                    
                    
                    <tr>
                        <td>Admin<input id="ad" type="radio" name="type" value="Admin" checked="checked" onclick="showA();"/>
                            Client<input id="cl" type="radio" name="type" value="Client" checked="checked" onclick="showC();"/></td>
                        <td>*</td>
                    </tr>
                </table>
                    
                    
                <div  id="cli">    
                    
                    
                        <div class="txt_field"><input type="text" name="nom" value="" required /><span></span><label>Nom</label></div></td>
                        
                            
                        <div class="txt_field"><input type="text" name="prenom" value="" required /><span></span><label>Prenom</label></div></td>
                        
                            
                        <div class="txt_field"><input type="text" name="telephone" value="" required /><span></span><label>Telephone</label></div></td>
                        
                            
                        <div class="txt_field"><input type="text" name="adresse" value="" required /><span></span><label>Adresse</label></div></td>
                        
                           
                        <div class="txt_field"><input type="text" name="email" value="" required /><span></span><label>Email</label></div></td>
                        
                            
                        <div class="txt_field"><input type="password" name="password" value="" required /><span></span><label>Password</label></div></td>
                        
                            
                        <input type="submit" value="Valider" />
                                <input type="reset" value="Annuler" /></td>
                        </tr>
                   
                </table>
                
                <table border="0" id="adm">    
                    
                
                        <tr>
                            
                            <td><div class="txt_field"><input type="text" name="emails" value="" required /><span></span><label>Email</label></div></td>
                        </tr>
                        <tr>
                            
                            <td><div class="txt_field"><input type="password" name="passwords" value="" required /><span></span><label>Password</label></div></td>
                        </tr>
                        <td>
                            <input type="submit" value="Valider" />
                            <input type="reset" value="Annuler" /></td>
                        </tr>
                   
                </table>
            <div class="signup_link">Vous avez deja un compte?<a href="Authen.jsp">LogIn</a></div>
                    
           
            
            
            
        </form>
        </div>
    </body>
    <script src="script/Script.js" type="text/javascript"></script>
</html>

