package com.basketapp.basket_app.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Match /* extends Evenement*/{
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long idMatch;
    private String type;
    
    @ManyToOne
    private Ligue ligue;
 
    @ManyToOne
    private Equipe equipeAdversaire;



    @ManyToOne
    private Utilisateur coach;

    @ManyToOne
    private Stade stade;
}
