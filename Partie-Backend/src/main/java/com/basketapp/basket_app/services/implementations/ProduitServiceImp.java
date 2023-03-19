package com.basketapp.basket_app.services.implementations;


import java.util.List;

import com.basketapp.basket_app.dao.ProduitRepos;
import com.basketapp.basket_app.models.Produit;
import com.basketapp.basket_app.services.ProduitService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProduitServiceImp implements ProduitService{ 

    @Autowired
    ProduitRepos produitRepos;

    @Override
    public Produit createProduit(Produit p) {
        return produitRepos.save(p);
    }

    @Override
    public void deleteProduit(Long id) {
         produitRepos.deleteById(id);
    }

    @Override
    public Produit updateProduit(Produit p) {
        return produitRepos.save(p);
    }

    
    @Override
    public Produit ajoutProduitCategorie(Produit p) {
        return null;
    }

    @Override
    public Produit favoriserProduit(Long id) {
        Produit updateProduit = produitRepos.findById(id).get();
        updateProduit.setFavoris(!updateProduit.getFavoris());
        produitRepos.saveAndFlush(updateProduit);
        return updateProduit; 
    }

    @Override
    public List<Produit> rechercherProduitByNom(String nom) {
        
        return  produitRepos.findByNomProduit(nom);
    }

    @Override
    public List <Produit> rechercherProduitByPart(String partie) {
        return  produitRepos.findByNomProduitContains(partie);

    }

    @Override
    public Produit getProduitById(Long id) {
        return produitRepos.findById(id).get();
    }
}