package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.ActualiteRepos;
import com.basketapp.basket_app.models.Actualite;
import com.basketapp.basket_app.services.ActualiteService;

import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActualiteServiceImp implements ActualiteService{ 

    @Autowired
    ActualiteRepos actualiteRepos;
    

    @Override
    public Actualite createActualite(Actualite a) {
        
        return actualiteRepos.save(a);
    }

    @Override
    public void deleteActualite(Long id) {
        actualiteRepos.deleteById(id);
    }

    @Override
    public Actualite updateActualite(Actualite a) {

        return actualiteRepos.save(a);
    }

    @Override
    public List<Actualite> getAllActualites() {
        return actualiteRepos.findAllByOrderByDateAsc();
    }

    

    @Override
    public Actualite getActualite(Long id) {
        return actualiteRepos.findById(id).get();
    } 

}