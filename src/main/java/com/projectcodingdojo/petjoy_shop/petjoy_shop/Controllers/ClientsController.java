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

<<<<<<< HEAD
    @Value("${role_user}")
    private String USER_ROLE;

    @Autowired
    ClientsService clientsService;
    @Autowired
    RoleService roleService;
    @Autowired
    DetallesSeguridadUsuario securityUserDetails;
=======

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
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d

        String encodePassword = securityUserDetails.bCryptPasswordEncoder().encode(client.getContrasena());
        client.setContrasena(encodePassword);
        clientsService.save(client);

<<<<<<< HEAD
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginClients(@ModelAttribute("client") Clients client, Model model, HttpSession session) {
        String email = client.getEmail();
        Clients authClients = clientsService.findByEmail(email);
        session.setAttribute("client", authClients.getId());
        return "redirect:/";
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

    @GetMapping("/dash/edit")
    public String editClient(Long id, Model model, HttpSession session) {
        Long client_id = (Long) session.getAttribute("client_id");

        if (client_id == null) {
            return "redirect:/login";
        }

        Clients client = clientsService.findById(client_id);
        model.addAttribute("client", client);
        return "dashClient";
    }

    @RequestMapping(value = "/dash/edit", method = RequestMethod.POST)
    public String updateClients(@Valid @ModelAttribute("client") Clients client, HttpSession session,
            BindingResult result) {
        Long client_id = (Long) session.getAttribute("client_id");

        if (result.hasErrors()) {
            System.out.println("error de validación");
            return "dashClient";
        }

        // try {
        // clientsService.update(client);
        // } catch (Exception e) {
        // // Manejar la excepción, imprimir mensajes de error o redirigir a una página
        // de error.
        // System.out.println(e);
        // // Puedes crear una página de error personalizada.
        // }
        Clients existingClients = clientsService.findById(client_id);
        if (existingClients == null) {
            return "redirect:/dashClient";
        }

        existingClients.setNombre(client.getNombre());
        existingClients.setApellido(client.getApellido());
        existingClients.setCelular(client.getCelular());
        existingClients.setCiudad(client.getCiudad());
        existingClients.setDepartamento(client.getDepartamento());
        existingClients.setDireccion(client.getDireccion());
        existingClients.setEmail(client.getEmail());
        existingClients.setContrasena(client.getContrasena());

        clientsService.save(existingClients);
        return "redirect:/logout";
    }

    @RequestMapping("/checkout")
    public String clientCheckout(HttpSession session, Model model) {

        if (session.getAttribute("cliente") == null) {
            return "redirect:/login";
        }
        Clients client = (Clients) session.getAttribute("cliente");
        model.addAttribute("client", client);
        return "checkout_cart";
    }

    /*
     * @RequestMapping("/checkout")
     * public String clientCheckout(HttpSession session, Model model) {
     * Long clientId = (Long) session.getAttribute("client_id");
     * if (clientId == null) {
     * return "redirect:/login";
     * }
     * 
     * Clients client = clientsService.findById(clientId);
     * model.addAttribute("client", client);
     * return "checkout";
     * }
     */
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

        Role role = roleService.findByNameContaining(USER_ROLE);
        client.setRole(role);

        String encodePassword = securityUserDetails.bCryptPasswordEncoder().encode(client.getContrasena());
        client.setContrasena(encodePassword);
        clientsService.save(client);

        session.setAttribute("client_name", newClient.getNombre());
        session.setAttribute("client_apellido", newClient.getApellido());
        session.setAttribute("client_id", newClient.getId());

        session.setAttribute("cliente", client);

        return "redirect:/";
    }

}
=======
        return "redirect:/";
    }

}
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
