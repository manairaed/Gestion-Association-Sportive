package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Stade;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StadeRepos extends JpaRepository<Stade, Long> {

}
