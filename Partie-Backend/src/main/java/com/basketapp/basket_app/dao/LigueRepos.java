package com.basketapp.basket_app.dao;

import com.basketapp.basket_app.models.Ligue;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LigueRepos extends JpaRepository<Ligue,Long>{

    
}
