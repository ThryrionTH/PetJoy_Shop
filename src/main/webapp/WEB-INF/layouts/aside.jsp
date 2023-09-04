<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/css/layouts/aside.css">

<aside>
    <div class="container-sidebar">
        <div class="title-one text-light mb-3">
            <h2>Hola,<strong>Tom</strong></h2>
        </div>
        <div class="img-profile">
            <img src="../img/perfil.jpg" alt="Imagen de perfil">
            <p class="text-secondary"><small>@Tom.pérez1208</small></p>
        </div>
        <div class="title-two text-light">
            <small>Menu principal</small>
        </div>
        <div class="sidebar">

            <ul class="sidebar-options">
                <li class="me-4 active"><i class="bi bi-menu-button-wide"></i><a href="#">Productos</a></li>
                <li class="me-4"><i class="bi bi-receipt"></i><a href="#">Facturas</a></li>
                <li class="me-4"><i class="bi bi-people-fill"></i><a href="#">Usuarios</a></li>
            </ul>

        </div>
        <div class="img-buttom">

            <a href="/logout">Cerrar Sesión</a>
        </div>
    </div>
</aside>