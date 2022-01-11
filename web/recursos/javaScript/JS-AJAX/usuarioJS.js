
$(document).ready(function () {
   
    $('#btnGuardarUsuario').on('click', function () {
        var txtNombre=document.getElementById("txtNombre").value;
        var txtApellido=document.getElementById("txtApellido").value;
        var cmbGenero=document.getElementById("cmbGenero").value;
        var txtCorreo=document.getElementById("txtCorreo").value;
        var txtNombreUsuario=document.getElementById("txtNombreUsuario").value;
        var txtContrasenia=document.getElementById("txtContrasenia").value;
        var txtConfirmarContrasenia=document.getElementById("txtConfirmarContrasenia").value;
        
        var validor=(txtNombre.length*txtApellido.length* cmbGenero.length*
        txtCorreo.length* txtNombreUsuario.length)
            if(validor>0)
            {
                 $.ajax({
                    method: "POST",
                    url: "",
                    data: {},                       
                    success: function (data) {
                    alerta("Concepto guardado correctamente:", "success");
                    },
                    error: function (error) {
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
