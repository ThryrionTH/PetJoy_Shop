package com.projectcodingdojo.petjoy_shop.petjoy_shop.Controllers;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.Models.Products;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.Models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.Models.ProductCreate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
public class HomeController {
    private final int MAYOR_EDAD_DIAS = 6570;
    private List<Products> listaProductos;
    private void addListaProductos(Model model) {
        if (listaProductos == null) {
            listaProductos = ProductCreate.getListaProductos();
        }
        model.addAttribute("listaProductos", listaProductos);
    }

    @GetMapping("/")
    public String inicio(Model model) {
        addListaProductos(model);
        
        LocalDate date = LocalDate.now().minusDays(MAYOR_EDAD_DIAS);
        return "home";
    }

    @GetMapping("/products")
    public String productos(Model model) {
        addListaProductos(model);
        return "products";
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

    @GetMapping("/verification")
    public String verificationClient() {
        
        return "verification";
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

    // @GetMapping("/dashboard")
    // public String dashboard(Model model) {
    //     listaProductos = ProductCreate.getListaProductos();
    //     model.addAttribute("listaProductos", listaProductos);
    //     return "dashboard";
    // }

}
