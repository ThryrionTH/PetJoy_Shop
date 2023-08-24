<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login</title>
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
            </head>

            <body>
                <div class="container mt-5">
                    <h1 class="mb-4">Inicia sesión para continuar con tu pago</h1>
                    <h2>Login</h2>
                    <form:form action="/login" method="post" modelAttribute="client">
                        <div class="mb-3">
                            <form:label path="email" class="form-label">Email:</form:label>
                            <form:input path="email" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <form:label path="contrasena" class="form-label">Contraseña:</form:label>
                            <form:password path="contrasena" class="form-control" />
                        </div>
                        <input type="submit" value="Login" class="btn btn-primary" />
                    </form:form>
                    <c:if test="${not empty error}">
                        <p class="text-danger">${error}</p>
                    </c:if>
                    <br>
                    <a href="/" class="btn btn-secondary">Cancel</a>
                </div>
            </body>

            </html>