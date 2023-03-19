package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.models.Marque;
import com.basketapp.basket_app.services.MarqueService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/marque")
@CrossOrigin
public class MarqueRestController {
	
	@Autowired
	MarqueService marqueService;
	
	//Get all Marques
	@RequestMapping(method = RequestMethod.GET)
		public List<Marque> getAllMarques() {
			return marqueService.getAllMarques();
	    }
			
	//Get Marque by Id
	@RequestMapping(value="/{id}",method = RequestMethod.GET)
		public Marque getMarqueById(@PathVariable("id") Long id) {
			return marqueService.getMarque(id);
	    }
			
	//Create Marque
	@RequestMapping(path = "/create", method = RequestMethod.POST)
		public Marque createMarque(@RequestBody Marque marque) {
			return marqueService.saveMarque(marque);
	    }
			
	//Update Marque
	@RequestMapping(path = "/edit", method = RequestMethod.PUT)
		public Marque updateMarque(@RequestBody Marque marque) {
			return marqueService.updateMarque(marque);
		}
			
	//Delete Marque
	@RequestMapping(value="delete/{id}",method = RequestMethod.DELETE)
		public void deleteMarque(@PathVariable("id") Long id){
			marqueService.deleteMarqueById(id);
		}
}

