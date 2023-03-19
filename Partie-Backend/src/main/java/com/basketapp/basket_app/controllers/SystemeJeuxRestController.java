package com.basketapp.basket_app.controllers;


import com.basketapp.basket_app.dao.SystemeJeuxRepos;
import com.basketapp.basket_app.models.SystemeJeux;
import com.basketapp.basket_app.services.SystemeJeuxService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/systemejeux")
@CrossOrigin(origins = "http://localhost:4200")
public class SystemeJeuxRestController {
	
	@Autowired  
    SystemeJeuxService systemeJeuxService;	
	
	@Autowired
	SystemeJeuxRepos systemejeuxRepos;

	
	
	@RequestMapping(method = RequestMethod.GET)
	public List<SystemeJeux> getTousSystemeJeux() {
		return systemejeuxRepos.findAll();
	}

	//Get système de jeux by Id
	@GetMapping(value="/{id}")
	public SystemeJeux getSystemeJeuxById(@PathVariable("id") Long id) {
		return systemeJeuxService.getSystemeJeux(id);
	} 
		
	//Create système de jeux
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public SystemeJeux createSystemeJeux(@RequestBody SystemeJeux s) {
		return systemeJeuxService.createSystemeJeux(s);
	}
			
	//Update système de jeux
	@RequestMapping(path = "/edit", method = RequestMethod.POST)
	public SystemeJeux modifierSystemeJeux(@RequestBody SystemeJeux s) {
		return systemeJeuxService.updateSystemeJeux(s);
	}
			
	//Delete système de jeux
	@RequestMapping(value="/delete/{id}",method = RequestMethod.DELETE)
	public void deleteSystemeJeux(@PathVariable("id") Long id){
		systemeJeuxService.deleteSystemeJeux(id);
	}

	//favoriser système de jeux
	@RequestMapping(value="/{id}",method = RequestMethod.POST)
	public SystemeJeux favoriserSystemeJeux(@PathVariable("id") Long id) {
		return systemeJeuxService.favoriserSystemeJeux(id);
	}
                	
}

