package com.projectcodingdojo.petjoy_shop.petjoy_shop.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "facturas")
public class Factura {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private int codigo;

    @NotNull
    @Size(max = 20, message = "La descripción maximo debe tener 20 caracteres")
    private String descripcion;

    @NotNull
    @NotBlank(message = "El dirección de envio no debe estar vacio")
    @Size(max = 60, message = "La dirección de envio maximo debe tener 60 caracteres")
    private String direccion_envio;

    @NotNull
    private int total;

    @Past
    private Date fecha;
    
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    public Factura() {}

    public Factura(int codigo, String descripcion, String direccion_envio, int total, Date fecha)  {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.direccion_envio = direccion_envio; 
        this.total = total;
        this.fecha = fecha;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

}
