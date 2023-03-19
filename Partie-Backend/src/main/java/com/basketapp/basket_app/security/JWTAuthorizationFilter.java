package com.basketapp.basket_app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

public class JWTAuthorizationFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request,
    HttpServletResponse response, FilterChain filterChain)
    throws ServletException, IOException {
        String jwt =request.getHeader("Authorization");
        // ne passe pas fi jwt est null ou commnece pas par bearer 
        if (jwt==null || !jwt.startsWith("Bearer "))
        {
            filterChain.doFilter(request, response);
            return;
        }
        // verifier le delai de token 
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SecParams.SECRET)).build();
        
        //enlever le préfixe Bearer du jwt
        jwt= jwt.substring(7); // 7 caractères dans "Bearer "
        //decoder le token
        DecodedJWT decodedJWT = verifier.verify(jwt);
        String username = decodedJWT.getSubject();
        List<String> roles = decodedJWT.getClaims().get("roles").asList(String.class);
        Collection <GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();


        //verifier l'acces de chaque role pour acceder a chaque controllers
        for (String r : roles)
        authorities.add(new SimpleGrantedAuthority(r));
        UsernamePasswordAuthenticationToken user = new UsernamePasswordAuthenticationToken(username,null,authorities);
        SecurityContextHolder.getContext().setAuthentication(user);
        filterChain.doFilter(request, response);
    }
}

