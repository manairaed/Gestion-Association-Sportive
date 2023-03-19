package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.EquipeRepos;
import com.basketapp.basket_app.models.Equipe;
import com.basketapp.basket_app.services.EquipeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class EquipeServiceImp implements EquipeService {

    @Autowired
    EquipeRepos equipeRepos;

    @Override
    public Equipe createEquipe(Equipe e) {
        return equipeRepos.save(e);
    }

    @Override
    public void deleteEquipe(Long id) {
        equipeRepos.deleteById(id);
    }

    @Override
    public Equipe updateEquipe(Equipe e) {
        return equipeRepos.save(e);
    }

    @Override
    public Equipe getEquipe(Long id) {
        return equipeRepos.findById(id).get();
    }

    @Override
    public List<Equipe> getAllEquipes() {
        return equipeRepos.findAll();
    }

    
}
