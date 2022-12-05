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
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        
                
            <div class="center">
                 <form action="Authentification" method="POST">
                        <h1>Authentification</h1> 
                        
                        
            
                <table border="0">
                    
                    <tr>
                        <td>Admin<input id="ad" type="radio" name="type" value="Admin" checked="checked" onclick="showA();" />
                            Client<input id="cl" type="radio" name="type" value="Client" onclick="showC();"/></td>
                        <td>*</td>
                    </tr>
                </table>
            
         
                <div id="cli">
                    <div class="txt_field"><input type="text"  name="email" value="" required><span></span><label>Email</label></div>
                    
                    <div class="txt_field"><input type="password" name="password" required><span></span><label>Password</label></div>
                    <input type="submit" value="Connexion">
                    
                </div> 
                         
                    
                <div id="adm">
                    
                    <div class="txt_field"><input type="text"  name="emails" value="" required><span></span><label>Email</label></div>
                    <div class="txt_field"><input type="password"  name="passwords" required><span></span><label>Password</label></div>
                    
                    <input type="submit" value="Connexion" >
                </div>
                
                 
                <div class="signup_link"> Not a member?<a href="Inscription.jsp">SignUp</a></div>
                    
                        <%
                            if(request.getParameter("msg")!=null){%>
                        <h3><%= request.getParameter("msg") %></h3>
                        <%}%>
                    
            
        </form>
              
         </div>
        
             
    </body>
    <script src="script/scriptt.js" type="text/javascript"></script>
</html>

