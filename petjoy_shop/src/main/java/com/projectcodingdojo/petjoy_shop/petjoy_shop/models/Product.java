package com.projectcodingdojo.petjoy_shop.petjoy_shop.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor

public class Product {
    private String nombre;
    private double precio;
    private String descripcion;
    private String imagen;
    private String categoria;
    private int stock;
    private String proveedor;
}
