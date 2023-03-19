package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.ExerciceRepos;
import com.basketapp.basket_app.models.Exercice;
import com.basketapp.basket_app.services.ExerciceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExerciceServiceImp implements ExerciceService {

    @Autowired
    ExerciceRepos exerciceRepos;


    @Override
    public Exercice getExercice(Long id) {
        return exerciceRepos.findById(id).get();
    }

    @Override
    public List<Exercice> getAllExercices() {
        return exerciceRepos.findAll();
    }

    @Override
    public Exercice saveExercice(Exercice ex) {
        return exerciceRepos.save(ex);
    }

    @Override
    public void deleteExercicetById(Long id) {
        exerciceRepos.deleteById(id);  
    }

    @Override
    public Exercice updateExercice(Exercice ex) {
        return exerciceRepos.save(ex);
    }
    
}
