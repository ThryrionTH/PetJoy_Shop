package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.ProductAnimal;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.ProductBrand;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.ProductType;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductAnimalService;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductBrandService;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductService;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.ProductTypeService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/dashboard")
public class ProductController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private ProductBrandService productBrandService;

    @Autowired
    private ProductAnimalService productAnimalService;

    @Autowired
    private ProductTypeService productTypeService;

    // Mostrar lista de productos 
    @GetMapping("")
    public String showDashboard(Model model) {
        List<Product> products = productService.findActive();
        model.addAttribute("products", products);
        return "dashProducts";
    }

    // Mostrar formulario de creación 
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("product", new Product());
        
        // Obtener la lista de marcas de productos y agregarla al modelo
        List<ProductBrand> productsBrands = productBrandService.findActive();
        model.addAttribute("productsBrands", productsBrands);

        // Obtener la lista de animales  y agregarla al modelo
        List<ProductAnimal> productsAnimals = productAnimalService.findActive();
        model.addAttribute("productsAnimals", productsAnimals);

        // Obtener la lista de categorias de producto y agregarla al modelo
        List<ProductType> productsTypes = productTypeService.findActive();
        model.addAttribute("productsTypes", productsTypes);
        
        return "dashAddProduct";
    }

    // Guardar el nuevo producto desde el formulario de creación
    @PostMapping("/add")
    public String saveProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "dashAddProduct";
        }
        productService.save(product);
        return "redirect:/dashboard";
    }

    // Eliminar un producto
    @DeleteMapping("/{id}/delete")
    public String deleteProduct(@PathVariable("id") Long id) {
        Product product = productService.findById(id);
        if (product != null) {
            product.setActive(0);
            productService.update(product);
        }
        return "redirect:/dashboard";
    }
}
