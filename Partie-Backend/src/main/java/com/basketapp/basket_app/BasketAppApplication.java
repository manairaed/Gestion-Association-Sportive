package com.basketapp.basket_app;


import javax.annotation.PostConstruct;

import com.basketapp.basket_app.models.Role;
import com.basketapp.basket_app.models.Utilisateur;
import com.basketapp.basket_app.services.UtilisateurService;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@SuppressWarnings("unused")
@SpringBootApplication
public class BasketAppApplication implements CommandLineRunner{
	
	@Autowired
	UtilisateurService utilisateurService; 

	@Autowired
	private RepositoryRestConfiguration repositoryRestConfiguration;

	public static void main(String[] args) {
		SpringApplication.run(BasketAppApplication.class, args);
	}

	/*@PostConstruct
	void init_users() {
		//ajouter les rôles
		utilisateurService.addRole(new Role(null,"ADMIN"));
		utilisateurService.addRole(new Role(null,"USER"));
		//ajouter les users
		utilisateurService.saveUtilisateur(new Utilisateur(null,"admin","123",true,null));
		utilisateurService.saveUtilisateur(new Utilisateur(null,"test","1234",true,null));
		utilisateurService.saveUtilisateur(new Utilisateur(null,"foulen","12345",true,null));
		//ajouter les rôles aux users
		utilisateurService.addRoleToUtilisateur("admin", "ADMIN");
		utilisateurService.addRoleToUtilisateur("admin", "USER");
		utilisateurService.addRoleToUtilisateur("raed", "USER");
		utilisateurService.addRoleToUtilisateur("foulen", "USER");
	}*/

	@Override
	public void run(String... args) throws Exception {	
		repositoryRestConfiguration.exposeIdsFor(Utilisateur.class);
	}
	

	@Bean
	BCryptPasswordEncoder getBCE() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public ModelMapper modelMapper() {
		return new ModelMapper();
	}

}
