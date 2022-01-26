
$(document).ready(function () {
    listadeUsuarios();
   function listadeUsuarios()
{
     $.ajax({
                    method: "GET",
                    url: "PersonaSrv",                       
                    success: function (data) {
                    console.log(data);
                   
                    },
                    error: function (error) {                    
                    console.log(error);                                       
                    }
                });
}
    $('#btnGuardarUsuario').on('click', function () {
        var txtNombre=document.getElementById("txtNombre").value;
        var txtApellido=document.getElementById("txtApellido").value;
        var cmbGenero=document.getElementById("cmbGenero").value;
        var txtCorreo=document.getElementById("txtCorreo").value;
        var txtNombreUsuario=document.getElementById("txtNombreUsuario").value;
        var txtContrasenia=document.getElementById("txtContrasenia").value;
        var txtConfirmarContrasenia=document.getElementById("txtConfirmarContrasenia").value;
         var cmbCantones = document.getElementById("cmbCantones").value;
        var administradorCheck= document.getElementById("administradorCheck");
        var datos={"idCiudad":cmbCantones,
                    "nombre":txtNombre,
                    "apellido":txtApellido,
                    "genero":cmbGenero,
                    "usuario":txtNombreUsuario, 
                    "correo":txtCorreo, 
                    "clave":txtContrasenia,
                    "administrador":administradorCheck.checked, 
                    "accion": "2" };
                
        console.log(datos);
        var validor=(txtNombre.length*txtApellido.length* cmbGenero.length*
        txtCorreo.length* txtNombreUsuario.length * cmbCantones.length)
            if(validor>0)
            {
                 $.ajax({
                    method: "POST",
                    url: "PersonaSrv",
                    data:datos ,                       
                    success: function (data) {
                    alerta("Usuario guardado correctamente:", "success");
                    },
                    error: function (error) {
                    
                    console.log(error);
                    alerta("Algo salio mal:"+error, "error");
                    
                    }
                });
                
            }else
            {
                 alerta("Complete todo los campos", "error");
            }
        
    });
    
});

function alerta(texto, icono)
{
    swal({text: texto, icon: icono});
}
