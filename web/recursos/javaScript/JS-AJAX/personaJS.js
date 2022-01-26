var jsonPersonas;
$(document).ready(function () {
    listadeUsuarios();
    function listadeUsuarios()
    {
        $.ajax({
            method: "GET",
            url: "Persona_Srv",
            success: function (data) {
                jsonPersonas = data;
                var htmlTabla = ``;
                for (var i = 0; i < jsonPersonas.Persona.length; i++)
                {
                    var idpersona = jsonPersonas.Persona[i].idpersona;
                    var idciudad = jsonPersonas.Persona[i].idciudad;
                    var nombre = jsonPersonas.Persona[i].nombre;
                    var apellido = jsonPersonas.Persona[i].apellido;
                    var genero = jsonPersonas.Persona[i].genero;
                    var usuario = jsonPersonas.Persona[i].usuario;
                    var correo = jsonPersonas.Persona[i].correo;
                    var clave = jsonPersonas.Persona[i].clave;
                    var administrador = jsonPersonas.Persona[i].administrador;
                    var estado = jsonPersonas.Persona[i].estado;
                    var ciudad = jsonPersonas.Persona[i].ciudad;



                    htmlTabla += `<tr>
                                    <th>
                                        <div class="alert alert-light" style="border: 1px solid #c4c4c4;" role="alert">
                                                <h4 class="alert-heading bi bi-bookmark-fill"> ${nombre} ${apellido}</h4>
 
                                                 <div class="row">
                                                   <div class="col-lg-4">
                                                     <label>Username: </label> <p  style="font-weight: normal">  ${usuario}</p>
                                                   </div>
                                                   <div class="col-lg-4">
                                                      <label >Administrador:</label><p  style="font-weight: normal">  ${administrador}</p>
                                                   </div>
                                                <div class="col-lg-4">
                                                   <label>Genero: </label> <p  style="font-weight: normal"> ${genero}</p>
                                                 </div> 
                                                  </div>
                                                  <div class="row mt-2">                                                        
                                                 <div class="col-lg-4">
                                                   <label >Estado:</label><p  style="font-weight: normal">  ${estado}</p>
                                                 </div> 
                                                   <div class="col-lg-4">
                                                   <label  >Correo:</label><p  style="font-weight: normal"> ${correo}</p>
                                                 </div>
                                               </div>
                                               <hr>
                                               <div class="row p-0">
                                                  <div class="col-lg-12 pl-3">     
                                                      <button onClink="seleccionar(${idpersona})" type="button" class="btn btn-info btn-sm bi bi-pencil-fill"> Seleccionar</button>
                                                      <button onClink="eliminarPersona(${idpersona})" type="button" class="btn btn-danger btn-sm bi bi-person-dash-fill"> Eliminar</button>
                                                  </div>        
                                               </div>
                                            </div>
                                     </th>
                                   `;
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
        var txtNombre = document.getElementById("txtNombre").value;
        var txtApellido = document.getElementById("txtApellido").value;
        var cmbGenero = document.getElementById("cmbGenero").value;
        var txtCorreo = document.getElementById("txtCorreo").value;
        var txtNombreUsuario = document.getElementById("txtNombreUsuario").value;
        var txtContrasenia = document.getElementById("txtContrasenia").value;
        var txtConfirmarContrasenia = document.getElementById("txtConfirmarContrasenia").value;
        var cmbCantones = document.getElementById("cmbCantones").value;
        var administradorCheck = document.getElementById("administradorCheck");
        var datos = {"idCiudad": cmbCantones,
            "nombre": txtNombre,
            "apellido": txtApellido,
            "genero": cmbGenero,
            "usuario": txtNombreUsuario,
            "correo": txtCorreo,
            "clave": txtContrasenia,
            "administrador": administradorCheck.checked,
            "accion": "2"};

        console.log(datos);
        var validor = (txtNombre.length * txtApellido.length * cmbGenero.length *
                txtCorreo.length * txtNombreUsuario.length * cmbCantones.length)
        if (validor > 0)
        {
            $.ajax({
                method: "POST",
                url: "Persona_Srv",
                data: datos,
                success: function (data) {
                    alerta("Usuario guardado correctamente:", "success");
                },
                error: function (error) {

                    console.log(error);
                    alerta("Algo salio mal:" + error, "error");

                }
            });

        } else
        {
            alerta("Complete todo los campos", "error");
        }

    });

});

function alerta(texto, icono)
{
    swal({text: texto, icon: icono});
}
