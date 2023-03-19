package com.basketapp.basket_app.models;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Panier {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
     private  Long idPanier;
     private Float  subTotal;
     private Float  tax;
     private Float  Total;

     @OneToMany(mappedBy = "panier",cascade = CascadeType.ALL)
     private Set<ProduitPanier> produitPaniers = new HashSet<>();

     @OneToOne ()
     private Utilisateur user;
}
