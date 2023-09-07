package com.projectcodingdojo.petjoy_shop.petjoy_shop.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.projectcodingdojo.petjoy_shop.petjoy_shop.models.*;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.security.DetallesSeguridadUsuario;
import com.projectcodingdojo.petjoy_shop.petjoy_shop.services.*;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FacturaController {

    @Autowired
    ClientsService clientsService;

    @Autowired
    RoleService roleService;

    @Autowired
    FormaPagoService formaPgService;

    @Autowired
    FacturaService facturaService;

    @Autowired
    ProductService productService;

    @Autowired
    PedidoService pedidoService;

    @Autowired
    DetallesSeguridadUsuario securityUserDetails;

    @Value("${role_user}")
    private String USER_ROLE;

    @Value("${forma_pago_efectivo}")
    private String FORMA_PAGO_EFECTIVO;

    @Value("${codigo_fact}")
    private String CODIGO_FACT;

    @RequestMapping("/checkout-cart")
    public String clientCheckout(HttpSession session, Model model) {
        Clients client = new Clients();
        model.addAttribute("client", client);
        return "checkout_cart";
    }

    @GetMapping("/checkout-save")
    public ResponseEntity<Object> clientCheckoutSave(String nombre, String apellido,
            String documento, String telefono, String correo, String ciudad, String municipio, String direccion,
            String descripcion, String entrega, String items_id, String items_cantidad) {
        String msg = "";

        try {
            // OBTENCION CLIENTE
            Clients objCliente = new Clients();
            objCliente.setNombre(nombre);
            objCliente.setApellido(apellido);
            objCliente.setNro_identificacion(documento);
            objCliente.setCelular(telefono);
            objCliente.setEmail(correo);
            objCliente.setCiudad(!ciudad.trim().equals("") ? ciudad : "---");
            objCliente.setDireccion(!direccion.trim().equals("") ? direccion : "---");
            objCliente.setDepartamento("departamento");
            objCliente.setContrasena("12345678");
            Role role = roleService.findByNameContaining(USER_ROLE);
            objCliente.setRole(role);

            clientsService.save(objCliente);

            if (objCliente.getId() != null) {
                // Obtencion Forma Pago
                FormaPago objFormaPg = formaPgService.findByDescripcion(FORMA_PAGO_EFECTIVO).get();

                if (objFormaPg != null) {
                    int nEntrega = Integer.parseInt(entrega);
                    // Generando factura
                    Factura objFact = new Factura();
                    objFact.setFecha(new Date());
                    objFact.setCliente(objCliente);
                    objFact.setDireccion_envio(nEntrega == 1 ? direccion : "---");
                    objFact.setDescripcion(nEntrega == 1 ? descripcion : "---");
                    objFact.setCiudad(nEntrega == 1 ? ciudad : "---");
                    objFact.setMunicipio(nEntrega == 1 ? municipio : "---");
                    objFact.setForma_pago(objFormaPg);
                    objFact.setTotal(0);
                    objFact.setCodigo(0);
                    objFact.setTipoEntrega(nEntrega == 1 ? "Envio a domicilio" : "Retiro en tienda");
                    facturaService.save(objFact);

                    // Generar Items Factura Pedido
                    List<Integer> dataId = getItems(items_id);
                    List<Integer> dataCantidad = getItems(items_cantidad);

                    double total = 0;
                    List<Pedido> lisPedidos = new ArrayList<Pedido>();

                    for (int i = 0; i < dataId.size(); i++) {
                        Pedido objPed = new Pedido();

                        Product objProd = productService.findById(Long.parseLong(String.valueOf(dataId.get(i))));

                        if (objProd != null) {
                            objPed.setCantidad(dataCantidad.get(i));
                            objPed.setProducto(objProd);
                            objPed.setPrecio(objProd.getPrecio());
                            objPed.setFactura(objFact);

                            pedidoService.Save(objPed);

                            total += (objPed.getCantidad() * objPed.getPrecio());

                            // Disminuir Stock
                            objProd.setStock(objProd.getStock() - objPed.getCantidad());
                            productService.save(objProd);
                        }

                    }

                    // Actualizar Factura e Items Pedidos
                    objFact.setPedidos(lisPedidos);
                    objFact.setTotal(total);
                    objFact.setCodigo(Integer.parseInt(CODIGO_FACT) + objFact.getId().intValue());
                    facturaService.save(objFact);

                    msg = "OK";
                } else {
                    msg = "No se pudo obtener datos de la forma de pago";
                }

            } else {
                msg = "No se pudo obtener datos del cliente";
            }

            return new ResponseEntity<Object>(msg, HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<Object>(ex.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    public List<Integer> getItems(String data) {
        String separador = ";";
        List<Integer> lista = new ArrayList<>();
        String dataItems[] = data.trim().split(separador);

        for (int i = 0; i < dataItems.length; i++) {

            if (!dataItems[i].trim().equals(separador)) {
                lista.add(Integer.parseInt(dataItems[i]));
            }
        }
        return lista;
    }
    /*
    // ANTERIOR
   @RequestMapping("/checkout")
    public String clientCheckout(HttpSession session, Model model) {
        Long clientId = (Long) session.getAttribute("client_id");
        if (clientId == null) {
            return "redirect:/login1";
        }

        Clients client = clientsService.findById(clientId);
        model.addAttribute("client", client);
        return "checkout";
    }
     */
}
