package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ClientsService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ClientsController {
    private final ClientsService clientsService;

    public ClientsController(ClientsService clientsService) {
        this.clientsService = clientsService;
    }

    @GetMapping("/signup")
    public String registerForm(@ModelAttribute("client") Clients client) {
        return "signup";
    }

    @PostMapping("/signup")
    public String registerClients(
            @Valid @ModelAttribute("client") Clients client, BindingResult result, HttpSession session,
            RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "signup";
        }

        Clients existingClient = clientsService.findClientByEmail(client.getEmail());
        if (existingClient != null) {
            result.rejectValue("email", "error.client", "El email ya se encuentra en uso");
            return "signup";
        }

        if (!client.getContrasena().equals(client.getConfirmarContrasena())) {
            result.rejectValue("confirmarContrasena", "error.client", "Las contraseñas no son iguales");
            return "signup";
        }

        Clients newClient = clientsService.createClient(client);

        session.setAttribute("client_id", newClient.getId());

        return "redirect:/checkout";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("client", new Clients());
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginClients(@ModelAttribute("client") Clients client, Model model, HttpSession session) {
        String email = client.getEmail();
        String contrasena = client.getContrasena();
        if (!clientsService.authenticateClient(email, contrasena)) {
            model.addAttribute("error", "Credenciales invalidas");
            return "login";
        }

        Clients authClients = clientsService.findClientByEmail(email);

        session.setAttribute("client_id", authClients.getId());
        return "redirect:/checkout";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("client_id");
        return "redirect:/";
    }

    @RequestMapping("/checkout")
    public String clientCheckout(HttpSession session, Model model) {
        Long clientId = (Long) session.getAttribute("client_id");
        if (clientId == null) {
            return "redirect:/login";
        }

        Clients client = clientsService.findClientById(clientId);
        model.addAttribute("client", client);
        return "checkout";
    }

}
