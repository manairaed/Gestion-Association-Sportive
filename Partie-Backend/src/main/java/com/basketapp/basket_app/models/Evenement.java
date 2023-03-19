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
public class Evenement {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idEvenement;
	private String titre;
	@Lob
	private String description;

	private Date debut;
	private Date fin ;

}
