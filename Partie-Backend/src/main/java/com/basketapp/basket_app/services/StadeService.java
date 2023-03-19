package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Stade;

public interface StadeService {
    Stade createStade(Stade s);
	Stade updateStade (Stade s);
	void deleteStadeById (Long id);
	Stade getStade(Long id);
	List <Stade> getAllStades(); 
}
    

