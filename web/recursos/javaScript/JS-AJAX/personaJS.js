var jsonPersonas;
$(document).ready(function () {
    listadeUsuarios();
   function listadeUsuarios()
{
     $.ajax({
                    method: "GET",
                    url: "PersonaSrv",                       
                    success: function (data) {
                    jsonPersonas= data;
                    var htmlTabla = ``;
                     for (var i = 0; i < jsonPersonas.Persona.length; i++)
                    {
                           var idpersona=jsonPersonas.Persona[i].idpersona;
                           var idciudad=jsonPersonas.Persona[i].idciudad;
                           var nombre=jsonPersonas.Persona[i].nombre;
                           var apellido=jsonPersonas.Persona[i].apellido;
                           var genero=jsonPersonas.Persona[i].genero;
                           var usuario=jsonPersonas.Persona[i].usuario;
                           var correo=jsonPersonas.Persona[i].correo;
                           var clave=jsonPersonas.Persona[i].clave;
                           var administrador=jsonPersonas.Persona[i].administrador;
                           var estado=jsonPersonas.Persona[i].estado;
                           var ciudad=jsonPersonas.Persona[i].ciudad;
                           
                                htmlTabla += `<tr>
                                    <th><div class=""></div></th>
                                    <td>${nombre}</td>
                                    <td></td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic example">                                            
                                            <button onclick=modificarDiscapacidad("") type="button" class="btn btn-warning btn-sm bi bi-pencil-fill"></button> 
                                            <button onclick=eliminarDiscapacidad("") type="button" class="btn btn-danger btn-sm bi bi-x-square"></button>   
                                            </div>
                                        </td>                                 
                                  </tr>`;
                    }
                     var tbl_personas = document.getElementById("tbl_personas");
                         tbl_personas.innerHTML = htmlTabla;
                                        
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
