package com.projectcodingdojo.petjoy_shop.petjoy_shop.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="productos")

@Getter @Setter @NoArgsConstructor

public class Product extends BaseModel{   

    @NotNull
    @NotBlank
    @Size(min = 1, max = 50)
    @Column(name = "nombre")
    private String nombre;

    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "codigo")
    private String codigo;

    @Column(name = "imagen")
    private String imagen;

    @NotNull
    @Min(value = 0, message = "El precio debe ser mayor o igual a 0")
    @Column(name = "precio")
    private double precio;

    @NotNull
    @NotBlank
    @Size(min = 1, max = 200)
    @Column(name = "descripcion")
    private String descripcion;

    @NotNull
    @Min(value = 0, message = "El stock debe ser mayor o igual a 0")
    @Column(name = "stock")
    private int stock;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "fecha_vencimiento")
    private Date fechaVencimiento;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "fecha_elaboracion")
    private Date fechaElaboracion;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "marca_producto_id")
    private ProductBrand marca_producto;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "producto_animal_id")
    private ProductAnimal producto_animal;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tipo_producto_id")
    private ProductType tipo_producto;

}
    
