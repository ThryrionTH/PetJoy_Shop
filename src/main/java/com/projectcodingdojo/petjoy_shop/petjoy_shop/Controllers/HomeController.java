package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductService;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private ProductService productService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // Mostrar lista de productos 
    @GetMapping("")
    public String home(Model model) {
        addProductList(model);
        return "home";
    }

    @GetMapping("products")
    public String products(Model model) {
        addProductList(model);
        return "products";
    }


    private void addProductList(Model model) {
        List<Product> productsList = productService.findAll();
        model.addAttribute("productsList", productsList);
    }

}
