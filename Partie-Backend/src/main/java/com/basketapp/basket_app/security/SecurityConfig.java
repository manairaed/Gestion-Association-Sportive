package com.basketapp.basket_app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;


@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	UserDetailsService userDetailsService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;


	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
	}


	@Bean
	CorsConfigurationSource corsConfigurationSource() {
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.setAllowedOrigins(Arrays.asList("*"));
		configuration.setAllowCredentials(true);
		configuration.setAllowedHeaders(Arrays.asList("Access-Control-Allow-Headers", "Access-Control-Allow-Origin", "Access-Control-Request-Method", "Access-Control-Request-Headers", "Origin", "Cache-Control", "Content-Type", "Authorization"));
		configuration.setAllowedMethods(Arrays.asList("DELETE", "GET", "POST", "PATCH", "PUT"));
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		return source;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().cors();
		//http.cors();
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

		//login
		http.authorizeRequests().antMatchers("/login").permitAll();
		http.authorizeRequests().antMatchers("/Equipe/**").permitAll();
		http.authorizeRequests().antMatchers("/ligue/**").permitAll();
		http.authorizeRequests().antMatchers("/match/**").permitAll();
		http.authorizeRequests().antMatchers("/user/**").permitAll();
		http.authorizeRequests().antMatchers("/actualite/**").permitAll();
		http.authorizeRequests().antMatchers("/comment/**").permitAll();
		http.authorizeRequests().antMatchers("/Satdee/**").permitAll();
		http.authorizeRequests().antMatchers("/categorie/**").permitAll();
		http.authorizeRequests().antMatchers("/marque/**").permitAll();
		http.authorizeRequests().antMatchers("/Produit/**").permitAll();
		http.authorizeRequests().antMatchers("/systemejeux/**").permitAll();
		http.authorizeRequests().antMatchers("/evenement/**").permitAll();
		http.authorizeRequests().antMatchers("/exercice/**").permitAll();
		http.authorizeRequests().antMatchers("/formation/**").permitAll();





		//afficher tous les utilisateur
		http.authorizeRequests().antMatchers("/all").hasAuthority("ADMIN");

		//afficher utilisateur par son id
		http.authorizeRequests().antMatchers(HttpMethod.GET,"/user/**").hasAnyAuthority("ADMIN");

		//ajouter un nouveau utilisateur
		http.authorizeRequests().antMatchers(HttpMethod.POST,"/user/**").hasAuthority("ADMIN");

		//modifier utilisateur
		http.authorizeRequests().antMatchers(HttpMethod.PUT,"/user/**").hasAuthority("ADMIN");

		//supprimer utilisateur
		http.authorizeRequests().antMatchers(HttpMethod.DELETE,"/user/**").hasAuthority("ADMIN");

		http.authorizeRequests().anyRequest().authenticated();
		http.addFilter(new JWTAuthenticationFilter (authenticationManager()));
		http.addFilter(new JWTAuthenticationFilter (authenticationManager())) ;
		http.addFilterBefore(new JWTAuthorizationFilter(),UsernamePasswordAuthenticationFilter.class);
	}
}