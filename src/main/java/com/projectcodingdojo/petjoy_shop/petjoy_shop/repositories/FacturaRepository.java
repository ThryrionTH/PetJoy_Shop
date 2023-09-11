<<<<<<< HEAD
package com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Factura;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FacturaRepository extends JpaRepository<Factura, Long> {

    @Query("SELECT f FROM Factura f WHERE f.cliente.id = :id")
    List<Factura> findByIdClent(Long id);
}
=======

package com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Factura;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface FacturaRepository extends JpaRepository<Factura, Long> {
}

>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
