package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Categorie;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategorieRepos extends JpaRepository<Categorie,Long>{

}