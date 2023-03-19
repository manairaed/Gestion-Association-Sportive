package com.basketapp.basket_app.services;


import com.basketapp.basket_app.models.Rating;

public interface RatingService {
    float getUserRatingByProductId(Long idProduit);
    Rating createRate(Rating r);
}
