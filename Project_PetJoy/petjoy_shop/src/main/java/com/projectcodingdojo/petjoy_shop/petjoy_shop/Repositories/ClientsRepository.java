package com.projectcodingdojo.petjoy_shop.petjoy_shop.Repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.Models.Clients;

@Repository
public interface ClientsRepository extends CrudRepository<Clients, Long> {
    Clients findByEmail(String email);
}

