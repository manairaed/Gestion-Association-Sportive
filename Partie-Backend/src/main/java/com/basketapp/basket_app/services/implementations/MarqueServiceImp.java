package com.basketapp.basket_app.services.implementations;

import java.util.List;

import com.basketapp.basket_app.dao.MarqueRepos;
import com.basketapp.basket_app.models.Marque;
import com.basketapp.basket_app.services.MarqueService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MarqueServiceImp implements MarqueService{

    @Autowired
	MarqueRepos marqueRepository;

    @Override
    public Marque saveMarque(Marque m) {
        return marqueRepository.save(m);
    }

    @Override
    public Marque updateMarque(Marque m) {
        return marqueRepository.save(m);
    }

    @Override
    public void deleteMarque(Marque m) {
        marqueRepository.delete(m);
        
    }

    @Override
    public void deleteMarqueById(Long id) {
        marqueRepository.deleteById(id);
        
    }

    @Override
    public Marque getMarque(Long id) {
        return marqueRepository.findById(id).get();
    }

    @Override
    public List<Marque> getAllMarques() {
        return marqueRepository.findAll();
    } 

    
    
}