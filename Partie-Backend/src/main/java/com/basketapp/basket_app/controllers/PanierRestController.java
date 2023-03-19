/*package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.models.Categorie;
import com.basketapp.basket_app.services.CategorieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/categorie")
@CrossOrigin
public class PanierRestController {
	
	@Autowired
	CategorieService categorieService;
	
	//Get all 
			@RequestMapping(method = RequestMethod.GET)
			public List<Categorie> getAllMarques() {
				return categorieService.getAllCategories();
			}
			
			//Get  by Id
			@RequestMapping(value="/{id}",method = RequestMethod.GET)
			public Categorie getCategorieById(@PathVariable("id") Long id) {
				return categorieService.getCategorie(id);
			}
			
			//Create 
			@RequestMapping(method = RequestMethod.POST)
			public Categorie createCategorie(@RequestBody Categorie categorie) {
				return categorieService.createCategorie(categorie);
			}
			
			//Update 
			@RequestMapping(method = RequestMethod.PUT)
			public Categorie modifierCategorie(@RequestBody Categorie categorie) {
				return categorieService.modifierCategorie(categorie);
			}
			
			//Delete 
			@RequestMapping(value="/{id}",method = RequestMethod.DELETE)
			public void deleteCategorie(@PathVariable("id") Long id){
				categorieService.deleteCategorie(id);
			}

}
*/

