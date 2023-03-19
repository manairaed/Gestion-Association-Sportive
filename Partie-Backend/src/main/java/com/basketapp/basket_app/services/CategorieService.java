package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Categorie;


public interface CategorieService {
    Categorie createCategorie (Categorie c);
    void deleteCategorie (Long id); 
    Categorie updateCategorie (Categorie c); 
    Categorie getCategorie(Long id);
    List <Categorie> getAllCategories(); 
}