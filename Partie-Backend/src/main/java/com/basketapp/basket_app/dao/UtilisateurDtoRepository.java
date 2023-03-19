package com.basketapp.basket_app.dao;

import com.basketapp.basket_app.dto.UtilisateurDto;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UtilisateurDtoRepository extends JpaRepository<UtilisateurDto, Long>{
    
}

