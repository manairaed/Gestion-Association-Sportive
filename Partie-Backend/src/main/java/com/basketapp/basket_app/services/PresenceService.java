package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.dto.UtilisateurDto;
import com.basketapp.basket_app.models.Presence;
import com.basketapp.basket_app.models.Utilisateur;

public interface PresenceService {
    Presence savePresence(Presence p,Utilisateur u);
	List <UtilisateurDto> getAlljoueurs();
    Presence findUserByUsername (String username);
}
