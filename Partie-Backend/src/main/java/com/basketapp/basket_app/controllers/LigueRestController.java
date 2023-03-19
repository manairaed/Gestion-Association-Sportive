package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.dao.LigueRepos;
import com.basketapp.basket_app.models.Ligue;
import com.basketapp.basket_app.services.LigueService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ligue")
@CrossOrigin
public class LigueRestController {
    
    @Autowired
	LigueService ligueService;

	@Autowired
	LigueRepos ligueRepos;


    //Afficher tous les ligues 
	@RequestMapping(path = "/Ligues",method = RequestMethod.GET)
	public List<Ligue> getAllLigues() {
		return ligueService.getAllLigues();
	}

    //Afficher ligue par l'id
	@RequestMapping(value="/{id}",method = RequestMethod.GET)
	public Ligue getLigueById(@PathVariable("id") Long id) {
		return ligueService.getLigue(id);
	}

    //Ajouter une ligue 
	@RequestMapping(method = RequestMethod.POST)
	public Ligue createLigue(@RequestBody Ligue ligue) {
		return ligueService.createLigue(ligue);
	}

    //Modifier ligue

	@RequestMapping(method = RequestMethod.PUT)
	public Ligue updateLigue(@RequestBody Ligue ligue) {
		return ligueRepos.save(ligue);
		//return ligueService.updateLigue(ligue);
	}

    //supprimer ligue
	@RequestMapping(value="/{id}",method = RequestMethod.DELETE)
	public void deleteLigue(@PathVariable("id") Long id){
		ligueService.deleteLigue(id);
	} 
}
