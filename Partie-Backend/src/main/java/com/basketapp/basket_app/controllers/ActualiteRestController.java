package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.dao.ActualiteRepos;
import com.basketapp.basket_app.models.Actualite;
import com.basketapp.basket_app.services.ActualiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/actualite")
@CrossOrigin
public class ActualiteRestController {

	@Autowired
	ActualiteService actualiteService;

	@Autowired
	ActualiteRepos actualiteRepos;

	// Get all actualites
	@RequestMapping(method = RequestMethod.GET)
	public List<Actualite> getAllActualites() {
		return actualiteService.getAllActualites();
	}

	// Get actualite by Id
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Actualite getActualiteById(@PathVariable("id") Long id) {
		return actualiteService.getActualite(id);
	}

	// Create actualite
	@RequestMapping(method = RequestMethod.POST)
	public Actualite createActualite(@RequestBody Actualite a) {
		return actualiteService.createActualite(a);
	}

	@RequestMapping(path = "/edit/{id}", method = RequestMethod.PUT)
	public Actualite updateAcut(@RequestBody Actualite actualite, @PathVariable("id") Long id) {
		Actualite actualites = actualiteRepos.findById(id).orElse(null);
		actualites.setContenu(actualite.getContenu());
		actualites.setTitre(actualite.getTitre());
		actualites.setImage(actualite.getImage());
		return actualiteRepos.save(actualites);
	}

	// Update actualite
	@RequestMapping(method = RequestMethod.PUT)
	public Actualite modifierActualite(@RequestBody Actualite a) {
		return actualiteService.updateActualite(a);
	}

	// Delete actualite by id
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteActualite(@PathVariable("id") Long id) {
		actualiteService.deleteActualite(id);
	}

	// Modifier images
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public Actualite modifierImage(@PathVariable("id") Long id, @RequestParam("imagefile") String file)
			throws Exception {
		Actualite a = actualiteRepos.findById(id).get();
		a.setImage(file);
		return actualiteRepos.save(a);
	}

}