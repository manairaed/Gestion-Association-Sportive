package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.dao.FormationRepos;
import com.basketapp.basket_app.models.Formation;
import com.basketapp.basket_app.services.FormationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/formation")
@CrossOrigin
public class FormationRestController {

    @Autowired
	FormationService formationService;
    
    @Autowired
   	FormationRepos formationRepos;

	//find formartion by type
    @RequestMapping(value = "/alltype/{type}", method = RequestMethod.GET)
    public List<Formation> getAllFormationsByType(@PathVariable("type") String type){	
    	return formationRepos.findAllByType(type);
	}


    //Get all Formations
	@RequestMapping(method = RequestMethod.GET)
	public List<Formation> getAllFormations() {
		return formationService.getAllFormations();
	}
	
	//Get Formation by id
	@RequestMapping(value="/{id}",method = RequestMethod.GET)
	public Formation getFormationById(@PathVariable("id") Long id) {
		return formationService.getFormation(id);
	}
	
	//Create Formation
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public Formation createExercice(@RequestBody Formation f) {
		return formationService.saveFormation(f);
	}
	
	//Update Formation
	@RequestMapping(path = "edit", method = RequestMethod.POST)
	public Formation updateExercice(@RequestBody Formation f) {
		return formationService.updateFormation(f);
	}
	
	//Delete Formation
	@RequestMapping(value="delete/{id}",method = RequestMethod.DELETE)
	public void deleteExercice(@PathVariable("id") Long id){
		formationService.deleteFormationById(id); 
	}
   
}

