package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.models.Exercice;
import com.basketapp.basket_app.services.ExerciceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value =	"/exercice")
@CrossOrigin(origins = "http://localhost:4200")
public class ExerciceRestController {

    @Autowired
	ExerciceService exerciceService;
    
    //Get all Exercices
    
    	
	@RequestMapping(method = RequestMethod.GET)
	public List<Exercice> getAllExercices() {
		return exerciceService.getAllExercices();
	}
	
	//Get Exercice by id
	@RequestMapping(value="/{id}",method = RequestMethod.GET)
	public Exercice getExerciceById(@PathVariable("id") Long id) {
		return exerciceService.getExercice(id);
	}
	
	//Create Exercice
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public Exercice createExercice(@RequestBody Exercice ex) {
		return exerciceService.saveExercice(ex);
	}
	
	//Update Exercice
	@RequestMapping(path = "edit", method = RequestMethod.POST)
	public Exercice updateExercice(@RequestBody Exercice ex) {
		return exerciceService.updateExercice(ex);
	}
	
	//Delete Exercice
	@RequestMapping(value="delete/{id}",method = RequestMethod.DELETE)
	public void deleteExercice(@PathVariable("id") Long id){
		exerciceService.deleteExercicetById(id); 
	}
	
}

