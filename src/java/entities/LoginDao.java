/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import entities.LoginBean;
import entities.DBConnection;
import util.Util;

/**
 *
 * @author hp
 */
public class LoginDao {
    public String authenticateUser(LoginBean loginBean)
{
    String userName = loginBean.getUserName();
    String password = loginBean.getPassword();
 
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
    String userNameDB = "";
    String passwordDB = "";
    String roleDB = "";
 
    try
    {
        con = DBConnection.createConnection();
        statement = con.createStatement();
        resultSet = statement.executeQuery("SELECT DTYPE, email, password FROM user");
 
        while(resultSet.next())
        {
            roleDB = resultSet.getString("DTYPE");
            userNameDB = resultSet.getString("email");
            passwordDB = resultSet.getString("password");
            
 
            if(userName.equals(userNameDB) && passwordDB.equals(Util.md5(password)) && roleDB.equals("Admin"))
            return "Admin_Role";
            else if(userName.equals(userNameDB) && passwordDB.equals(Util.md5(password)) && roleDB.equals("Client"))
            return "Client_Role";
        }
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
    return "Invalid user credentials";
}
    
}
