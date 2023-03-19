package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Marque;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MarqueRepos extends JpaRepository<Marque,Long>{
    
}

