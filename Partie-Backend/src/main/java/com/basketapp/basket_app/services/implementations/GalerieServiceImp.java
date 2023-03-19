package com.basketapp.basket_app.services.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basketapp.basket_app.dao.GalerieRepos;
import com.basketapp.basket_app.models.Galerie;
import com.basketapp.basket_app.services.GalerieService;

@Service
public class GalerieServiceImp implements GalerieService{

    @Autowired
    GalerieRepos galerieRepos;

    @Override
    public Galerie saveGalerie(Galerie g) {
        return galerieRepos.save(g);
    }

    @Override
    public void deleteGalerietById(Long id) {
        galerieRepos.deleteById(id);
        
    }

    @Override
    public Galerie updateGalerie(Galerie g) {
        return galerieRepos.save(g);
    }

    @Override
    public Galerie getGalerie(Long id) {
        return galerieRepos.findById(id).get();
    }

    @Override
    public List<Galerie> getAllGaleries() {
        return galerieRepos.findAll();
    }
    
}
