package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.models.Match;

public interface MatchService {
    Match createMatch (Match m);
    void deleteMatch (Long id);
    Match updateMatch (Match m);
    Match getMatch(Long id);
    List <Match> getAllMatchs();
}
