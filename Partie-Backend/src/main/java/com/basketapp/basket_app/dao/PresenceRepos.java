package com.basketapp.basket_app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.basketapp.basket_app.models.Presence;


@Repository
public interface PresenceRepos extends JpaRepository<Presence,Long> {
    Presence findByUsername (String userName);
}
