package com.projectcodingdojo.petjoy_shop.petjoy_shop.models;

import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table (name = "tipo_productos")

@Getter @Setter @NoArgsConstructor

public class ProductType extends BaseModel {
    
    @Column(name = "categoria")
    private String categoria;

    @OneToMany(mappedBy = "tipo_producto", fetch = FetchType.LAZY)
    private List<Product> products;

}
