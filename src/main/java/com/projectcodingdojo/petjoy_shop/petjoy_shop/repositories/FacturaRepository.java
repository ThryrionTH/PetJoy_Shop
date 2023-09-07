
package com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Factura;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface FacturaRepository extends JpaRepository<Factura, Long> {
}

