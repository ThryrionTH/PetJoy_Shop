function confirmDelete(button) {
    const form = button.closest('.delete-form');

    Swal.fire({
        title: 'Confirmar eliminación',
        text: '¿Estás seguro de querer eliminar este registro?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DC3545',
        confirmButtonText: 'Si, eliminar',
        cancelButtonText: 'Cancelar',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            form.submit();
        }
    });
}

function Success(msg) {
    Swal.fire(
<<<<<<< HEAD
        "",
        msg,
        'success'
    );
}

function Info(msg) {
    Swal.fire(
        "",
        msg,
        'info'
    );
=======
            "",
            msg,
            'success'
            );
}

function Info(msg) {
  Swal.fire(
            "",
            msg,
            'info'
            );
>>>>>>> dc8a9435121ea3520508544c1b8287abb38b864d
}