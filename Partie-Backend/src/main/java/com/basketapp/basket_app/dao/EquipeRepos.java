package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Equipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EquipeRepos extends JpaRepository<Equipe,Long> {

}
