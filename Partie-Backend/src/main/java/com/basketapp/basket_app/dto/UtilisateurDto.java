package com.basketapp.basket_app.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class UtilisateurDto {
    @Id
    private Long idUtil;
    private String nomUtil;
	private String prenomUtil;
}
