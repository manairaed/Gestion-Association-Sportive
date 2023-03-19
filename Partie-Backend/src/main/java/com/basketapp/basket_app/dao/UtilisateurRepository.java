package com.basketapp.basket_app.dao;
import com.basketapp.basket_app.models.Utilisateur;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long> {
    Utilisateur findByUsername (String userName);

    Utilisateur findByEmailUtil(String emailUtil);
    List<Utilisateur> findByRoles(String roles);
}
