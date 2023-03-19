package com.basketapp.basket_app.controllers;

import com.basketapp.basket_app.dao.StadeRepos;
import com.basketapp.basket_app.models.Equipe;
import com.basketapp.basket_app.models.Stade;
import com.basketapp.basket_app.services.EquipeService;
import com.basketapp.basket_app.services.StadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/Equipe")
@CrossOrigin
public class EquipeRestController {

    @Autowired
    EquipeService equipeService;

    @Autowired
    StadeService stadeService;

    @Autowired
    StadeRepos stadeRepos;

    @RequestMapping(method = RequestMethod.GET)
    public List<Stade> getAllStade() {
        return stadeRepos.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public Stade createStade(@RequestBody Stade stade) {
        return stadeRepos.save(stade);
    }

    // Modifier ligue
    @RequestMapping(method = RequestMethod.PUT)
    public Stade updateStade(@RequestBody Stade stade) {
        return stadeRepos.save(stade);
    }

    // supprimer ligue
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteStade(@PathVariable("id") Long id) {
        stadeRepos.deleteById(id);
    }

    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public Equipe createEquipe(@RequestBody Equipe equipe) {
        return equipeService.createEquipe(equipe);
    }

    // Modifier ligue
    @RequestMapping(path = "/update", method = RequestMethod.PUT)
    public Equipe updateEquipe(@RequestBody Equipe equipe) {
        return equipeService.updateEquipe(equipe);
    }

    // supprimer ligue
    @RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
    public void deleteEquipe(@PathVariable("id") Long id) {
        equipeService.deleteEquipe(id);
    }

    @RequestMapping(path = "/Equipes", method = RequestMethod.GET)
    public List<Equipe> getAllLigues() {
        return equipeService.getAllEquipes();
    }

    @RequestMapping(path = "/Satades", method = RequestMethod.GET)
    public List<Stade> getAllLstade() {
        return stadeService.getAllStades();
    }

}
