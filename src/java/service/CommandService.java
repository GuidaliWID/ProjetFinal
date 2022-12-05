/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import entities.Commande;

/**
 *
 * @author hp
 */
public class CommandService {
    
	
	private Connection con;

	private String query;
        private String queryy;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public CommandService(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(Commande commande) {
        boolean result = false;
        try {
            query = "insert into commande ( date, etat, client_id,facture_id) values(?,?,null,null)";
            pst = this.con.prepareStatement(query);
            //pst.setInt(1, commande.getId());
            java.sql.Date sqlDate = new java.sql.Date(commande.getDate().getTime());
            pst.setDate(1, sqlDate);
            pst.setString(2, commande.getEtat());
            //pst.setInt(3, commande.getClient().getId());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

    

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}
