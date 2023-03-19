package com.basketapp.basket_app.dao;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.basketapp.basket_app.models.Evenement;
@Repository
public interface EvenementRepos extends JpaRepository<Evenement,Long> {


	
	@Query("select e from Evenement e where e.debut >= ?1 and e.fin <= ?2")
	public List<Evenement> findByDateBetween(LocalDateTime debut , LocalDateTime fin);
}
