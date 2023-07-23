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


    <div class="container-all dash-add">
        <div class="container mt-5 mb-5 col-9">
            <h2 class="ml-green mb-4">Agregar producto</h2>
            <form action="/dashboard" class="mt-4">
                <div class="col-md-8">
                    <div class="card-body">
                        <div>
                            <small><label for="formFile" class="form-label">Imagen</label></small>
                            <input class="form-control" type="file" id="formFile">
                        </div>
                    </div>
                </div>
                <div class="my-3">
                    <small><label for="name" class="form-label">Nombre</label></small>
                    <input type="text" class="form-control" id="name">
                </div>
                <div class="d-flex justify-content-between">
                    <div class="col-7 mb-3">
                        <small><label for="precio" class="form-label">Precio</label></small>
                        <input type="number" class="form-control" id="precio">
                    </div>
                    <div class="col-4 mb-3">
                        <small><label for="stock" class="form-label">Stock</label></small>
                        <input type="number" class="form-control" id="stock">
                    </div>
                </div>
                <div class="mb-4">
                    <small>Descripción</small>
                    <textarea class="form-control" aria-label="description"></textarea>
                </div>
                <div class="mt-4 d-flex justify-content-end">
                    <button type="button" class="btn btn-dark me-4">Cancelar</button>
                    <button type="submit" class="btn btn-success">Agregar producto</button>
                </div>
            </form>

        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous">
    </script>

</body>

</html>