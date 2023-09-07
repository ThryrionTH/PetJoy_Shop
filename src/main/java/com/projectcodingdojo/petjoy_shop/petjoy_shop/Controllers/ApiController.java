package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/checkout-save")
    public ResponseEntity<Object> clientCheckoutSave(String nombre) {
        String msg = "";
        System.out.println("GUARDANDO CLIENTE");
        // @RequestBody Clients cliente
        //  System.out.println(cliente);
        msg = "mensaje del controlador" + nombre;
        return new ResponseEntity<Object>(msg, HttpStatus.OK);
    }
}
