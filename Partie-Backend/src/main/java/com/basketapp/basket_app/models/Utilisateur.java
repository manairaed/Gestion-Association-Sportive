package com.basketapp.basket_app.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor
@Entity
public class Utilisateur {
    @Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    private Long idUtil;

    @Lob
    String image;

    @Column(unique=true)
    private String username;
    private String password;
    private Boolean enabled;
    private String nomUtil;
	private String prenomUtil;
	private String numTelUtil;
	private String emailUtil;

    @ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name="utilisateur_role",joinColumns = @JoinColumn(name="idUtil") ,
    inverseJoinColumns = @JoinColumn(name="idRole"))
	private List<Role> roles;
}
