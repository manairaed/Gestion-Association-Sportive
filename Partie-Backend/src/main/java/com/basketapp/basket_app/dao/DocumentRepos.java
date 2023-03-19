package com.basketapp.basket_app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.basketapp.basket_app.models.Document;

@Repository
public interface DocumentRepos extends JpaRepository<Document,Long>{
	
}