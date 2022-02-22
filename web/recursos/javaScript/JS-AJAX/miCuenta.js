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

        var usuario = MiInformacion[0].correo;
        var clave = document.getElementById("txtMi_Contrasenia_antigua").value;
        var datos = {"usuario": usuario, "clave": clave, "accion": "1"};
        
        $.ajax({
            method: "POST",
            url: "PersonaSrv",
            data: datos,
            success: function (data) {
//               console.log(data);
//               mensaje=data;
//               localStorage.setItem("usuario",JSON.stringify(mensaje.Persona)+"");
//               window.location.href = "administrador.jsp";
             
                

            },
            error: function (error) {

             mensaje=error;
             swal({text: mensaje.responseJSON.mensaje, icon: "error"});
             
            }
        });

        }); 
    
//    if (document.getElementById("txtMi_Contrasenia").value === document.getElementById("txtMi_ConfirmarContrasenia").value)
//    {
//
//    } else
//    {
//        swal({text: "Ingrese", icon: icono});
//    }
//
//    var datos = {
//        "idpersona": idUsuario,
//        "idCiudad": document.getElementById("cmbMi_Cantones").value,
//        "nombre": document.getElementById("txtMi_Nombre").value,
//        "apellido": document.getElementById("txtMi_Apellido").value,
//        "genero": document.getElementById("cmbMi_Genero").value,
//        "usuario": document.getElementById("mitxtNombreUsuario").value,
//        "correo": document.getElementById("txtMi_Correo").value,
//        "clave": txtContrasenia,
//        "administrador": true,
//        "accion": "3"};
//
//
//    console.log(datos);
//    var validor = (txtNombre.length * txtApellido.length * cmbGenero.length *
//            txtCorreo.length * txtNombreUsuario.length * cmbCantones.length)
//    if (validor > 0)
//    {
//        $.ajax({
//            method: "POST",
//            url: "PersonaSrv",
//            data: datos,
//            success: function (data) {
//                alerta("Usuario Modificado correctamente:", "success");
//                listadeUsuarios();
//                limpiar();
//            },
//            error: function (error, ex) {
//                console.log(error);
//                console.log(ex);
//                alerta("Algo salio mal:" + error, "error");
//            }
//        });
//    } else
//    {
//        alerta("Complete todo los campos", "error");
//    }
//});