package com.basketapp.basket_app.services.implementations;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basketapp.basket_app.dao.PresenceRepos;
import com.basketapp.basket_app.dao.UtilisateurDtoRepository;
import com.basketapp.basket_app.dto.UtilisateurDto;
import com.basketapp.basket_app.models.Presence;
import com.basketapp.basket_app.models.Utilisateur;
import com.basketapp.basket_app.services.PresenceService;

@Service
public class PresenceServiceImpl implements PresenceService{
     
     @Autowired
	 PresenceRepos presenceRepos ;

     @Autowired
     UtilisateurDtoRepository userRepos;

    @Override
    public Presence savePresence(Presence p,Utilisateur u) {
        String username = u.getNomUtil();
        p.setUsername(username);
        return presenceRepos.save(p);
    }

    @Override
    public List<UtilisateurDto> getAlljoueurs() {
        return userRepos.findAll();
    }

    @Override
    public Presence findUserByUsername(String username) {
        return presenceRepos.findByUsername(username);
    }
    
}
