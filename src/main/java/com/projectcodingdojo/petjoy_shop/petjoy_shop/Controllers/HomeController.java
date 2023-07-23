package com.projectcodingdojo.petjoy_shop.petjoy_shop.Controllers;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.ProductCreate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    
    private List<Product> listaProductos;
    private void addListaProductos(Model model) {
        if (listaProductos == null) {
            listaProductos = ProductCreate.getListaProductos();
        }
        model.addAttribute("listaProductos", listaProductos);
    }

    @GetMapping("/")
    public String inicio(Model model) {
        addListaProductos(model);
        return "index";
    }

    @GetMapping("/products")
    public String productos(Model model) {
        addListaProductos(model);
        return "products";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        addListaProductos(model);
        return "dashboard";
    }

    @GetMapping("/dashboardAdd")
    public String dashboardAdd() {
        return "dashboardAdd";
    }
    
    // private List<Product> listaProductos;
    
    // @GetMapping("/")
    // public String inicio(Model model) {
    //     listaProductos = ProductCreate.getListaProductos();
    //     model.addAttribute("listaProductos", listaProductos);
    //     return "index";
    // }

    // @GetMapping("/products")
    // public String productos(Model model) {
    //     listaProductos = ProductCreate.getListaProductos();
    //     model.addAttribute("listaProductos", listaProductos);
    //     return "products";
    // }

    // @GetMapping("/login")
    // public String login() {
    //     return "login";
    // }

    // @GetMapping("/dashboard")
    // public String dashboard(Model model) {
    //     listaProductos = ProductCreate.getListaProductos();
    //     model.addAttribute("listaProductos", listaProductos);
    //     return "dashboard";
    // }

}
