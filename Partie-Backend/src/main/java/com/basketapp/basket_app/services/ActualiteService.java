package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Actualite;

public interface ActualiteService   {
    Actualite createActualite (Actualite a);
    void deleteActualite (Long id); 
    Actualite updateActualite (Actualite a); 
    Actualite getActualite(Long id);
    List <Actualite> getAllActualites(); 
}
