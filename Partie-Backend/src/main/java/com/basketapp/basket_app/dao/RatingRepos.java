package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Rating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RatingRepos extends JpaRepository<Rating,Long> {
    
}
