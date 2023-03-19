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
public class Galerie {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private  Long idGalerie;
    private String titre;
    @Lob
    byte[] image1;
    @Lob
    byte[] image2;
    @Lob
    byte[] image3;
    @Lob
    byte[] image4;
    @Lob
    byte[] image5;
}
