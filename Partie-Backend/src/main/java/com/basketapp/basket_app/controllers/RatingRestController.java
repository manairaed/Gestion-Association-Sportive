package com.basketapp.basket_app.controllers;

import com.basketapp.basket_app.models.Rating;
import com.basketapp.basket_app.services.RatingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rating")
public class RatingRestController {


    @Autowired
    private RatingService ratingService;

    @PostMapping(value="/add")
    public Rating CreateRate(@RequestBody Rating rate ){
        return ratingService.createRate(rate);
    }

}
    

