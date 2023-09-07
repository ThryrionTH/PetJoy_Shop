<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- contenido del carrito -->
<div id="carrito">            
    <table id="lista-carrito" class=" table u-full-width">
        <thead>
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th></th>
            </tr>
        </thead>
        <tbody id="listCarrito"></tbody>
    </table>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <a href="#" id="vaciar-carrito" class="btn btn-danger">Vaciar Carrito</a>
        <a href="/checkout-cart" id="pagar-carrito" class="btn btn-primary">Pagar</a>
    </div>

</div>