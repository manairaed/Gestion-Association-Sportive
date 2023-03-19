package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Exercice;

public interface ExerciceService {
    Exercice saveExercice(Exercice ex);
	void deleteExercicetById (Long id);
	Exercice updateExercice (Exercice ex);
	Exercice getExercice(Long id);
	List <Exercice> getAllExercices();
}
