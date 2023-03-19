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
public class Document {
	
	 @Id
	 @GeneratedValue (strategy = GenerationType.IDENTITY)
	 private  Long idDocument;
	 private String titre;
	 
	 @Lob
     byte[] contenu;  
}
