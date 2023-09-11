<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet" >

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="./css/style.css">
        <title>PetJoy Shop</title>
    </head>
    <body>
        <%@ include file="./layouts/navbar.jsp"%>

        <!-- Carrito de compras -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header" id="lista-cursos">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">Carrito de compras</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" >
                <jsp:include page="layouts/carrito.jsp"></jsp:include>
                </div>
            </div>

            <div class="container-fluid mt-5 mb-5">
                <div class="card">
                    <div class="card-body">
                        <h5 >Mis Pedidos</h5>
                        <hr />

                        <table class="table table-bordered table-responsive table-striped">
                            <thead>
                                <tr>
                                    <th>Codigo Factura</th>
                                    <th>Fecha</th>
                                    <th>Tipo de Entrega</th>
                                    <th>Forma Pago</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${facturas}" var="item" varStatus="status">
                                <tr>
                                    <td>${item.codigo}</td>
                                    <td>${item.fecha}</td>
                                    <td>${item.tipoEntrega}</td>
                                    <td>${item.forma_pago.descripcion}</td>
                                    <td>${item.total}</td>
                                    <td>
                                        <a href="#" data-bs-toggle="modal"
                                           data-bs-target="#modalFactura-${status.index}" class="btn btn-info">
                                            <i class="fa fa-info-circle"></i>
                                        </a>

                                        <!-- Modal -->
                                        <div class="modal fade" id="modalFactura-${status.index}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Factura: ${item.codigo}</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class=" mt-3">
                                                            <div class="row g-3">
                                                                <div class="col-md-6">
                                                                    <label  class="form-label" style="font-weight: bold;">Tipo Entrega: </label>
                                                                    <label >${item.tipoEntrega}</label>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <label  class="form-label" style="font-weight: bold;">Fecha: </label>
                                                                    <label>${item.fecha}</label>
                                                                </div>
                                                            </div>

                                                            <div class="row g-3">
                                                                <div class="col-md-6">
                                                                    <label  class="form-label" style="font-weight: bold;">Cliente: </label>
                                                                    <label >${item.cliente.nombre} ${item.cliente.apellido}</label>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <label  class="form-label" style="font-weight: bold;">Forma Pago: </label>
                                                                    <label>${item.forma_pago.descripcion} </label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class=" mt-3">
                                                            <table class=" table table-bordered table-responsive table-striped">
                                                                <thead >
                                                                    <tr >
                                                                        <th>Categoria</th>
                                                                        <th>Producto</th>
                                                                        <th>Precio</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${item.pedidos}" var="detalle">
                                                                        <tr>
                                                                            <td>${detalle.producto.tipo_producto.categoria}</td>
                                                                            <td>${detalle.producto.nombre}</td>
                                                                            <td>${detalle.precio}</td>
                                                                            <td>${detalle.cantidad}</td>
                                                                            <td>${detalle.precio * detalle.cantidad}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                        <tr>
                                                                            <td colspan="4" style="font-weight: bold;">Importe Total:</td>
                                                                            <td  style="font-weight: bold;">${item.total}</td>
                                                                        </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${facturas.size() == 0}">
                                <tr>
                                    <td colspan="6" class="text-center">No hay datos</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
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
        <script src="/js/car.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous">
        </script>

    </body>

</html>