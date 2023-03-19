package com.basketapp.basket_app.controllers;


import com.basketapp.basket_app.models.ProduitPanier;
import com.basketapp.basket_app.services.ProduitPanierService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
@CrossOrigin
public class ProduitPanierRestController {

    @Autowired
	ProduitPanierService produitpanierService;

    @PostMapping(value="/{idUser}/{idProduit}")
    public ProduitPanier ajoutProduitPanier(@PathVariable("idUser") Long idUser, @PathVariable("idProduit") Long idProduit) {
        return produitpanierService.ajoutProduitPanier(idUser, idProduit); 
    } 
}
