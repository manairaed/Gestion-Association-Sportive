package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Actualite;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ActualiteRepos extends JpaRepository<Actualite,Long>{
    @Query("select a from Actualite a ORDER BY a.actualitedate DESC")
    List<Actualite> findAllByOrderByDateAsc();
}