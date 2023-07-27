<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style.css">
    <title>PetJoy Shop</title>
</head>

<body id="body-dashboard">
    <aside>
        <div class="container-sidebar">
            <div class="title-one text-light mb-3">
                <h2>Hola,<strong>Tom</strong></h2>
            </div>
            <div class="img-profile">
                <img src="./img/perfil.jpg" alt="Imagen de perfil">
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

                <button type="submit">Cerrar sesión</button>
            </div>
        </div>
    </aside>

    <div class="container-all">
        <!-- Productos-->
        <div class="container mt-5 mb-5">
            <div>

                <!-- Formulario de búsqueda -->
                <div class="d-flex justify-content-end mb-4">
                    <form class="d-flex col-md-3" action="${pageContext.request.contextPath}/buscar-producto"
                        method="GET">
                        <input class="form-control me-2" type="search" name="nombreProducto"
                            placeholder="Buscar producto" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>

                <!-- Productos-->
                <div>
                    <div class="d-flex flex-wrap justify-content-between">
                        <c:forEach items="${listaProductos}" var="producto" varStatus="status">
                            <div class="card m-1" style="max-width: 18rem;">
                                <div class="card-header d-flex justify-content-center align-self-cente">
                                    <img src="./img/${producto.imagen}" alt="${producto.nombre}" height="150px">
                                    <button type="button" class="btn btn-secondary modal-product"
                                        data-bs-toggle="modal" data-bs-target="#modalProduct-${status.index}">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${producto.nombre}</h5>
                                    <p class="card-text">$${producto.precio}</p>
                                </div>
                                <div class="card-footer">
                                    <button type="button" class="btn btn-danger">
                                        <i class="bi bi-trash3-fill"></i>
                                        Eliminar
                                    </button>
                                    <button type="button" class="btn btn-dark" data-bs-toggle="modal"
                                        data-bs-target="#modalEdicion-${status.index}">
                                        <i class="bi bi-pencil-square"></i>
                                        Editar
                                    </button>
                                </div>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="modalProduct-${status.index}" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">
                                                ${producto.nombre}
                                            </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3" style="max-width: 540px;">
                                                <div class="row g-0">
                                                    <div class="col-md-5 d-flex align-items-center">
                                                        <img src="./img/${producto.imagen}"
                                                            class="img-fluid rounded-start"
                                                            alt="${producto.nombre}">
                                                    </div>
                                                    <div class="col-md-7">
                                                        <div class="card-body">
                                                            <h5 class="card-title">${producto.nombre}</h5>
                                                            <p class="card-text"><small
                                                                    class="text-body-secondary">Código de
                                                                    producto:000000</small></p>
                                                            <p class="card-text">Precio: $${producto.precio}</p>
                                                            <hr width="215px">
                                                            <div>
                                                                <button type="button" class="btn btn-dark"><i
                                                                        class="bi bi-dash-lg"></i></button>
                                                                <strong class="m-1">1</strong>
                                                                <button type="button" class="btn btn-dark"><i
                                                                        class="bi bi-plus-lg"></i></button>
                                                                <button type="button" class="btn btn-success"><i
                                                                        class="bi bi-cart-fill"></i> Agregar
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

                            <!-- Modal Edición -->
                            <div class="modal fade" id="modalEdicion-${status.index}" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">
                                                ${producto.nombre}
                                            </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="" method="post">
                                                <div class="mb-3" style="max-width: 540px;">
                                                    <div class="row g-0 d-flex align-items-end mb-4">
                                                        <div class="col-md-4 d-flex align-items-center">
                                                            <img src="./img/${producto.imagen}"
                                                                class="img-fluid rounded-start"
                                                                alt="${producto.nombre}">
                                                        </div>

                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <div>
                                                                    <small><label for="formFile"
                                                                            class="form-label">Imagen</label></small>
                                                                    <input class="form-control" type="file"
                                                                        id="formFile">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="my-3">
                                                            <small><label for="name"
                                                                    class="form-label">Nombre</label></small>
                                                            <input type="text" class="form-control" id="name"
                                                                aria-describedby="nameProdcuct"
                                                                value="${producto.nombre}">
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <div class="col-7 mb-3">
                                                                <small><label for="precio"
                                                                        class="form-label">Precio</label></small>
                                                                <input type="int" class="form-control"
                                                                    id="precio" aria-describedby="priceProdcuct"
                                                                    value="${producto.precio}">
                                                            </div>
                                                            <div class="col-4 mb-3">
                                                                <small><label for="stock"
                                                                        class="form-label">Stock</label></small>
                                                                <input type="int" class="form-control"
                                                                    id="stock" aria-describedby="priceProdcuct"
                                                                    value="${producto.stock}">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <small>Descripción</small>
                                                            <textarea class="form-control"
                                                                aria-label="description">${producto.descripcion}</textarea>
                                                        </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-dark"
                                        data-bs-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-success"
                                        data-bs-dismiss="modal">Guardar cambios</button>
                                </div>
                            </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous">
        </script>

</body>

</html>