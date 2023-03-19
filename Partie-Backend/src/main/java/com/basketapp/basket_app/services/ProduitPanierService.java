package com.basketapp.basket_app.services;

import com.basketapp.basket_app.models.ProduitPanier;

public interface ProduitPanierService {
     void ajouterQuantity (Long idPp );
     void diminuerQuantity(Long idPp);
     ProduitPanier ajoutProduitPanier (Long idUser, Long idProduit);
     void deleteProduitPanier (Long idPanier ,  Long idProduit);
     float calculertotal(Long idPp);
}
