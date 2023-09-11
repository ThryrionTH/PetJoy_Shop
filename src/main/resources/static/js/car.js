// Variables 
const carrito = document.querySelector('#carrito');
const contenedorCarrito = document.querySelector('#lista-carrito tbody');
const vaciarCarritoBtn = document.querySelector('#vaciar-carrito');
const listaCursos = document.querySelector('#lista-cursos');
let articulosCarrito = [];

cargarEventListeners();
function cargarEventListeners() {
    //"Btn Agregar al carrito"
    listaCursos.addEventListener('click', agregarProducto);

    //Eliminar del carrito
    carrito.addEventListener('click', eliminarProducto);

    //Vaciar el carrito
    vaciarCarritoBtn.addEventListener('click', () => {
        articulosCarrito = []; // Limpiamos arreglo
        carritoHTML();

    });

    // Obtener Sesion
    if (localStorage.getItem("carrito") !== null) {
        articulosCarrito = JSON.parse(localStorage.getItem("carrito"));
    }
    carritoHTML();
}

//Funciones
function agregarProducto(e) {
    e.preventDefault();
    if (e.target.classList.contains('agregar-carrito')) {
        const productoSeleccionado = e.target.parentElement.parentElement;
        leerDatosProducto(productoSeleccionado);
    }
}

// Eliminar producto del carrito
function eliminarProducto(e) {
    //console.log(e.target);
    if (e.target.classList.contains("borrar-producto")) {
        const productoId = e.target.getAttribute('data-id');

        //Eliminar del arreglo de articulosCarrito por el data-id
        articulosCarrito = articulosCarrito.filter(producto => producto.id !== productoId);
        localStorage.setItem("carrito", JSON.stringify(articulosCarrito));
        carritoHTML(); // Iterar sobre el carrito 
    }
}

function leerDatosProducto(producto) {
    console.log(producto);
    const infoProducto = {
        imagen: producto.querySelector('img').src,
        titulo: producto.querySelector('h5').textContent,
        //    precio: producto.querySelector('.precio span').textContent,
        precio: fnRemoverCaracter(producto.querySelector('.precio span').textContent, "$"),
        id: producto.querySelector('#cart-button').getAttribute('data-id'),
        cantidad: 1
    };

    //Revisar si un elemento ya existe en el carrito
    const existe = articulosCarrito.some(producto => producto.id === infoProducto.id);
    if (existe) {
        // Actualiza cantidad
        const productos = articulosCarrito.map(producto => {
            if (producto.id === infoProducto.id) {
                producto.cantidad++;
                return producto; //retorna el obejeto actualizado
            } else {
                return producto; //retorna los objetos no duplicados
            }
        });
        articulosCarrito = [...productos];

    } else {
        // Agregamos el item al carrito
        articulosCarrito = [...articulosCarrito, infoProducto];
        //console.log(articulosCarrito);

    }

    localStorage.setItem("carrito", JSON.stringify(articulosCarrito));

    carritoHTML();
}

// Muestra el carrito de compras en el HTML
function carritoHTML() {
    // Limpiar el HTML
    limpiarHTML();
    // Recorre el carrito y genera el HTML
    articulosCarrito.forEach(producto => {
        const {imagen, titulo, precio, cantidad, id} = producto;
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>
                <img src="${imagen}" width="100">
            </td>
            <td>${titulo}</td>
            <td>$${precio}</td>
            <td>${cantidad}</td>
            <td>
                <a href="#" class="borrar-producto" data-id="${id}"> X </a>
            </td>
        `;

        // Agrega el HTML del carrito en l tbody
        contenedorCarrito.appendChild(row);

        console.log(articulosCarrito);

    });

    if (articulosCarrito.length === 0) {
        document.getElementById("listCarrito").innerHTML = `
            <tr>
                <td colspan="4" class="text-center">Carrito Vacio</td>
            </tr>
        `;
        document.getElementById("vaciar-carrito").style.display = 'none';
        document.getElementById("pagar-carrito").style.display = 'none';
    } else {
        document.getElementById("vaciar-carrito").style.display = 'block';
        document.getElementById("pagar-carrito").style.display = 'block';
    }
}


// Elimina los productos del tbody
function limpiarHTML() {

    //contenedorCarrito.innerHTML = '';

    while (contenedorCarrito.firstChild) {
        contenedorCarrito.removeChild(contenedorCarrito.firstChild);
    }
}

function fnRemoverCaracter(valor, caracter) {
    if (valor.indexOf(caracter) !== -1) {
        return valor.replace(caracter, "");
    }
    return valor;
}