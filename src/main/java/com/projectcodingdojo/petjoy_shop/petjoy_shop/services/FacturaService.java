package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.*;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.*;
import jakarta.transaction.Transactional;
<<<<<<< HEAD
import java.util.List;
=======
import java.util.Optional;
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
<<<<<<< HEAD
public class FacturaService {

    @Autowired
    private FacturaRepository repository;

    @Transactional
    public Factura save(Factura obj) {
        return repository.save(obj);
    }

    public List<Factura> findByIdClent(Long id) {
        return repository.findByIdClent(id);
    }
=======
public class FacturaService  {

    @Autowired
    private FacturaRepository repository;
    
    @Transactional
     public Factura save(Factura obj){
         return repository.save(obj);
     }
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
}
