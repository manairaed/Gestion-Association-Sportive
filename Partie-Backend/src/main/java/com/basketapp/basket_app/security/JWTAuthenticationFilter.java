package com.basketapp.basket_app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.basketapp.basket_app.models.Utilisateur;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter{
	
	private AuthenticationManager authenticationManager;
	// Constructors
	public JWTAuthenticationFilter(AuthenticationManager authenticationManager) {
		super();

		this.authenticationManager = authenticationManager;
	}
	// info besh te5edhhom mn and l utilisateur : request 
	// resultat récu = response 
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		
		Utilisateur user = null;
			
			try {
				// 9rina donnee mn and utilisateur 
				user = new ObjectMapper().readValue(request.getInputStream(), Utilisateur.class);
			} catch (JsonParseException e) {
					e.printStackTrace();
			} catch (JsonMappingException e) {
					e.printStackTrace();
			} catch (IOException e) {
					e.printStackTrace();
			}
		
			return authenticationManager.
			//verififcation du base de donnee 
			  authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));	
	}
	// si succesfull 
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, 
			                                FilterChain chain,	Authentication authResult) 
			                                throws IOException, ServletException {
		
		org.springframework.security.core.userdetails.User springUser =  
		 (org.springframework.security.core.userdetails.User)		authResult.getPrincipal();
		// list des roles ili amal login 
		List<String> roles = new ArrayList<>();
		
		springUser.getAuthorities().forEach(au -> {
			roles.add(au.getAuthority());
		});
		// generation du token 
		String jwt = JWT.create().
				withSubject(springUser.getUsername()).
				withArrayClaim("roles", roles.toArray(new String[roles.size()])).
				withExpiresAt(new Date(System.currentTimeMillis()+SecParams.EXP_TIME)).
				sign(Algorithm.HMAC256(SecParams.SECRET));
		// add autorisation fl header postmane fih token
		response.addHeader("Authorization", jwt);
		// afficher token fil body postmane
		String json = new ObjectMapper().writeValueAsString(jwt);
        response.getWriter().write(json);
        response.flushBuffer();
	}

}