package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Equipe;

public interface EquipeService {
    Equipe createEquipe(Equipe e);
    void deleteEquipe (Long id); 
    Equipe updateEquipe (Equipe e); 
    Equipe getEquipe(Long id);
    List <Equipe> getAllEquipes();
}
