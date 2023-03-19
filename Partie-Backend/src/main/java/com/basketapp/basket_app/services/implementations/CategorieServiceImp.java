package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.CategorieRepos;
import com.basketapp.basket_app.models.Categorie;
import com.basketapp.basket_app.services.CategorieService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategorieServiceImp implements CategorieService{ 

    @Autowired
    CategorieRepos categorieRepos;

    @Override
    public Categorie createCategorie(Categorie c) {
        return categorieRepos.save(c);
    }

    @Override
    public void deleteCategorie(Long id) {
         categorieRepos.deleteById(id);
    }

    @Override
    public Categorie updateCategorie(Categorie c) {
        return categorieRepos.save(c);
    }

    @Override
    public List<Categorie> getAllCategories() {
        return categorieRepos.findAll();
    }

    @Override
    public Categorie getCategorie(Long id) {
        return categorieRepos.findById(id).get();
        
    } 

}