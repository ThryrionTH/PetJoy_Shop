package com.projectcodingdojo.petjoy_shop.petjoy_shop.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.ClientsRepository;

<<<<<<< HEAD
import jakarta.servlet.http.HttpSession;

@Configuration
@Service
public class DetallesSeguridadUsuario implements UserDetailsService {
    @Autowired
    ClientsRepository clientsRepository;
    @Autowired
    private HttpSession httpSession;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
=======
@Configuration
@Service
public class DetallesSeguridadUsuario implements UserDetailsService {
    @Autowired ClientsRepository clientsRepository;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
        return new BCryptPasswordEncoder();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Clients clients = clientsRepository.findByEmail(username);
<<<<<<< HEAD
        if (clients == null) {
            throw new UsernameNotFoundException("User not found");
        }

        org.springframework.security.core.userdetails.User userDetail = new org.springframework.security.core.userdetails.User(
                clients.getEmail(),
                clients.getContrasena(),
                getAuthorities(clients));
        httpSession.setAttribute("nombreUsuario", clients.getNombre());
        httpSession.setAttribute("apellidoUsuario", clients.getApellido());

        return userDetail;
    }

    private List<GrantedAuthority> getAuthorities(Clients clients) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(clients.getRole().getName());
        authorities.add(grantedAuthority);

=======
        if(clients == null) {
            throw new UsernameNotFoundException("User not found");
        }
        
        org.springframework.security.core.userdetails.User userDetail = new org.springframework.security.core.userdetails.User(
            clients.getEmail(), 
            clients.getContrasena(), 
            getAuthorities(clients)
        );
        return userDetail;
    }
     private List<GrantedAuthority> getAuthorities(Clients clients){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
       
        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(clients.getRole().getName());
        authorities.add(grantedAuthority);
      
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
        return authorities;
    }
}
