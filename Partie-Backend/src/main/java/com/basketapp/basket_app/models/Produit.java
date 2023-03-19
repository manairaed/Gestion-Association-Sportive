package com.basketapp.basket_app.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import com.sun.istack.NotNull;
import org.springframework.lang.Nullable;

import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Produit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProduit;
    private String nomProduit;
    private Float prix ;
    private String description;
    private String couleur;
    private String taille;
    private String genre; 
    private Boolean favoris=false; 
    @Lob
    String image;

    @NotNull
    private Float Moy;

    @ManyToOne
    private Categorie categorie;

    
    @ManyToOne
    private Marque marque;

    @JsonIgnore
    @OneToMany(mappedBy = "produit",cascade = CascadeType.ALL)
    private Set<ProduitPanier> produitPaniers = new HashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "produit",cascade = CascadeType.ALL)
     private Set<Rating> rating = new HashSet<>();

}