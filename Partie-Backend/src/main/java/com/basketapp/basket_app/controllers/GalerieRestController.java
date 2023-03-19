package com.basketapp.basket_app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.basketapp.basket_app.models.Galerie;
import com.basketapp.basket_app.services.GalerieService;

@RestController
@RequestMapping("/galerie")
@CrossOrigin
public class GalerieRestController {

    @Autowired
	GalerieService galerieService;

    //Get all Galeries
	@RequestMapping(method = RequestMethod.GET)
	public List<Galerie> getAllGaleries() {
		return galerieService.getAllGaleries();
	}

    //Get Galerie by id
	@RequestMapping(value="/{id}",method = RequestMethod.GET)
	public Galerie getGalerieById(@PathVariable("id") Long id) {
		return galerieService.getGalerie(id);
	}

    //Create Galerie
	@RequestMapping(method = RequestMethod.POST)
	public Galerie createGalerie(@RequestBody Galerie g) {
		return galerieService.saveGalerie(g);
	}

    //Update Galerie
	@RequestMapping(method = RequestMethod.PUT)
	public Galerie updateGalerie(@RequestBody Galerie g) {
		return galerieService.updateGalerie(g);
	}

    //Delete Galerie
	@RequestMapping(value="/{id}",method = RequestMethod.DELETE)
	public void deleteGalerie(@PathVariable("id") Long id){
		galerieService.deleteGalerietById(id);
	}

}
