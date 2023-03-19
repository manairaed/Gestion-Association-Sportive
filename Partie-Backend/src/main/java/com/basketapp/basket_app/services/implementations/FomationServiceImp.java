package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.FormationRepos;
import com.basketapp.basket_app.models.Formation;
import com.basketapp.basket_app.services.FormationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FomationServiceImp  implements FormationService{

    @Autowired
    FormationRepos formationRepos;
    @Override
    public Formation getFormation(Long id) {
        
        return  formationRepos.findById(id).get();
    }

    @Override
    public List<Formation> getAllFormations() {
        return  formationRepos.findAll();       
    }

    @Override
    public Formation saveFormation(Formation f) {
        return formationRepos.save(f);
    }

    @Override
    public void deleteFormationById(Long id) {
        formationRepos.deleteById(id);;        
    }

    @Override
    public Formation updateFormation(Formation f) {
        return formationRepos.save(f);
    }
    
}
