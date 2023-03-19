package com.basketapp.basket_app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.basketapp.basket_app.models.Galerie;

@Repository
public interface GalerieRepos extends JpaRepository<Galerie,Long>{
    
}
