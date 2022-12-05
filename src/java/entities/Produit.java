/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


/**
 *
 * @author Lachgar
 */
@Entity
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nom;
    private String designation;
    private double prix;
    private String image;
    @ManyToOne
    private Marque marque;
    @ManyToOne
    private Categorie categorie;
    
    
    
    
    

    public Produit() {
    }

    public Produit(String nom, String designation, double prix) {
        this.nom = nom;
        this.designation = designation;
        this.prix = prix;
    }

    public Produit(String nom, String designation, double prix, Marque marque, Categorie categorie) {
        this.nom = nom;
        this.designation = designation;
        this.prix = prix;
        this.marque = marque;
        this.categorie = categorie;
    }

    public Produit(String nom, String designation, double prix, String image, Marque marque, Categorie categorie) {
        this.nom = nom;
        this.designation = designation;
        this.prix = prix;
        this.image = image;
        this.marque = marque;
        this.categorie = categorie;
    }

    public Produit(String nom, double prix, String image) {
        this.nom = nom;
        this.prix = prix;
        this.image = image;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Marque getMarque() {
        return marque;
    }

    public void setMarque(Marque marque) {
        this.marque = marque;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Produit{" + "nom=" + nom + ", prix=" + prix + '}';
    }
    
    
    
}
