package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Product;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.ProductRepository;

@Service
public class ProductService extends BaseService<Product> {

    private ProductRepository repository;

    public ProductService(ProductRepository repository) {
        super(repository);
        this.repository = repository;
    }

    public List<Product> findByIdTypeProduct(int id){
        return repository.findByIdTypeProduct(id);
    }
    
    public Page<Product> findByIdTypeProductPage(int id, String search , Pageable pageable){
        return repository.findByIdTypeProductPage(id,search ,pageable);
    }
    
}
