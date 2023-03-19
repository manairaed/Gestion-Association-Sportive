package com.basketapp.basket_app.dao;
import java.util.List;

import com.basketapp.basket_app.models.Produit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProduitRepos extends JpaRepository<Produit,Long>{
    
    List<Produit> findByNomProduit(String nom) ;
    List<Produit> findByNomProduitContains(String nom) ;
} 