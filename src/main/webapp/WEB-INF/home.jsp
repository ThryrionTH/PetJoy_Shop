<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="./css/style.css">
        <title>PetJoy Shop</title>
    </head>

    <body>

        <%@ include file="./layouts/navbar.jsp"%>
       
       <!-- Carousel -->
        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
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
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Carrito de compras -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">Carrito de compras</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <jsp:include page="layouts/carrito.jsp"></jsp:include>
                </div>
            </div>

            <div class="container mt-5 mb-5">
                <!-- Card Principal-->
                <div class="card mb-3 card-init" style="max-width: 100%;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="./img/img1.jpg" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                              <h4 class="card-title ml-green">¡Descubre el poder de nuestros productos!</h4>
                              <p class="card-text">Mejora tu vida con nuestra amplia gama de productos de alta calidad. Nuestros productos están diseñados para brindarte comodidad y satisfacción en cada uso. ¡No esperes más para experimentar la diferencia!</p>
                              <a href="/productos" class="btn btn-success">Ver Productos</a>
                        </div>
                        </div>
                    </div>
                </div>

                <!-- Category -->
                <div class="my-4 ">
                    <h2 class="ml-green">Categorías</h2>
                    <div class="d-flex">
                        <div class="mundo container-fluid me-3">
                            <h1 class="title">Mundo gatuno</h1>
                            <div class="gatuno">
                            </div>
                        </div>
                        <div class="mundo container-fluid ms-3">
                            <div class="perruno">
                            </div>
                            <h1 class="title">Mundo perruno</h1>
                        </div>
                    </div>
                </div>

                <!-- Productos recomendados -->
                <div>
                    <div class="my-4">
                        <h2 class="ml-green">Productos recomendados</h2>
                        <div class="d-flex flex-wrap justify-content-between" id="lista-cursos">
                        <c:forEach items="${randomProducts}" var="producto" varStatus="status">
                            <div class="card m-1" style="width: 18rem;">
                                <div class="card-header d-flex justify-content-center align-self-cente">
                                    <img src="/img/products/${producto.imagen}" alt="${producto.nombre}" height="150px">
                                    <button type="button" class="btn btn-secondary modal-product" data-bs-toggle="modal"
                                            data-bs-target="#modalProduct-${status.index}">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${producto.nombre}</h5>
                                    <p class="card-text precio"><span>$${producto.precio}</span></p>
                                </div>
                                <div class="card-footer">
                                    <button id="cart-button" class="btn btn-success add-to-cart-button agregar-carrito" data-id="$${producto.id}"
                                            data-product-id="2">
                                        <i class="bi bi-cart-fill"></i>Agregar
                                    </button>


                                </div>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="modalProduct-${status.index}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">${producto.nombre}</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3" style="max-width: 540px;">
                                                <div class="row g-0">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-sm-5 d-flex align-items-center">
                                                                <img src="/img/products/${producto.imagen}" alt="${producto.nombre}" height="150px">
                                                            </div>
                                                            <div class="col-sm-7">
                                                                <h5 class="card-title">${producto.nombre}</h5>
                                                                <p class="card-text"><small class="text-body-secondary">Código de producto:000000</small></p>
                                                                <p class="card-text precio"><span>$${producto.precio}</span></p>
                                                                <hr width="215px">
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
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%@ include file="./layouts/footer.jsp"%>

    <script src="/js/car.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous">
    </script>

</body>

</html>