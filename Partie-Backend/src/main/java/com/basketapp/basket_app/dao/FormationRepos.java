package com.basketapp.basket_app.dao;

import java.util.List;

import com.basketapp.basket_app.models.Formation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FormationRepos extends JpaRepository<Formation,Long> {
 
    @Query("select f from Formation f where f.type=?1"  )
    List<Formation> findAllByType(String type) ;
}
