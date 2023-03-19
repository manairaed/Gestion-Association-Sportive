package com.basketapp.basket_app.dao;

import com.basketapp.basket_app.models.SystemeJeux;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SystemeJeuxRepos extends JpaRepository<SystemeJeux,Long> {
    
}
