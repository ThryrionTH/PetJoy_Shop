package com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories;

<<<<<<< HEAD
import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Role;

=======

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Role;


>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
public interface RoleRepository extends BaseRepository<Role> {
    Role findByNameContaining(String name);
}
