package com.basketapp.basket_app.services.implementations;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import com.basketapp.basket_app.dao.RoleRepository;
import com.basketapp.basket_app.dao.UtilisateurDtoRepository;
import com.basketapp.basket_app.dao.UtilisateurRepository;
import com.basketapp.basket_app.dto.UtilisateurDto;
import com.basketapp.basket_app.models.Role;
import com.basketapp.basket_app.models.Utilisateur;
import com.basketapp.basket_app.services.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Transactional
@Service
public class UtilisateurServiceImpl implements UtilisateurService{

	@Autowired
	UtilisateurRepository utilisateurRepository;
	
	@Autowired
    RoleRepository roleRep;

	@Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	UtilisateurDtoRepository UtilisateurDtoRepository;

	//Ajouter role à l'utilisateur
	@Override
    public Utilisateur addRoleToUtilisateur(String username, String rolename) {
        Utilisateur usr = utilisateurRepository.findByUsername(username);
        Role r = roleRep.findByRole(rolename);
        usr.getRoles().add(r);
        return usr;
    }

	//Enregistrer Utilisateur
	@Override
	public Utilisateur saveUtilisateur(Utilisateur utilisateur) {
		utilisateur.setPassword(bCryptPasswordEncoder.encode(utilisateur.getPassword()));
        return utilisateurRepository.save(utilisateur);
	}

	//Enregistrer UtilisateurDto
	public UtilisateurDto saveUtilisateurDto (Utilisateur utilisateur,UtilisateurDto utilisateurDto) {
		String nom = utilisateur.getNomUtil();
		String prenom = utilisateur.getPrenomUtil();
		utilisateurDto.setIdUtil(utilisateur.getIdUtil());
		utilisateurDto.setNomUtil(nom);
		utilisateurDto.setPrenomUtil(prenom);
		return UtilisateurDtoRepository.save(utilisateurDto);
	}
    
	//Modifier Utilisateur
	@Override
	public Utilisateur updateUtilisateur(Utilisateur utilisateur) {
		utilisateur.setPassword(bCryptPasswordEncoder.encode(utilisateur.getPassword()));
		return utilisateurRepository.save(utilisateur);
	}

	//Supprimer tous les Utilisateur
	@Override
	public void deleteUtilisateur(Utilisateur u) {
		utilisateurRepository.delete(u);
		
	}

	//Supprimer Utilisateur par Id
	@Override
	public void deleteUtilisateurById(Long id) {
		utilisateurRepository.deleteById(id);
		
	}

	//Afficher utilisateur par Id
	@Override
	public Utilisateur getUtilisateur(Long id) {
		return utilisateurRepository.findById(id).get();
	}
    
	//Afficher tous les utilisateurs
	@Override
	public List<Utilisateur> getAllUtilisateurs() {
		return utilisateurRepository.findAll();
	}
    
    //Afficher l'utilisateur par son username
	@Override
    public Utilisateur findUserByUsername(String username) {
        return utilisateurRepository.findByUsername(username);
    }
	
	//Ajouter un role
	@Override
    public Role addRole(Role role) {
        return roleRep.save(role);
    }

	//Afficher utilisateur par son role
	@Override
	public List<Utilisateur> rechercheUtilisateurByRole(Long id) {
		List <Utilisateur> utilisateurs = utilisateurRepository.findAll();
		List <Utilisateur> fl = new ArrayList<>();
		for (Utilisateur utilisateur:utilisateurs){
			for (Role r:utilisateur.getRoles()){
				if (r.getIdRole()==id){
					fl.add(utilisateur);
				}
			}
		}
		return fl;
	}
}
