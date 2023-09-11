package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Role;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.BaseRepository;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.RoleRepository;

@Service
<<<<<<< HEAD
public class RoleService extends BaseService<Role> {
=======
public class RoleService extends BaseService<Role>{
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
    public RoleService(BaseRepository<Role> baseRepository) {
        super(baseRepository);
    }

<<<<<<< HEAD
    @Autowired
    RoleRepository roleRepository;

    public Role findByNameContaining(String name) {
        return roleRepository.findByNameContaining(name);
    }

    public void saveAll(List<Role> roles) {
        roleRepository.saveAll(roles);
    }

=======
    @Autowired RoleRepository roleRepository;

    public Role findByNameContaining(String name){
        return roleRepository.findByNameContaining(name);
    }

    public void saveAll(List<Role> roles){
        roleRepository.saveAll(roles);
    }
    
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
}
