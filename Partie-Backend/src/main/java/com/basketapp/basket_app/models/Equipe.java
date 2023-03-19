package com.basketapp.basket_app.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Equipe {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private  Long idEquipe;
    private String nom;
    @Lob
    String logo;
    
    @JsonIgnore
    @OneToMany (mappedBy = "equipeAdversaire")
    private List<Match> matches;
}
