/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {
	private static String url = "jdbc:mysql://localhost:3306/ecommerce";
	private static String username = "root";
	private static String password = "";
	private  Connection connection;
	private static Connexion instance;

	
	
	private Connexion() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Impossible de charger le driver");
		} catch (SQLException e) {
			System.out.println("Impossible d'�tablir la connexion : " + e.getMessage());
		}
	}



	public static Connexion getInstance() {
		if(instance == null)
			instance = new Connexion();
		return instance;
	}



	public Connection getConnection() {
		return connection;
	}



	

}
