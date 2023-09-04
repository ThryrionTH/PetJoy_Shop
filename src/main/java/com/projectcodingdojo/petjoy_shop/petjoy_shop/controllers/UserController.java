package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ClientsService;

@Controller
public class UserController {

    @Autowired ClientsService clientsService;
    @GetMapping("/user")
    public String user(Principal principal){
        String usuario = principal.getName();
        Clients existingClient = clientsService.findByEmail(usuario);
        if(existingClient.getRole().getName().contentEquals("ROLE_ADMIN")){
            return "redirect:/dashboard";
        }
        return "redirect:/";
        
    }
}
