var mensaje;
$(document).ready(function () {
 
$('#btnIniciarSecion').on('click', function () {
        var usuario = document.getElementById("txtNombre_usuario").value;
        var clave = document.getElementById("txtClave").value;
        var datos = {"usuario": usuario, "clave": clave, "accion": "1"};
        $.ajax({
            method: "POST",
            url: "PersonaSrv",
            data: datos,
            success: function (data) {
               console.log(data);
               mensaje=data;
//                 swal({text: mensaje.responseJSON.mensaje, icon: "success"});
               window.location.href = "administrador.jsp";
             
                

            },
            error: function (error) {

             mensaje=error;
             
             swal({text: mensaje.responseJSON.mensaje, icon: "error"});
             
            }
        });

    }); 
});