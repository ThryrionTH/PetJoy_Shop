<<<<<<< HEAD
=======

>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Pedido;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.PedidoRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PedidoService {
    @Autowired
    private PedidoRepository pedidoRepo;
<<<<<<< HEAD

    @Transactional
    public void Save(Pedido obj) {
=======
    
    @Transactional
    public void Save(Pedido obj){
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
        pedidoRepo.save(obj);
    }
}
