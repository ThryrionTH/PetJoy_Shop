<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <title>PetJoy Shop</title>
</head>

<body id="body-dashboard">

    <%@ include file="./layouts/aside.jsp"%>

    <div class="container-all bg-categories">
        <main class="container mt-5 mb-5 px-4">
            <h2 class="ml-green mb-3">Categorías de productos</h2>
            <nav aria-label="breadcrumb" class="d-flex justify-content-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/dashboard" class="text-decoration-none">Lista de productos</a></li>
                    <li class="breadcrumb-item"><a href="/dashboard/add" class="text-decoration-none">Agregar producto</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Categorías de producto</li>
                </ol>
            </nav>
            <form:form action="" method="post" modelAttribute="productType" class="d-flex align-items-end justify-content-between col-7 m-auto">
                <p class="p-0 m-0 col-9">
                    <form:label path="categoria" class="form-label">Nombre de categoría de producto</form:label>
                    <form:input path="categoria" class="form-control"/>
                    <form:errors path="categoria" />
                </p>
                <button type="submit" class="btn btn-dark col-2">Agregar</button>
            </form:form>
            <ul class="list-categories col-7 d-flex justify-content-between flex-wrap">
                <c:forEach items="${productsTypes}" var="type">
                    <li class="list-item">
                        <c:out value="${type.categoria}" />
                    </li>
                    <a href="/dashboard/categories/delete/${type.id}" type="button" class="btn btn-danger">
                        <i class="bi bi-trash3-fill"></i>
                    </a>
                </c:forEach>
            </ul>
        </main>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous">
    </script>
    <script src="/js/app.js"></script>

</body>

</html>
