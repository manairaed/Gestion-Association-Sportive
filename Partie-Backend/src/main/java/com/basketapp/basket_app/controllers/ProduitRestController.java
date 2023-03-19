package com.basketapp.basket_app.controllers;

import com.basketapp.basket_app.dao.ProduitRepos;
import com.basketapp.basket_app.models.Produit;
import com.basketapp.basket_app.models.Stade;
import com.basketapp.basket_app.services.ProduitService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Produit")
@CrossOrigin(origins = "http://localhost:4200")
public class ProduitRestController {
	
	@Autowired
	ProduitService produitService;

	@Autowired
	ProduitRepos produitRepos;
	

	//Get produit by Id
	@RequestMapping(value="/getProduitById/{id}",method = RequestMethod.GET)
	public Produit getProduit(@PathVariable("id") Long id) {
		System.out.println("-----------"+id);
		return produitService.getProduitById(id);
	}
	@RequestMapping(path = "/getAll",method = RequestMethod.GET)
	public List<Produit> getAllProduit() {
		return produitRepos.findAll();
	}
		//Create produit
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public Produit createProduit(@RequestBody Produit produit) {
		return produitService.createProduit(produit);
	}
	@RequestMapping(path = "/update", method = RequestMethod.PUT)
	public Produit UpdateProduit(@RequestBody Produit produit) {
		return produitService.createProduit(produit);
	}
			
	//Update produit
	@RequestMapping(path = "/edit/{id}", method = RequestMethod.POST)
	public Produit modifierProduit(@PathVariable("id") Long id, @RequestBody Produit produit) {
		Produit getProduit = produitService.getProduitById(id);
		if(getProduit != null){
			return produitService.updateProduit(produit);
		}else return null;
	}
			
	//Delete produit
	@RequestMapping(value="delete/{id}",method = RequestMethod.DELETE)
	public void deleteProduit(@PathVariable("id") Long id){
		produitService.deleteProduit(id);
	}

	//recherche produit par nom
	@RequestMapping(value="/{nom}",method = RequestMethod.GET)
	public List<Produit> rechercherProduitByNom(@PathVariable("nom") String nom){
	    return produitService.rechercherProduitByNom(nom);
	} 

	//recherche produit par 
	@RequestMapping(value="/{part}",method = RequestMethod.GET)
	public List<Produit> findProduitByPart(@PathVariable("part") String part){
		return produitService.rechercherProduitByNom(part);
	}

	//get all produits
	@RequestMapping(method = RequestMethod.GET)
	public List<Produit> rechercherProduitByPart(){
		return produitRepos.findAll();
	}

	//favoriser un produit
	@RequestMapping(value="/{id}",method = RequestMethod.POST)
	public Produit favoriserProduit(@PathVariable("id") Long id) {
			return produitService.favoriserProduit(id);
	}
}

