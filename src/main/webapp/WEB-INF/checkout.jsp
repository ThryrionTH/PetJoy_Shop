<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="js/script.js"></script>
</head>

<body>
    <div class="container mt-5">
        <h1 class="mb-4">Estas a punto de hacer feliz a tu mascota, ${client.nombre} ${client.apellido}
        </h1>
        <a href="/logout">Log out</a>
        <h2 class="mb-4">Tu factura</h2>
        <a href="/">Home</a>
        <!-- <table class="table table-striped">
            <thead>
                <tr>
                    <th>Number of Table</th>
                    <th>Guest Name</th>
                    <th># Guest</th>
                    <th>Arrived at</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${tables}" var="table">
                    <tr>
                        <td>
                            <a href="/tables/${table.id}">
                                <c:out value="${table.id}" />
                            </a>
                        </td>
                        <td>
                            <c:out value="${table.guest_name}" />
                        </td>
                        <td>
                            <c:out value="${table.guests}" />
                        </td>
                        <td>
                            <c:out value="${table.createdAt}" />
                        </td>
                        <td>
                            <form action="/tables/${table.id}/delete" method="post" class="d-inline">
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="button" class="btn btn-danger"
                                    onclick="showConfirmation(this)">Finished</button>
                            </form>
                            <a href="/tables/${table.id}/edit" class="btn btn-primary">Edit</a>
                            <a href="/tables/${table.id}/giveup" class="btn btn-primary">Give Up Table</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/tables">See All Tables</a>
        <a href="/tables/open">See Open Tables</a>
        <a href="/tables/new" class="btn btn-primary">+ New Table</a>
    </div> -->
</body>

</html>