package com.basketapp.basket_app.services;



import com.basketapp.basket_app.models.Panier;


public interface PanierService {
    Panier createPanier (Panier p);
    Panier addProduitPanier (Long idUtil,Long idProduit,Long idPanier);
    void deleteProduitPanier (Long idUtil,Long idProduit,Long idPanier); 
    void deleteAllProduitPanier(Long idUtil,Long idProduit, Long idPanier);
    void  deletePanier(Long idPanier);
    Panier getPanier(Long idUtil);  
}