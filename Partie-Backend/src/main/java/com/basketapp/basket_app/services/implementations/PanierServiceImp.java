package com.basketapp.basket_app.services.implementations;


import com.basketapp.basket_app.dao.PanierRepos;

import com.basketapp.basket_app.models.Panier;

import com.basketapp.basket_app.services.PanierService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PanierServiceImp implements PanierService{ 

    @Autowired
    PanierRepos panierRepos;

    @Override
    public Panier createPanier(Panier p) {
        return panierRepos.save(p); 
    }

    @Override
    public Panier addProduitPanier(Long idUtil, Long idProduit, Long idPanier) {
        return null;
    }

    @Override
    public void deleteProduitPanier(Long idUtil, Long idProduit, Long idPanier) {

    }

    @Override
    public void deletePanier(Long idPanier) {
        panierRepos.deleteById(idPanier);
    }

    @Override
    public Panier getPanier( Long idUtil) {
      return  panierRepos.findByUser(idUtil);
               
    }

    @Override
    public void deleteAllProduitPanier(Long idUtil, Long idProduit, Long idPanier) {
       
    }
} 