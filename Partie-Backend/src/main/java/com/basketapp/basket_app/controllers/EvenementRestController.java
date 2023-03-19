package com.basketapp.basket_app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.basketapp.basket_app.dao.EvenementRepos;
import com.basketapp.basket_app.models.Evenement;
import com.basketapp.basket_app.services.EvenementService;

@RestController
@RequestMapping("/evenement")
@CrossOrigin
public class EvenementRestController {

	@Autowired
	EvenementService evenementService;

	@Autowired
	EvenementRepos evenementrepos;

	// Get all Evenements
	@RequestMapping(method = RequestMethod.GET)
	public List<Evenement> getAllEvenements() {
		return evenementService.getAllEvenements();
	}

	// Get by Evenements
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Evenement getEvenementById(@PathVariable("id") Long id) {
		return evenementService.getEvenement(id);
	}

	// Create Evenements
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public Evenement createEvenement(@RequestBody Evenement e) {
		return evenementService.saveEvenement(e);
	}

	// Update Evenements
	@RequestMapping(path = "/edit/{id}", method = RequestMethod.PUT)
	public Evenement updateEvenement(@RequestBody Evenement e, @PathVariable("id") Long id) {
		Evenement evenement = evenementrepos.findById(id).orElse(null);
		evenement.setTitre(e.getTitre());
		evenement.setDebut(e.getDebut());
		evenement.setFin(e.getFin());
		return evenementService.updateEvenement(evenement);
	}

	// Delete Evenements
	@RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
	public void deleteEvenement(@PathVariable("id") Long id) {
		evenementService.deleteEvenementById(id);
	}

	// Recherche par jour

}
