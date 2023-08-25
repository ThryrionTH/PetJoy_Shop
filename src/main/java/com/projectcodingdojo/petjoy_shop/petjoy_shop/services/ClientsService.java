package com.projectcodingdojo.petjoy_shop.petjoy_shop.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.Clients;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.repositories.ClientsRepository;

@Service
public class ClientsService {
    private final ClientsRepository clientsRepository;

    public ClientsService(ClientsRepository clientsRepository) {
        this.clientsRepository = clientsRepository;
    }

    public Clients findClientById(Long id) {
        Optional<Clients> client = clientsRepository.findById(id);

        if (client.isPresent()) {
            return client.get();
        } else {
            return null;
        }
    }

    public Clients createClient(Clients client) {
        String hashed = BCrypt.hashpw(client.getContrasena(), BCrypt.gensalt());
        client.setContrasena(hashed);
        return clientsRepository.save(client);
    }

    public Clients findClientByEmail(String email) {
        return clientsRepository.findByEmail(email);
    }

    public Clients updateClient(Long id, Clients client) {
        Optional<Clients> optionalClients = clientsRepository.findById(client.getId());
        
        if (optionalClients.isPresent()) {
            Clients existingClient = optionalClients.get();
            existingClient.setNombre(client.getNombre());
            existingClient.setApellido(client.getApellido());
            existingClient.setNro_identificacion(client.getNro_identificacion());
            existingClient.setEmail(client.getEmail());
            existingClient.setContrasena(client.getContrasena());
            existingClient.setCelular(client.getCelular());
            existingClient.setCiudad(client.getCiudad());
            existingClient.setDepartamento(client.getDepartamento());
            existingClient.setDireccion(client.getDireccion());
            return clientsRepository.save(existingClient);
        }
        return null;
    }

    public void deleteClient(Long id) {
        clientsRepository.deleteById(id);
    }

    public boolean authenticateClient(String email, String contrasena) {
        Clients client = clientsRepository.findByEmail(email);
        if (client == null) {
            return false;
        } else {
            if (BCrypt.checkpw(contrasena, client.getContrasena())) {
                return true;
            } else {
                return false;
            }
        }
    }
}
