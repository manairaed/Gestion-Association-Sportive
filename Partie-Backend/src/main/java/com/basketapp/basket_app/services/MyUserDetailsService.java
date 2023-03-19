package com.basketapp.basket_app.services;

import java.util.ArrayList;
import java.util.List;

import com.basketapp.basket_app.models.Utilisateur;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;



@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	UtilisateurService utilisateurService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Utilisateur utilisateur = utilisateurService.findUserByUsername(username);
		if (utilisateur==null)
			throw new UsernameNotFoundException("Utilisateur introuvable!");
		
		List<GrantedAuthority> auths = new ArrayList<>();
		
		utilisateur.getRoles().forEach(role -> {
			GrantedAuthority authority = new SimpleGrantedAuthority(role.getRole());
			auths.add(authority);
		});
		
		return new org.springframework.security.core.
		  userdetails.User(utilisateur.getUsername(), utilisateur.getPassword(), auths);
	
	}

}