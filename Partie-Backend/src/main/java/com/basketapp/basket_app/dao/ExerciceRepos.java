package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Exercice;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExerciceRepos  extends JpaRepository<Exercice,Long>{
    
}
