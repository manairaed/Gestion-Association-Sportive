package com.basketapp.basket_app.controllers;

import java.util.List;

import com.basketapp.basket_app.models.Match;
import com.basketapp.basket_app.services.MatchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
    
@RestController
@RequestMapping("/match")
@CrossOrigin
public class MatchRestController {
    
    @Autowired
	MatchService matchService;

    //Afficher tous les matchs 
	@RequestMapping(path = "/getmatch",method = RequestMethod.GET)
	public List<Match> getAllMatchs() {
		return matchService.getAllMatchs();
	}

    //Afficher match par l'id
	@RequestMapping(value="/{id}",method = RequestMethod.GET)
	public Match getMatchById(@PathVariable("id") Long id) {
		return matchService.getMatch(id);
	}

    //Ajouter une match
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public Match createMatch(@RequestBody Match match) {
		return matchService.createMatch(match);
	}

    //Modifier match
	@RequestMapping(path = "edit", method = RequestMethod.POST)
	public Match updateLigue(@RequestBody Match match) {
		return matchService.updateMatch(match);
	}

    //supprimer match
	@RequestMapping(value="delete/{id}",method = RequestMethod.DELETE)
	public void deleteMatch(@PathVariable("id") Long id){
		matchService.deleteMatch(id);
	}
}

