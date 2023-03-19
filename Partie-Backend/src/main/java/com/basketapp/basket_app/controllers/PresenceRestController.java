package com.basketapp.basket_app.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.basketapp.basket_app.dto.UtilisateurDto;
import com.basketapp.basket_app.models.Presence;
import com.basketapp.basket_app.models.Utilisateur;
import com.basketapp.basket_app.services.PresenceService;
import com.basketapp.basket_app.services.UtilisateurService;

@RestController
@RequestMapping("/presence")
@CrossOrigin
public class PresenceRestController {
    
    @Autowired 
	PresenceService presenceService;

    @Autowired
	UtilisateurService utilisateurService;

	@Autowired
	private ModelMapper modelMapper;

    //Create Evenements
	@RequestMapping(method = RequestMethod.POST)
	public Presence createPresence(@RequestBody Presence p, Utilisateur u) {
		return presenceService.savePresence(p,u);
	}

    //Get all utilisatuer Dto
	@RequestMapping(path = "all",method = RequestMethod.GET)
	public List<UtilisateurDto> getAllUtilisateursDto() {
		return utilisateurService.getAllUtilisateurs().stream().map(utilisateur -> modelMapper.map(utilisateur, UtilisateurDto.class))
			.collect(Collectors.toList());
	}

	//findByusername
	//get user by username
	@RequestMapping(value = "/{username}", method = RequestMethod.GET)
	public Presence getUtilisateurByUsername(@PathVariable("username") String nom) {
		return presenceService.findUserByUsername(nom);
	}


	
}
