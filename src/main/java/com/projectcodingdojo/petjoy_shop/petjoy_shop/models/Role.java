package com.projectcodingdojo.petjoy_shop.petjoy_shop.models;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "role")
<<<<<<< HEAD
public class Role extends BaseModel {
=======
public class Role extends BaseModel{
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d

    @NotNull
    @NotBlank
    @Size(min = 3, max = 20)
    @Column(unique = true)
    private String name;

    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY)
    private List<Clients> clients;
}
