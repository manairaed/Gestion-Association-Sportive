package com.basketapp.basket_app.models;

import java.util.Date;

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
public class SystemeJeux {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idSystemeJeux;
    private String nom;
    private String Auteur;
    private String description;
    private Date dateCreation;
    private Boolean favoris=false; 
    private Boolean attaquePlace=true;
    
    @Lob
    byte[] image;
}