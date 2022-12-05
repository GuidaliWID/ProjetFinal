/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entities.Produit;
import entities.Cart;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author hp
 */
public class ProductService {
    private Connection con;
    private String query;
    private PreparedStatement ps;
    private ResultSet rs;
    

public ProductService(Connection con){
    this.con=con;
}
public List<Cart> getCartProducts(ArrayList<Cart> cartList)  {
        List<Cart> products = new ArrayList<Cart>();
         Connection con;
         PreparedStatement pst;
         ResultSet rs;
        try {
            if(cartList.size()>0){
                for(Cart item:cartList){
           String query="select * from Produit where id = ?";
           pst=Connexion.getInstance().getConnection().prepareStatement(query);
                   
           pst.setInt(1,item.getId());
           rs=pst.executeQuery();
            while(rs.next()){
                Cart row=new Cart();
                row.setId(rs.getInt("id"));
                row.setNom(rs.getString("nom"));
                row.setPrix(rs.getDouble("prix")*item.getQuantity());
                row.setQuantity(item.getQuantity());
                products.add(row);
            }
        } 
        } 
            
        
  
        }catch (Exception e){
    } 
        
        return products;
}
    
public List<Produit> getAll() {
        List<Produit> produits = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            produits  =  session.createQuery("from Produit").list();
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return produits;
    }

}