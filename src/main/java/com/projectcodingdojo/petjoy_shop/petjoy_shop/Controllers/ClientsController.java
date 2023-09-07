package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Role;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.security.DetallesSeguridadUsuario;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ClientsService;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.RoleService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ClientsController {


    @Value("${role_user}")
    private String USER_ROLE; 


    @Autowired ClientsService clientsService;
    @Autowired RoleService roleService;
    @Autowired DetallesSeguridadUsuario securityUserDetails;

     @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        return "redirect:/";
    }
    
    @GetMapping("/signup")
    public String registerForm(@ModelAttribute("client") Clients client) {
        return "signup";
    }

    @RequestMapping("/checkout")
    public String clientCheckout(HttpSession session, Model model) {
        Long clientId = (Long) session.getAttribute("client_id");
        if (clientId == null) {
            return "redirect:/login1";
        }

        Clients client = clientsService.findById(clientId);
        model.addAttribute("client", client);
        return "checkout";
    }
    
    @PostMapping("/signup")
    public String registerClients(
            @Valid @ModelAttribute("client") Clients client, BindingResult result, HttpSession session,
            RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "signup";
        }

        Clients existingClient = clientsService.findByEmail(client.getEmail());
        if (existingClient != null) {
            result.rejectValue("email", "error.client", "El email ya se encuentra en uso");
            return "signup";
        }

        if (!client.getContrasena().equals(client.getConfirmarContrasena())) {
            result.rejectValue("confirmarContrasena", "error.client", "Las contraseñas no son iguales");
            return "signup";
        }
  
        Clients newClient = clientsService.save(client);

        session.setAttribute("client_name", newClient.getNombre());
        session.setAttribute("client_apellido", newClient.getApellido());
        session.setAttribute("client_id", newClient.getId());

        Role role = roleService.findByNameContaining(USER_ROLE);
        client.setRole(role);

        String encodePassword = securityUserDetails.bCryptPasswordEncoder().encode(client.getContrasena());
        client.setContrasena(encodePassword);
        clientsService.save(client);

        return "redirect:/";
    }

}
