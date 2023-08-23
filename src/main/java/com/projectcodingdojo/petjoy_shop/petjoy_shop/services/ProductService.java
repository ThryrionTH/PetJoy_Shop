package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import org.springframework.stereotype.Service;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.ProductRepository;

@Service
public class ProductService extends BaseService<Product> {

    public ProductService(ProductRepository repository) {
        super(repository);
    }
    
}
