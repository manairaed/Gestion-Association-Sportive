package com.basketapp.basket_app.services.implementations;

import java.util.ArrayList;
import java.util.List;

import com.basketapp.basket_app.dao.RatingRepos;
import com.basketapp.basket_app.models.Rating;
import com.basketapp.basket_app.services.RatingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RatingServiceImp implements RatingService {
    
    @Autowired
    private RatingRepos ratingRepos;


    @Override
    public float getUserRatingByProductId(Long idProduit) {
        List<Rating> finalList = new ArrayList<>() ;  
        int usersNum = 0 ; 
        int ratingSum = 0 ;  

        List<Rating> ratings = this.ratingRepos.findAll(); 
        for (Rating rate:ratings){
            if (rate.getProduit().getIdProduit() == idProduit){
                finalList.add(rate) ;
                ratingSum += rate.getRate();  
            }
        }
        usersNum = finalList.size(); 

        return (ratingSum/usersNum) ; 
       
        
    }

    public Rating createRate(Rating r) {
        
        return ratingRepos.save(r);
    }
    
}
