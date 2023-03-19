package com.basketapp.basket_app.dao;

import com.basketapp.basket_app.models.Panier;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Repository
public interface PanierRepos extends JpaRepository<Panier,Long>{

    @Query("select p from Panier p , Utilisateur u where u.idUtil=p.user.idUtil AND u.idUtil=?1") 
    Panier findByUser(Long idUser);
}