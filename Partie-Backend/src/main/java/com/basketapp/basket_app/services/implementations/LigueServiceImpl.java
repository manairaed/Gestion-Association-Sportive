package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.LigueRepos;
import com.basketapp.basket_app.models.Ligue;
import com.basketapp.basket_app.services.LigueService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LigueServiceImpl implements LigueService{

    @Autowired
    LigueRepos ligueRepos;

    @Override
    public Ligue createLigue(Ligue l) {
        return ligueRepos.save(l);
    }

    @Override
    public void deleteLigue(Long id) {
        ligueRepos.deleteById(id);
        
    }

    @Override
    public Ligue updateLigue(Ligue l) {
        return ligueRepos.save(l);
    }

    @Override
    public Ligue getLigue(Long id) {
        return ligueRepos.findById(id).get();
    }

    @Override
    public List<Ligue> getAllLigues() {
        return ligueRepos.findAll();
    }
    
}
