package com.projectcodingdojo.petjoy_shop.petjoy_shop.Controllers;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.ProductCreate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductSearchController {

    @GetMapping("/buscar-producto")
    public String buscarProductoPorNombre(@RequestParam("nombreProducto") String nombreProducto, Model model) {
        List<Product> listaProductos = ProductCreate.getListaProductos();

        List<Product> productosFiltrados = new ArrayList<>();
        for (Product producto : listaProductos) {
            if (producto.getNombre().toLowerCase().contains(nombreProducto.toLowerCase())) {
                productosFiltrados.add(producto);
            }
        }

        model.addAttribute("listaProductos", productosFiltrados);
        return "products";
    }
}
