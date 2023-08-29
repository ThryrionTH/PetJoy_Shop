<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary" id="navbar-petjoy">
    <div class="container-fluid">
        <a class="navbar-brand c-white" href="/"><i class="bi bi-shop"></i> PetJoy Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active c-white" aria-current="page" href="#"><i
                            class="bi bi-person-circle"></i> ${client_name} ${client_apellido}</a>
                </li>

            </ul>
            <div class="d-flex">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active c-white" aria-current="page" href="products"><i
                                class="bi bi-gift-fill"></i> Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link c-white" href="#"><i class="bi bi-clipboard2-check-fill"></i>
                            Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link c-white" href="#"><i class="bi bi-clipboard-heart-fill"></i> Adopción</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link c-white" href="#"> <i class="bi bi-info-circle-fill"></i> Acerca de
                            nosotros</a>
                    </li>
                    <li class="nav-item">
                        <!-- Button trigger modal -->
                        <button class="btn btn-outline-success c-white b-white" type="submit" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-cart4"></i> <span
                                class="badge bg-success rounded-pill">5</span> <strong>$ 0</strong></button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

