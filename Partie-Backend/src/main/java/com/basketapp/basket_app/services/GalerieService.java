package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Galerie;

public interface GalerieService {
    Galerie saveGalerie(Galerie g);
	void deleteGalerietById (Long id);
	Galerie updateGalerie (Galerie g);
	Galerie getGalerie(Long id);
	List <Galerie> getAllGaleries();
}
