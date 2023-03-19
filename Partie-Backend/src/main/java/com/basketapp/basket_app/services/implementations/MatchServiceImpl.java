package com.basketapp.basket_app.services.implementations;

import java.util.List;


import com.basketapp.basket_app.dao.MatchRepos;
import com.basketapp.basket_app.models.Match;
import com.basketapp.basket_app.services.MatchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class MatchServiceImpl implements MatchService{

    @Autowired
    MatchRepos matchRepos;

    @Override
    public Match createMatch(Match m) {
        return matchRepos.save(m);
    }

    @Override
    public void deleteMatch(Long id) {
        matchRepos.deleteById(id);
        
    }

    @Override
    public Match updateMatch(Match m) {
        return matchRepos.save(m);
    }

    @Override
    public Match getMatch(Long id) {
        return matchRepos.findById(id).get();
    }

    @Override
    public List<Match> getAllMatchs() {
        return matchRepos.findAll();
    }
    
}
