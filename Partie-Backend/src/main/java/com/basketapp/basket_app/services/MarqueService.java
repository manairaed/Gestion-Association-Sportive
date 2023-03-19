package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Marque;

public interface MarqueService {
    Marque saveMarque(Marque m);
	Marque updateMarque (Marque m);
	void deleteMarque (Marque m);
	void deleteMarqueById (Long id);
	Marque getMarque(Long id);
	List <Marque> getAllMarques(); 
}