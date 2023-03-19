package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Evenement;

public interface EvenementService {
	Evenement saveEvenement(Evenement e);
	void deleteEvenementById (Long id);
	Evenement updateEvenement (Evenement e);
	Evenement getEvenement(Long id);
	List <Evenement> getAllEvenements(); 
}
