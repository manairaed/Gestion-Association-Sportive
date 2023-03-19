package com.basketapp.basket_app.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Stade {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
     private Long idStade;
     private String nom;
     private String adresse;
     private String numeroTel;
     private String email;
}


