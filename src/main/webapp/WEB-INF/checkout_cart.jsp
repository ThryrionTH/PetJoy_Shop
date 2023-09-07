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

        <div class="container-fluid mt-5 mb-5 agregar-carrito">
            <!-- Card Principal-->

            <div class="row g-0">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body ">
                            <h5 class="card-title"><span onclick="fnVolverAtras(1)" title="Pagina 1"  class="cursor badge rounded-pill bg-success">1</span> Datos personales</h5>

                            <div id="bloque1">
                                <div class="row mt-3">
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Nombres</label>
                                            <input name="nombre" id="nombre" type="text" class="form-control" maxlength="40">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Apellidos</label>
                                            <input name="apellido" id="apellido"  type="text" class="form-control" maxlength="40">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Documento Identidad</label>
                                            <input name="documento" id="documento" type="number" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label class="form-label">Telefono Celular</label>
                                            <input name="telefono" id="telefono" type="number" class="form-control" >
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="mb-3">
                                            <label class="form-label">Correo electrónico</label>
                                            <input name="correo" id="correo" type="email" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="d-grid gap-2" style="width: 70%;margin: auto;">
                                        <button onclick="fnValidarBloque(2)" class="btn btn-success" type="button">Ir a método de entrega</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <div class="card-body" >
                            <h5 class="card-title"><span onclick="fnVolverAtras(2)" title="Pagina 2"  class="cursor badge rounded-pill bg-success">2</span> Método de entrega</h5>

                            <div id="bloque2">
                                <div class="row mt-3">
                                    <div style="text-align: center;">
                                        <div id="bloqueSel1" >
                                            <button onclick="fnSeleccionarEntrega(1)" type="button" class="btn btn-secondary btn-lg" style=" border: 1px solid #000;">Envio a domiclio</button>
                                            <button onclick="fnSeleccionarEntrega(2)" type="button" class="btn btn-light btn-lg" style=" border: 1px solid #000;">Retirar en tienda</button>
                                        </div>

                                        <div id="bloqueSel2" >
                                            <button onclick="fnSeleccionarEntrega(1)" type="button" class="btn btn-light btn-lg" style=" border: 1px solid #000;">Envio a domiclio</button>
                                            <button onclick="fnSeleccionarEntrega(2)" type="button" class="btn btn-secondary btn-lg" style=" border: 1px solid #000;">Retirar en tienda</button>
                                        </div>
                                    </div>

                                    <div id="bloque_sec1">
                                        <div class="row mt-3">
                                            <div class="col-sm-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Ciudad</label>
                                                    <input name="ciudad" id="ciudad" type="text" class="form-control" maxlength="20">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Municipio</label>
                                                    <input name="municipio" id="municipio"  type="text" class="form-control" maxlength="40">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Dirección</label>
                                                    <input name="direccion" id="direccion" type="text" class="form-control" maxlength="20">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Descripcion</label>
                                                    <input name="descripcion" id="descripcion"  type="text" class="form-control" maxlength="200">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="d-grid gap-2" style="width: 70%;margin: auto;">
                                            <button onclick="fnValidarBloque(3)" class="btn btn-success" type="button">Ir a método de pago</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="card mt-3">
                        <div class="card-body" >
                            <h5 class="card-title"><span title="Pagina 3"   class="cursor badge rounded-pill bg-success">3</span> Método de pago</h5>
                            <div id="bloque3">
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <span class="badge text-bg-primary">Tarjeta de crédito</span>
                                        <br /><br />
                                        <span>Para poder procesar la compra es requerido realizar el pago correspondiente através de una transferencia bancaria.</span>
                                        <span>Solo se le cobrará el importe correspondiente.</span>
                                        <hr />
                                        <div class="row g-3">
                                            <div class="col-sm-6">
                                                <label for="tarjeta" class="form-label">Número de Tarjeta: <span style="color: red;">(*)</span></label>
                                                <input type="text" name="tarjeta" id="tarjeta" maxlength="20" class="form-control" >
                                            </div>

                                            <div class="col-sm-6">
                                                <label for="fecha_vencimiento" class="form-label">Fecha Vencimiento: <span style="color: red;">(*)</span></label>
                                                <input type="text" id="fecha_vencimiento" class="form-control"  maxlength="5"     title="El Formato correcto debe ser: mm/yy , ejem: 07/29">

                                            </div>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col-sm-6">
                                                <label for="cvv" class="form-label">CVV: <span style="color: red;">(*)</span></label>
                                                <input type="text" id="cvv" class="form-control"  maxlength="3"    title="Debe contener 3 digitos">

                                            </div>
                                        </div>

                                        <div class="row g-3 mt-3">
                                            <div class="col-sm-12">
                                                <button id="btnEfectuarPago" onclick="fnEfectuarPago()" type="button" class="btn btn-primary">Hacer pago</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Resumen de la Orden</h5>
                            <div class="table-responsive">
                                <table class=" table u-full-width  mt-3" >
                                    <tbody id="list_checkout"></tbody>
                                </table>
                            </div>

                            <hr />

                            <table class="table" style="width: 100%;font-weight: bold;">
                                <tr>
                                    <td colspan="2">
                                        <span >Total:</span>
                                    </td>
                                    <td style="text-align: right; ">
                                        <span id="lblTotal"  style="padding-right: 40px;"></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="/js/checkout_car.js"></script>
    <script src="/js/deleteAlert.js"></script>
</body>

</html>