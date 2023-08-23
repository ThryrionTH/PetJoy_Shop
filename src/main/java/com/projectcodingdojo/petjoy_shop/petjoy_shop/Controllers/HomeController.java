package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.ProductType;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductService;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductTypeService;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductTypeService productTypeService;

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
        List<ProductType> productsTypes = productTypeService.findActive();
        model.addAttribute("productsTypes", productsTypes);
        addProductList(model);
        return "products";
    }


    private void addProductList(Model model) {
        List<Product> productsList = productService.findActive();
        model.addAttribute("productsList", productsList);
    }

}
