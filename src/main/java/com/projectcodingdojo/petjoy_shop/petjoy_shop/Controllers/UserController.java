package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ClientsService;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    @Value("${role_admin}")
    private String ROLE_ADMIN;
    @Autowired
    ClientsService clientsService;

    @Autowired
    private HttpSession session;

    @GetMapping("/user")
    public String user(Principal principal) {
        String usuario = principal.getName();
        Clients existingClient = clientsService.findByEmail(usuario);

        if (existingClient.getRole().getName().contentEquals(ROLE_ADMIN)) {
            return "redirect:/dashboard";
        }

        if (existingClient != null) {
            session.setAttribute("cliente", existingClient);
        } else {
            session.setAttribute("cliente", null);
        }

        return "redirect:/";

    }
}
