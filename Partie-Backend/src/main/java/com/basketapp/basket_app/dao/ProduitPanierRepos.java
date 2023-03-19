package com.basketapp.basket_app.dao;

import com.basketapp.basket_app.models.ProduitPanier;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Repository
public interface ProduitPanierRepos extends JpaRepository<ProduitPanier,Long>{
    
    @Query("DELETE FROM ProduitPanier o where o.panier.idPanier=?1 AND o.produit.idProduit=?2")
    ProduitPanier deletewithpanieretproduit(Long idPanier, Long idProduit);
}
