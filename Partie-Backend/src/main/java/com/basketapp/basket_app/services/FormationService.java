package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Formation;

public interface FormationService   {
    Formation saveFormation(Formation f);
	void deleteFormationById (Long id);
	Formation updateFormation (Formation f);
	Formation getFormation(Long id);
	List <Formation> getAllFormations(); 
}
