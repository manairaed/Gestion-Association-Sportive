package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Ligue;


public interface LigueService {
    Ligue createLigue (Ligue l);
    void deleteLigue (Long id); 
    Ligue updateLigue (Ligue l); 
    Ligue getLigue(Long id);
    List <Ligue> getAllLigues();
}
