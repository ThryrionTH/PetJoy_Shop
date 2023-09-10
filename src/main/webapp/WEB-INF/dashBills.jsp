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
            <link rel="stylesheet" href="/css/style.css">
            <title>Facturas</title>
        </head>

        <body id="body-dashboard">

            <%@ include file="./layouts/aside.jsp" %>

                <div class="container-all bill-container">
                
                    <div class="container mt-5 mb-5 px-4">

                        <h2 class="ml-green mb-4">Facturas</h2>
                
                        <table class="table align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col" class="text-center">N° factura</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col" class="text-center">Fecha factura</th>
                                    <th scope="col" class="text-center"></th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <th scope="row" class="text-center">1</th>
                                    <td>Nombre Cliente</td>
                                    <td class="text-center">10/09/2023</td>
                                    <td class="text-center"><button class="btn btn-dark">Ver detalle factura</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                    crossorigin="anonymous">
                    </script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script src="/js/deleteAlert.js"></script>
        </body>

        </html>