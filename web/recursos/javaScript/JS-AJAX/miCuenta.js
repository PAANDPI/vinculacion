var usuario = localStorage.getItem('usuario');
var MiInformacion = JSON.parse(usuario);
var html = ``;
var datos = {"opcion": "1"};
$.ajax({
    method: "GET",
    url: 'CiudadSrv',
    data: datos,
    success: function (data) {
        var html = ``;
        for (var i = 0; i < data.Ciudad.length; i++)
        {
            var idCanton = data.Ciudad[i].idciudad;
            var nombreCanton = data.Ciudad[i].ciudad;
            html += `<option value="${idCanton}">${nombreCanton}</option>`;
        }
        document.getElementById("cmbMi_Cantones").innerHTML = html;
    },
    error: function (error) {
        console.log(error);
    }
});



var idUsuario = MiInformacion[0].idpersona;
document.getElementById("txtMi_Nombre").value = MiInformacion[0].nombre
document.getElementById("txtMi_Apellido").value = MiInformacion[0].apellido;
document.getElementById("cmbMi_Cantones").value = MiInformacion[0].idciudad;
document.getElementById("cmbMi_Genero").value = MiInformacion[0].genero;
document.getElementById("txtMi_Correo").value = MiInformacion[0].correo;
document.getElementById("mitxtNombreUsuario").value = MiInformacion[0].usuario;

$('#contCambiodeClave').hide('100');

$('#btnEditarContrasenia').click(function () {

    $('#contCambiodeClave').toggle('100');

});
$('#btnMiInformacion').click(function () {
    var validador = false;
    var usuario = MiInformacion[0].correo;
    var clave = document.getElementById("txtMi_Contrasenia_antigua").value;
    var datos = {"usuario": usuario, "clave": clave, "accion": "1"};
    if (clave.length > 0)
    {
        $.ajax({
            method: "POST",
            url: "PersonaSrv",
            data: datos,
            success: function (data) {
                if (document.getElementById("txtMi_Contrasenia").value.length >= 6 && document.getElementById("txtMi_ConfirmarContrasenia").value.length >= 6)
                {
                    if (document.getElementById("txtMi_Contrasenia").value === document.getElementById("txtMi_ConfirmarContrasenia").value)
                    {
                        validador = true;
                        modificarclave(validador);

                    } else
                    {
                        Swal.fire("Confirmación erronea", "La nueva contraseña no pudo ser confirmada", "info");
                        validador = false;
                    }
                } else
                {
                    Swal.fire("La nueva contraseña debe tener una logintud mayor 6 caracteres", "info");
                    validador = false;
                }




            },
            error: function (error) {

                mensaje = error;
                Swal.fire("La contraseña antigua no es correcta", mensaje.responseJSON.mensaje, "error");

            }
        });
    } else
    {
        Swal.fire("Ingrese la antigua contraseña", "info");
    }


});
function modificarclave(validation)
{

    if (validation)
    {
        var datos = {
            "idpersona": idUsuario,
            "clave": document.getElementById("txtMi_Contrasenia").value,
            "accion": "6"
        };

        $.ajax({
            method: "POST",
            url: "PersonaSrv",
            data: datos,
            success: function (data) {

                Swal.fire({
                    title: 'La contraseña fue modificada correctamente, será redirigido al login.',
                    confirmButtonText: 'Eniento',
                }).then((result) => {
                    if (result.isConfirmed) {
                       window.location.href = "login.jsp";
                    } 
                });


            },
            error: function (error, ex) {
                console.log(error);
                console.log(ex);
                alerta("Algo salio mal:" + error, "error");
            }
        });
    } else
    {
    }





}
