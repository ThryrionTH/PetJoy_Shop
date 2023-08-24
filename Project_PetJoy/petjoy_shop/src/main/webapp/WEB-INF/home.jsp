<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                                class="bi bi-person-circle"></i> Cristian Arevalo</a>
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
            Carrito vacío :(
                <a href="/verification" class="btn btn-secondary">Pagar</a>
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
                        <h5 class="card-title ml-green">Lorem ipsum dolor sit amet consectetur adipisicing
                            elit. Perspiciatis quidem vel, nobis a omnis ab libero dolorum cupiditate.</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                            additional content. This content is a little bit longer. Lorem ipsum dolor sit amet
                            consectetur adipisicing elit. Obcaecati sed autem rerum alias provident ipsam maxime vel
                            veritatis.
                        </p>
                        <button type="button" class="btn btn-success">Lorem ipsum</button>
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

        <!-- <div>
            <h2 class="ml-green">Categorías</h2>
            <div class="d-flex justify-content-around m-3">
                <img src="./img/dog_category.png" alt="CategoryDog">
                <img src="./img/cat_category.png" alt="CategoryCat">
            </div>
        </div> -->

        <!-- Productos recomendados -->
        <div>
        
        
            <!-- Productos recomendados -->
            <div class="my-4">
                <h2 class="ml-green">Productos recomendados</h2>
                <div class="d-flex flex-wrap justify-content-between">
                    <c:forEach items="${listaProductos}" var="producto" varStatus="status">
                        <div class="card m-1" style="max-width: 18rem;">
                            <div class="card-header d-flex justify-content-center align-self-cente">
                                <img src="./img/${producto.imagen}" alt="${producto.nombre}" height="150px">
                                <button type="button" class="btn btn-secondary modal-product" data-bs-toggle="modal"
                                    data-bs-target="#modalProduct-${status.index}">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${producto.nombre}</h5>
                                <p class="card-text">$${producto.precio}</p>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-dark"><i class="bi bi-dash-lg"></i></button>
                                <strong class="m-1">1</strong>
                                <button type="button" class="btn btn-dark"><i class="bi bi-plus-lg"></i></button>
                                <button type="button" class="btn btn-success"><i class="bi bi-cart-fill"></i> Agregar
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
                                                <div class="col-md-5 d-flex align-items-center">
                                                    <img src="./img/${producto.imagen}" class="img-fluid rounded-start" alt="${producto.nombre}">
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${producto.nombre}</h5>
                                                        <p class="card-text"><small class="text-body-secondary">Código de producto:000000</small></p>
                                                        <p class="card-text">Precio: $${producto.precio}</p>
                                                    <hr width="215px">
                                                        <div>
                                                            <button type="button" class="btn btn-dark"><i class="bi bi-dash-lg"></i></button>
                                                            <strong class="m-1">1</strong>
                                                            <button type="button" class="btn btn-dark"><i class="bi bi-plus-lg"></i></button>
                                                            <button type="button" class="btn btn-success"><i class="bi bi-cart-fill"></i> Agregar
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
    <!-- Footer -->
    <footer class="text-center text-lg-start text-white" style="background-color: #202123">
        <!-- Grid container -->
        <div class="container p-4 pb-0">
            <!-- Section: Links -->
            <section class="">
                <!--Grid row-->
                <div class="row">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">
                            PetJoy Shop
                        </h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, eligendi accusamus nemo natus
                            quod quaerat sunt adipisci.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
                        <p>
                            <a class="text-white">LoremIpsum</a>
                        </p>
                        <p>
                            <a class="text-white">LoremIpsum</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">
                            Useful links
                        </h6>
                        <p>
                            <a class="text-white">Your Account</a>
                        </p>
                        <p>
                            <a class="text-white">Become an Affiliate</a>
                        </p>
                    </div>
                    <hr class="w-100 clearfix d-md-none" />

                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                        <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                        <p><i class="fas fa-envelope mr-3"></i> info@gmail.com</p>
                        <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                    </div>
                </div>
            </section>
            <hr class="my-3">
            <section class="p-3 pt-0">
                <div class="row d-flex align-items-center">
                    <div class="col-md-7 col-lg-8 text-center text-md-start">
                        <div class="p-3">
                            © 2023 Copyright:
                            <a class="text-white" href="#">petjoyshop.com</a>
                        </div>
                    </div>
                    <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
                        <a class="btn btn-outline-light btn-floating m-1" class="text-white" role="button">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a class="btn btn-outline-light btn-floating m-1" class="text-white" role="button">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a class="btn btn-outline-light btn-floating m-1" class="text-white" role="button">
                            <i class="bi bi-google"></i>
                        </a>
                        <a class="btn btn-outline-light btn-floating m-1" class="text-white" role="button">
                            <i class="bi bi-instagram"></i>
                        </a>
                    </div>
                </div>
            </section>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous">
    </script>
        
</body>

</html>