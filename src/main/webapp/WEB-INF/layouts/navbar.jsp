<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link active c-white" aria-current="page" href="#">
                        <i class="bi bi-person-circle"></i>
                        <c:out value="${sessionScope.nombreUsuario}" />
                        <c:out value="${sessionScope.apellidoUsuario}" />
                    </a>
                </li>
            </sec:authorize>

            </ul>
            <div class="d-flex">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <sec:authorize access="!isAuthenticated()">
                            <a class="nav-link active c-white" href="/login" aria-current="page"><i class="bi bi-box-arrow-in-right"></i> Iniciar Sesión</a>
                        </sec:authorize>
                    </li>
                    <li>
                        <sec:authorize access="!isAuthenticated()">
                            <a class="nav-link active c-white" href="/signup" aria-current="page"><i class="bi bi-r-square"></i> Registrarse</a>
                        </sec:authorize>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active c-white" aria-current="page" href="products"><i
                                class="bi bi-gift-fill"></i> Productos</a>
                    </li>
                    <sec:authorize access="isAuthenticated()">
                        <li class="nav-item">
                            <a class="nav-link active c-white" aria-current="page" href="<c:url value='/logout' />">
                                <i class="bi bi-box-arrow-right"></i> Logout
                            </a>
                        </li>
                    </sec:authorize>
                  
                    <li class="nav-item">
                        <!-- Button trigger modal -->
                        <button id="btnProdCart" class="btn btn-outline-success c-white b-white" type="submit" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-cart4"></i> <span
                                class="badge bg-success rounded-pill">Tus productos</span> </button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

