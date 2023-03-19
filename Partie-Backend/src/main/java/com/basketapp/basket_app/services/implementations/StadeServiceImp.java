package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.StadeRepos;
import com.basketapp.basket_app.models.Stade;
import com.basketapp.basket_app.services.StadeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class StadeServiceImp implements StadeService {

    @Autowired
    StadeRepos stadeRepos;
    @Override
    public Stade createStade(Stade s) {
        return   stadeRepos.save(s)  ;
    }

    @Override
    public Stade updateStade(Stade s) {
        return stadeRepos.save(s);
    }

  
    @Override
    public void deleteStadeById(Long id) {
        stadeRepos.deleteById(id);        
    }

    @Override
    public Stade getStade(Long id) {
        return stadeRepos.findById(id).get();
    }

    @Override
    public List<Stade> getAllStades() {
        return stadeRepos.findAll();
    }
    
}
