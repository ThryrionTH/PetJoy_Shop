<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="./css/style.css">

        <title>PetJoy Shop </title>
    </head>

    <body>
        <!-- Navbar -->
        <%@ include file="./layouts/navbar.jsp"%>

        <!-- Carousel -->
        <div id="carouselExample" class="carousel slide"
             data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./img/img1.webp" class="d-block w-100" alt="img1">
                </div>
                <div class="carousel-item">
                    <img src="./img/img2.webp" class="d-block w-100" alt="img2">
                </div>
                <div class="carousel-item">
                    <img src="./img/img3.webp" class="d-block w-100" alt="img3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                    class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
                    class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Carrito de compras -->
        <div class="offcanvas offcanvas-end" width="500px" tabindex="-1" id="offcanvasRight"
             aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">Carrito de
                    compras</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <jsp:include page="layouts/carrito.jsp"></jsp:include>
            </div>
        </div>


        <div class="container mt-5 mb-5">

            <!-- categorias -->
            <h2 class="ml-green">Categorías</h2>
            <div class="d-flex justify-content mb-5">
                <c:forEach items="${productsTypes}" var="category">
                    <c:if test='${category.id == idCateg}'>
                        <c:set value="sombreado_categ" var="cssClass"></c:set>
                    </c:if>
                    <c:if test='${category.id != idCateg}'>
                        <c:set value="" var="cssClass"></c:set>
                    </c:if>

                    <a href="/products?idCateg=${category.id}"
                       style="text-decoration: none; color:black;">
                        <div class="d-flex align-items-center justify-content-around bg-green rounded ${cssClass} me-3 pe-2"
                            style="width: 14rem;">
                            <img src="${category.imagen}" alt="imagen categoría" height="100px">
                            <p class="text-center m-0">${category.categoria}</p>
                        </div>
                    </a>
                </c:forEach>
            </div>

            <c:if test="${productsList.size() == 0}">
                <div class="alert alert-info" role="alert">No se encontraron productos.</div>
            </c:if>


            <c:if test="${productsList.size() > 0}">
                <!-- Formulario de búsqueda -->
                <div class="d-flex justify-content-end mb-4">
                    <form action="/products" class="d-flex col-md-3">
                        <input class="form-control me-2" type="search" name="s"
                               value="${s}"
                               placeholder="Buscar producto" aria-label="Search">
                        <input type="hidden" name="idCateg" value="${idCateg}">
                        <input type="hidden" name="page" value="${page}">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>

                <!-- Productos-->
                <div>
                    <div class="d-flex flex-wrap justify-content-between text-center" id="lista-cursos">
                        <c:forEach items="${productsList}" var="producto" varStatus="status" >
                            <div class="card mt-2 m-1" style="width: 18rem;">
                                <div class="card-header d-flex justify-content-center align-self-cente">
                                    <img src="/img/products/${producto.imagen}" alt="${producto.nombre}" height="150px">
                                    <button type="button" class="btn btn-secondary modal-product"
                                            data-bs-toggle="modal" data-bs-target="#modalProduct-${status.index}">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${producto.nombre}</h5>
                                    <p class="card-text precio "><span>$${producto.precio}</span></p>
                                </div>
                                <div class="card-footer">
                                    <!-- <button type="button" class="btn btn-dark">
                                            <i class="bi bi-dash-lg"></i>
                                    </button>
                                    <strong class="m-1">1</strong>
                                    <button type="button" class="btn btn-dark">
                                            <i class="bi bi-plus-lg"></i>
                                    </button> -->
                                    <button id="cart-button" class="btn btn-success add-to-cart-button agregar-carrito" data-id="$${producto.id}"
                                            data-product-id="2">
                                        <i class="bi bi-cart-fill"></i>Agregar
                                    </button>
                                </div>

                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="modalProduct-${status.index}"
                                 tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">${producto.nombre}
                                            </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3" style="max-width: 540px;">
                                                <div class="row g-0">
                                                    
                                                    <div class="col-md-7">
                                                        <div class="card-body">
                                                            <div class="col-md-5 d-flex align-items-center">
                                                                <img src="/img/products/${producto.imagen}" alt="${producto.nombre}" height="150px">
                                                            </div>
                                                            <h5 class="card-title">${producto.nombre}</h5>
                                                            <p class="card-text">
                                                                <small class="text-body-secondary">${producto.codigo}</small>
                                                            </p>
                                                            <p class="card-text precio"><span>$${producto.precio}</span></p>
                                                            <hr width="215px">
                                                            <div class="card-footer">
                                                                <!-- <button type="button" class="btn btn-dark">
                                                                        <i class="bi bi-dash-lg"></i>
                                                                </button>
                                                                <strong class="m-1">1</strong>
                                                                <button type="button" class="btn btn-dark">
                                                                        <i class="bi bi-plus-lg"></i>
                                                                </button> -->
                                                                <button id="cart-button" class="btn btn-success add-to-cart-button agregar-carrito" data-id="$${producto.id}"
                                                                        data-product-id="2">
                                                                    <i class="bi bi-cart-fill"></i>Agregar
                                                                </button> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <p class="mt-4">${producto.descripcion}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Paginación -->
                <nav aria-label="Page navigation example" class="m-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">

                            <c:if test="${anterior == 0}">
                            <li class="page-item "><a 
                                    class="page-link bg-dark text-white ocultar cursor" href="#">Anterior</a></li>
                            </c:if>

                        <c:if test="${anterior != 0}">
                            <li class="page-item "><a href="/products?s=${s}&idCateg=${idCateg}&page=${anterior}"
                                                      class="page-link bg-dark text-white cursor">Anterior</a></li>
                            </c:if>

                        <c:forEach items="${pages}" var="page">
                            <li class="page-item">
                                <c:if test="${actual==page}">
                                    <a class="page-link active">${page}</a>
                                </li>
                            </c:if>

                            <c:if test="${actual!=page}">
                                <a href="/products?s=${s}&idCateg=${idCateg}&page=${page}" class="page-link">${page}</a>
                            </c:if>
                        </c:forEach>

                        <c:if test="${actual == ultimo}">
                            <li class="page-item "><a class="page-link bg-dark text-white ocultar cursor" href="#">Siguiente</a></li>
                            </c:if>

                        <c:if test="${actual != ultimo}">
                            <li class="page-item "><a href="/products?s=${s}&idCateg=${idCateg}&page=${siguiente}"
                                                      class="page-link bg-dark text-white cursor">Siguiente</a></li>
                            </c:if>

                    </ul>

                </nav>
            </c:if>
        </div>

        <div class="container advantages">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-3">
                    <div class="text-center">
                        <i class="bi bi-emoji-heart-eyes mb-3"></i>
                        <h5>Productos de alta calidad que tu mascota amará.</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="text-center">
                        <i class="bi bi-truck mb-3"></i>
                        <h5>Entrega rápida y segura en toda la ciudad.</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="text-center">
                        <i class="bi bi-chat-dots mb-3"></i>
                        <h5>Atención al cliente 24/7 para resolver tus dudas.</h5>
                    </div>
                </div>
                <div class="col-md-1 text-center">
                    <img src="/img/doggy.png" alt="Perrito feliz" class="img-fluid">
                </div>
            </div>
        </div>
        
        <%@ include file="./layouts/footer.jsp"%>

        <script src="/js/car.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous">
        </script>
    </body>

</html>