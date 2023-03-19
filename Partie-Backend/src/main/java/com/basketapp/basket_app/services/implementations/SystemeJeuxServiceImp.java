package com.basketapp.basket_app.services.implementations;

import com.basketapp.basket_app.dao.SystemeJeuxRepos;
import com.basketapp.basket_app.models.SystemeJeux;
import com.basketapp.basket_app.services.SystemeJeuxService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemeJeuxServiceImp implements SystemeJeuxService{

    @Autowired
    SystemeJeuxRepos systemeJeuxRepos;

    @Override
    public SystemeJeux createSystemeJeux(SystemeJeux s) {
        
        return  systemeJeuxRepos.save(s);
    }

    @Override
    public void deleteSystemeJeux(Long id) {
        systemeJeuxRepos.deleteById(id);        
    }

    @Override
    public SystemeJeux updateSystemeJeux( SystemeJeux s) {
        return  systemeJeuxRepos.save(s);
    }

    @Override
    public SystemeJeux getSystemeJeux(Long id) {
        return  systemeJeuxRepos.findById(id).get();
    }

    @Override
    public SystemeJeux favoriserSystemeJeux(Long id) {
        SystemeJeux updateSystemeJeux = systemeJeuxRepos.findById(id).get();
        updateSystemeJeux.setFavoris(!updateSystemeJeux.getFavoris());
        systemeJeuxRepos.saveAndFlush(updateSystemeJeux);
        return updateSystemeJeux; 
    }
    
    
}
