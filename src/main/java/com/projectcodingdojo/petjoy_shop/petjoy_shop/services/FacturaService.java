package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.*;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.*;
import jakarta.transaction.Transactional;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacturaService  {

    @Autowired
    private FacturaRepository repository;
    
    @Transactional
     public Factura save(Factura obj){
         return repository.save(obj);
     }
}
