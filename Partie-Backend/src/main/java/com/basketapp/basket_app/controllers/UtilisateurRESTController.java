package com.basketapp.basket_app.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import com.basketapp.basket_app.dao.UtilisateurRepository;
import com.basketapp.basket_app.dto.UtilisateurDto;
import com.basketapp.basket_app.models.Role;
import com.basketapp.basket_app.models.Utilisateur;
import com.basketapp.basket_app.services.UtilisateurService;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController

@RequestMapping("/user")
@CrossOrigin
public class UtilisateurRESTController {

	@Autowired
	UtilisateurService utilisateurService;

	@Autowired
	UtilisateurRepository utilisateurRepository;
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	JavaMailSender javaMailSender;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	public String Code;

	// find user by roles
	@RequestMapping(path = "/findCoach", method = RequestMethod.GET)
	public List<Utilisateur> finduserbyroles() {
		List<Utilisateur> list = new ArrayList<>();
		List<Utilisateur> listCoach = new ArrayList<>();
		list = utilisateurRepository.findAll();
		for (Utilisateur user : list) {
			List<Role> roles = user.getRoles();
			System.out.println(roles.get(0).getRole());
			if (roles.get(0).getRole().toString().equals("Coach")) {
				listCoach.add(user);
			}
		}
		return listCoach;
	}

	@RequestMapping(path = "/findjoueur", method = RequestMethod.GET)
	public List<Utilisateur> finduserbyroles1() {
		List<Utilisateur> list = new ArrayList<>();
		List<Utilisateur> listCoach = new ArrayList<>();
		list = utilisateurRepository.findAll();
		for (Utilisateur user : list) {
			List<Role> roles = user.getRoles();
			System.out.println(roles.get(0).getRole());
			if (roles.get(0).getRole().toString().equals("Joueur")) {
				listCoach.add(user);
			}
		}
		return listCoach;
	}

	// Get all utilisatuer Dto
	@RequestMapping(path = "all", method = RequestMethod.GET)
	public List<UtilisateurDto> getAllUtilisateursDto() {
		return utilisateurService.getAllUtilisateurs().stream()
				.map(utilisateur -> modelMapper.map(utilisateur, UtilisateurDto.class))
				.collect(Collectors.toList());
	}

	// Get all utilisateur
	@RequestMapping(path = "allusers", method = RequestMethod.GET)
	public List<Utilisateur> getAllUtilisateurs() {
		return utilisateurService.getAllUtilisateurs();
	}

	// get user by id
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<UtilisateurDto> getUtilisateurById(@PathVariable("id") Long id) {
		Utilisateur utilisateur = utilisateurService.getUtilisateur(id);

		// convert entity to DTO
		UtilisateurDto utilisateurResponse = modelMapper.map(utilisateur, UtilisateurDto.class);
		return ResponseEntity.ok().body(utilisateurResponse);
	}

	// get user by username
	@RequestMapping(value = "/nom/{username}", method = RequestMethod.GET)
	public Utilisateur getUtilisateurByUsername(@PathVariable("username") String nom) {
		return utilisateurService.findUserByUsername(nom);
	}

	// get user by role
	@RequestMapping(value = "/role/{idRole}", method = RequestMethod.GET)
	public List<Utilisateur> rechercheUtilisateurByRole(@PathVariable("idRole") Long id) {
		return utilisateurService.rechercheUtilisateurByRole(id);
	}

	@RequestMapping(path = "/verifieemail/{id}", method = RequestMethod.GET)
	public Utilisateur updateUtilisateurEmail(@PathVariable("id") String id) {

		Utilisateur users = utilisateurRepository.findByUsername(id);

		users.setEnabled(true);

		return utilisateurRepository.save(users);

	}

	@RequestMapping(path = "/SendMail/{id}", method = RequestMethod.GET)
	public String ForgetPasword(@PathVariable("id") String email) {
		Random random = new Random();

		int y = random.nextInt(10000);
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("fsegiset@gmail.com");
		message.setTo(email);
		message.setSubject(" Forget Password ");
		message.setText("Bonjour " + email + "   Salut  :    Click sur cette Lien pour rest votre password  "
				+ "http://localhost:4200/validpassword/" + email);

		javaMailSender.send(message);
		return String.valueOf(y);

	}

	public void SendEmail(String email, String username) {

		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom("fsegiset@gmail.com");
		message.setTo(email);
		message.setSubject(" Verifié Email  ");
		message.setText("Bonjour " + username + "   Salut  :   Votre Code de verfication " + Code
				+ " Click sur cette Lien pour verifié ton email " + "http://localhost:4200/validemail/" + username);

		javaMailSender.send(message);

	}

	// create user
	@RequestMapping(path = "createUtilisateur", method = RequestMethod.POST)
	public String createUtilisateur(@RequestBody Utilisateur utilisateur, Role role, UtilisateurDto utilisateurDto) {

		Utilisateur users = utilisateurRepository.findByEmailUtil(utilisateur.getEmailUtil());
		if (users == null) {
			Random random = new Random();
			int y = random.nextInt(10000);
			Code = String.valueOf(y);
			SendEmail(utilisateur.getEmailUtil(), utilisateur.getUsername());
			Utilisateur u = utilisateurService.saveUtilisateur(utilisateur);
			utilisateurService.saveUtilisateurDto(utilisateur, utilisateurDto);

			utilisateurService.addRoleToUtilisateur(u.getUsername(), role.getRole());

		}

		return Code;
	}

	@RequestMapping(path = "/updatepassword/{id}", method = RequestMethod.PUT)
	public Utilisateur updateUtilisateurPassword(@RequestBody String password, @PathVariable("id") String email) {

		Utilisateur users = utilisateurRepository.findByEmailUtil(email);

		users.setPassword(bCryptPasswordEncoder.encode(password));

		return utilisateurRepository.save(users);

	}

	// update user
	@RequestMapping(path = "/edit", method = RequestMethod.PUT)
	public Utilisateur updateUtilisateure(@RequestBody Utilisateur user) {
		Utilisateur users = utilisateurRepository.findById(user.getIdUtil()).orElse(null);
		users.setUsername(user.getUsername());
		users.setNomUtil(user.getNomUtil());
		users.setPrenomUtil(user.getPrenomUtil());
		users.setEmailUtil(user.getEmailUtil());
		users.setNumTelUtil(user.getNumTelUtil());
		users.setRoles(user.getRoles());

		users.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		return utilisateurRepository.save(users);
	}

	@RequestMapping(path = "/edituser/{id}", method = RequestMethod.PUT)
	public Utilisateur updateUtilisateur(@RequestBody Utilisateur user, @PathVariable("id") Long id) {

		Utilisateur users = utilisateurRepository.findById(id).orElse(null);
		users.setImage(user.getImage());
		users.setNomUtil(user.getNomUtil());
		users.setPrenomUtil(user.getPrenomUtil());
		users.setEmailUtil(user.getEmailUtil());
		users.setNumTelUtil(user.getNumTelUtil());

		return utilisateurRepository.save(users);

	}

	// get user by id
	@RequestMapping(path = "delete/{id}", method = RequestMethod.DELETE)
	public void deleteUtilisateur(@PathVariable("id") Long id) {
		utilisateurService.deleteUtilisateurById(id);
	}

}
