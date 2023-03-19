package com.basketapp.basket_app.services.implementations;


import com.basketapp.basket_app.dao.PanierRepos;
import com.basketapp.basket_app.dao.ProduitPanierRepos;
import com.basketapp.basket_app.dao.ProduitRepos;
import com.basketapp.basket_app.dao.UtilisateurRepository;
import com.basketapp.basket_app.models.Panier;
import com.basketapp.basket_app.models.Produit;
import com.basketapp.basket_app.models.ProduitPanier;
import com.basketapp.basket_app.models.Utilisateur;
import com.basketapp.basket_app.services.ProduitPanierService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ProduitPanierServiceImp implements ProduitPanierService{

    @Autowired
    ProduitPanierRepos produitpanierRepos;

    @Autowired
    UtilisateurRepository utilisateurRepository;

    @Autowired
    PanierRepos panierRepos;

    @Autowired
    ProduitRepos produitRepos;


    @Override
    public void ajouterQuantity(Long idPp) {
        ProduitPanier pp = produitpanierRepos.findById(idPp).get();
        pp.setQuantity(pp.getQuantity()+1);     
    }

    @Override
    public void diminuerQuantity(Long idPp) {
        ProduitPanier pp = produitpanierRepos.findById(idPp).get();  
        pp.setQuantity(pp.getQuantity()-1);  
    }

    @Override
    public ProduitPanier ajoutProduitPanier(Long idUser, Long idProduit) {
            
            Panier panier = new Panier();
            Utilisateur user = utilisateurRepository.findById(idUser).get();
        
            panier = panierRepos.findByUser(idUser);
            panier.setUser(user); 
             panierRepos.saveAndFlush(panier);

            Produit produit = produitRepos.findById(idProduit).get();
            ProduitPanier order = new ProduitPanier();

            order.setPanier(panier);
            order.setProduit(produit);

            return produitpanierRepos.saveAndFlush(order);
    }

    

    @Override
    public float calculertotal(Long idPp) {
        ProduitPanier order= produitpanierRepos.findById(idPp).get();   
        int q = order.getQuantity();
        Produit produit = order.getProduit();
        return produit.getPrix()*q ;
    }

    @Override
    public void deleteProduitPanier(Long idPanier, Long idProduit) {
        produitpanierRepos.deletewithpanieretproduit(idPanier, idProduit);
    }


    
    
    
}
