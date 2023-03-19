package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Produit;


public interface ProduitService {
    Produit createProduit (Produit p);
    void deleteProduit (Long id); 
    Produit updateProduit (Produit p); 
    Produit getProduitById(Long id);
    List <Produit> rechercherProduitByNom (String nom);
    List <Produit> rechercherProduitByPart (String partie);
    Produit ajoutProduitCategorie(Produit p);
    Produit favoriserProduit (Long id); 
}