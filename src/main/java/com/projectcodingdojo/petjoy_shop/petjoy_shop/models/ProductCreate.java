package com.projectcodingdojo.petjoy_shop.petjoy_shop.models;

import java.util.ArrayList;
import java.util.List;

public class ProductCreate {
    public static List<Product> getListaProductos() {
        List<Product> listaProductos = new ArrayList<>();

        // Agregar productos a la lista
        Product producto1 = new Product();
        producto1.setNombre("Producto 1");
        producto1.setPrecio(10.99);
        producto1.setDescripcion("Descripción del Producto 1 - Lorem ipsum dolor sit amet consectetur. Massa eu aenean malesuada in. Ut est interdum donec pretium ullamcorper metus aliquam mi in. Senectus pellentesque pretium adipiscing sapien augue cursus. Amet nam lorem diam gravida.");
        producto1.setImagen("product1.png");
        producto1.setCategoria("Alimentos");
        producto1.setStock(20);
        producto1.setProveedor("Proveedor A");

        Product producto2 = new Product();
        producto2.setNombre("Producto 2");
        producto2.setPrecio(19.95);
        producto2.setDescripcion("Descripción del Producto 2 - Lorem ipsum dolor sit amet consectetur. Massa eu aenean malesuada in. Ut est interdum donec pretium ullamcorper metus aliquam mi in. Senectus pellentesque pretium adipiscing sapien augue cursus. Amet nam lorem diam gravida.");
        producto2.setImagen("product2.png");
        producto2.setCategoria("Alimentos");
        producto2.setStock(15);
        producto2.setProveedor("Proveedor B");

        Product producto3 = new Product();
        producto3.setNombre("Producto 3");
        producto3.setPrecio(9.45);
        producto3.setDescripcion("Descripción del Producto 3 - Lorem ipsum dolor sit amet consectetur. Massa eu aenean malesuada in. Ut est interdum donec pretium ullamcorper metus aliquam mi in. Senectus pellentesque pretium adipiscing sapien augue cursus. Amet nam lorem diam gravida.");
        producto3.setImagen("product3.png");
        producto3.setCategoria("Juguetes");
        producto3.setStock(15);
        producto3.setProveedor("Proveedor B");

        Product producto4 = new Product();
        producto4.setNombre("Producto 4");
        producto4.setPrecio(30.00);
        producto4.setDescripcion("Descripción del Producto 4 - Lorem ipsum dolor sit amet consectetur. Massa eu aenean malesuada in. Ut est interdum donec pretium ullamcorper metus aliquam mi in. Senectus pellentesque pretium adipiscing sapien augue cursus. Amet nam lorem diam gravida.");
        producto4.setImagen("product4.png");
        producto4.setCategoria("Juguetes");
        producto4.setStock(15);
        producto4.setProveedor("Proveedor B");

        listaProductos.add(producto1);
        listaProductos.add(producto2);
        listaProductos.add(producto3);
        listaProductos.add(producto4);

        return listaProductos;
    }
}
