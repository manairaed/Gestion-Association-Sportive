package com.basketapp.basket_app.services.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.basketapp.basket_app.dao.EvenementRepos;
import com.basketapp.basket_app.models.Evenement;
import com.basketapp.basket_app.services.EvenementService;


@Service
public class EvenementServiceImp implements EvenementService {
	
	 @Autowired
	 EvenementRepos evenementRepos ;

	@Override
	public Evenement saveEvenement(Evenement e) {
		
		return  evenementRepos.save(e) ;
		
	}

	@Override
	public Evenement updateEvenement(Evenement e) {
		
		return evenementRepos.save(e);
	}

	@Override
	public void deleteEvenementById(Long id) {
		evenementRepos.deleteById(id);
	}

	@Override
	public Evenement getEvenement(Long id) {
		return evenementRepos.findById(id).get();
	}

	@Override
	public List<Evenement> getAllEvenements() {
		return evenementRepos.findAll() ;
	}

}
