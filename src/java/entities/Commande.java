/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Lachgar
 */
@Entity
//@NamedQuery(name ="findByEtat", query = "SELECT c FROM Commande c where c.etat= e")
//@NamedQuery(name ="commandesByClient", query = "SELECT c FROM Commande c where c.client_id= i")
public class Commande implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.DATE)
    private Date date;
    private String etat;
    @ManyToOne
    private Client client;
    @ManyToOne
    private Facture facture;

    public Commande() {
    }

    public Commande(String etat, Client client) {
        this.etat = etat;
        this.client = client;
    }

    public Commande(Date date, String etat, Client client) {
        this.date = date;
        this.etat = etat;
        this.client = client;
    }

    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Facture getFacture() {
        return facture;
    }

    public void setFacture(Facture facture) {
        this.facture = facture;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    @Override
    public String toString() {
        return "Commande{" + "id=" + id + '}';
    }

    
   
    
    
    
    
}
