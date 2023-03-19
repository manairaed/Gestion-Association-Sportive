package com.basketapp.basket_app.controllers;

import com.basketapp.basket_app.dao.StadeRepos;
import com.basketapp.basket_app.models.Stade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/Satdee")
@CrossOrigin(origins = "http://localhost:4200")
public class StadeRestController {

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

    //Modifier ligue
    @RequestMapping(method = RequestMethod.PUT)
    public Stade updateStade(@RequestBody Stade stade) {
        return stadeRepos.save(stade);
    }

    //supprimer ligue
    @RequestMapping(value="/{id}",method = RequestMethod.DELETE)
    public void deleteStade(@PathVariable("id") Long id){
        stadeRepos.deleteById(id);
    }



}


