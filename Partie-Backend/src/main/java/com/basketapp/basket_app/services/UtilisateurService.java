package com.basketapp.basket_app.services;

import java.util.List;

import com.basketapp.basket_app.dto.UtilisateurDto;
import com.basketapp.basket_app.models.Role;
import com.basketapp.basket_app.models.Utilisateur;

public interface UtilisateurService {
	Utilisateur saveUtilisateur (Utilisateur utilisateur);
	Utilisateur updateUtilisateur (Utilisateur u);
	void deleteUtilisateur (Utilisateur u);
	void deleteUtilisateurById (Long id);
	Utilisateur addRoleToUtilisateur(String username, String rolename);
	List <Utilisateur> getAllUtilisateurs();
	Utilisateur getUtilisateur (Long id);
	Utilisateur findUserByUsername (String username);
	public Role addRole(Role role);
	List <Utilisateur> rechercheUtilisateurByRole (Long id);
	UtilisateurDto saveUtilisateurDto (Utilisateur utilisateur,UtilisateurDto utilisateurDto);
}
