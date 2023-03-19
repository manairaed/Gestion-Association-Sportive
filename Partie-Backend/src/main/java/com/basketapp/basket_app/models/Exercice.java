package com.basketapp.basket_app.models;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Exercice {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
     private  Long idExercice;
     private String nom;
     private String Description;
     private String Type;
     @Lob
     private String image;
}


