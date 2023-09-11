package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

<<<<<<< HEAD
=======

>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.BaseRepository;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.ClientsRepository;

@Service
public class ClientsService extends BaseService<Clients> {
    public ClientsService(BaseRepository<Clients> baseRepository) {
        super(baseRepository);
    }

<<<<<<< HEAD
    @Autowired
    ClientsRepository clientsRepository;

=======
    @Autowired ClientsRepository clientsRepository ;
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
    public Clients findByEmail(String email) {
        return clientsRepository.findByEmail(email);
    }

}
