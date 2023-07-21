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

<body id="body-login">
    
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-5 offset-md-1">
                <form action="/dashboard" class="form-login d-flex flex-column justify-content-around text-light">
                    <h2 class="text-center">Inicio de sesión</h2>
                    <div class="rounded-circle dark d-flex justify-content-center align-items-center bg-dark p-3 align-self-center" style="height: 100px; width: 100px;">
                        <i class="bi bi-person-fill icon-login" style="font-size: 40px;"></i>
                    </div>
                    <div>
                        <label for="user" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="user" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Contraseña</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password">
                            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Ingresar</button>
                    <small><a class="d-block text-center" href="#">¿Has olvidado tu contraseña?</a></small>
                </form>
            </div>
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous">
    </script>
    <script src="./js/passwordToggle.js"></script>
        
</body>

</html>