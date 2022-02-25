var jsonPersonas;
var idPersona;
var anterior="";

 listadeUsuarios();
 function listadeUsuarios(){
        $.ajax({
            method: "GET",
            url: "PersonaSrv",
            success: function (data) {
                jsonPersonas = data;
                var htmlTabla = ``;
                 document.getElementById("caounPersonas").innerHTML= jsonPersonas.Persona.length;
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
                    var url = ` recursos/iconos/admin.png`;
                    if (administrador)
                    {
                        url = `recursos/iconos/normal.png`;
                    }


                    htmlTabla += `<tr>
                                    <th>
                                        <div id="cardPersona${idpersona}" class="card" style="border: 1px solid #c4c4c4;  " role="alert">
                                                <div class="card-header ">
                                                <div class="row">
                                                   <h5 class="card-title col-lg-11 bi bi-person-circle "> ${nombre} ${apellido}</h5>
                                                    <div class="col-lg-1"> <img class="float-right " src="${url}" width="35"></div>
                                                </div>
                                                   
                                                 </div>
                                                <div class="card-body">
                                                        <div class="row">
                                                                    <div class="col-lg-6">
                                                                         <h6 class="font-weight-bold">Username: ${usuario}</h6>
                                                                         <h6 class="font-weight-bold" >Administrador: ${administrador}</h6>
                                                                         <h6 class="font-weight-bold">Genero: ${genero}</h6> 
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                          <h6  class="font-weight-bold">Estado: ${estado}</h6>
                                                                          <h6 class="font-weight-bold">Correo: ${correo}</h6>
                                                                    </div>                                                             
                                                        </div>
                                                        <hr>
                                                        <div class="row p-0">
                                                            <div class="col-lg-12 pl-3">     
                                                                <button onclick="btnEditPersona(${idpersona})"  type="button" class="btn btn-info btn-sm bi bi-pencil-fill"> Seleccionar</button>
                                                                <button onclick="deletePersona(${idpersona})" type="button" class="btn btn-danger btn-sm bi bi-person-dash-fill"> Eliminar</button>
                                                            </div>        
                                                        </div>
                                                 </div>                                                                                               
                                             
                                            </div>
                                     </th>
                                   `;
                }
                var tbl_personas = document.getElementById("tbl_personas");
                tbl_personas.innerHTML = htmlTabla;
                $('#btn_cancelar').hide();
                $('#btn_modificarUsuario').hide();
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
$(document).ready(function () {   
    $("#buscadorPersonas").keyup(function () {
        _this = this;
        // Show only matching TR, hide rest of them
        $.each($("#tblPersonas tbody tr"), function () {
            if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    });   
    $('#btnCerrarSession').on('click', function () {

        var datos = {"accion": "5"};
        $.ajax({
            method: "POST",
            url: "PersonaSrv",
            data: datos,
            success: function (data) {
                console.log(data);
                window.location.href = "index.jsp";
//               swal({text: mensaje.responseJSON.mensaje, icon: "success"});


            },
            error: function (error) {
                console.log(error);

            }
        });

    });

    $('#btn_cancelar').click(function (e) {
        $('#btnGuardarUsuario').show("2000");
        $('#btn_cancelar').hide("slow");
        $('#btn_modificarUsuario').hide("slow");
        $('#contenedorClaves').show("2000");
        limpiar();
    });
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



        var validor = (txtNombre.length * txtApellido.length * cmbGenero.length *
                txtCorreo.length * txtNombreUsuario.length * cmbCantones.length * txtConfirmarContrasenia.length
                * txtContrasenia.length)
        if (validor > 0)
        {
            if (txtContrasenia === txtConfirmarContrasenia)
            {
                if (validarExistenciaUsuario())
                {
                    if (validarExistenciaEmail())
                    {
                        $.ajax({
                            method: "POST",
                            url: "PersonaSrv",
                            data: datos,
                            success: function (data) {
                                alerta("Usuario guardado correctamente:", "success");
                                listadeUsuarios();
                                limpiar();
                            },
                            error: function (error) {

                                console.log(error);
                                alerta("Algo salio mal:" + error, "error");
                            }
                        });

                    } else
                    {
                        alerta("Ya existe este correo", "info");
                    }
                } else
                {
                    alerta("Ya existe un usuario con este nombre", "info");
                }

            } else
            {
                alerta("La confirmación de contraseña es errónea, por favor ingrese contraseñas iguales", "info");
            }



        } else
        {
            alerta("Complete todo los campos", "info");
        }

    });
    function alerta(texto, icono){
        Swal.fire({text: texto, icon: icono});
    }
    function limpiar(){
        $('#txtNombre').val('');
        $('#txtApellido').val('');
        $('#cmbGenero').val('');
        $('#txtNombreUsuario').val('');
        $('#cmbCantones').prop('selectedIndex', 0);
        $('#txtCorreo').val('');
        $('#txtContrasenia').val('');
        $('#txtConfirmarContrasenia').val('');
        $('#administradorCheck').attr('checked', false);
    }
    $('#btn_modificarUsuario').on('click', function () {

        var txtNombre = document.getElementById("txtNombre").value;
        var txtApellido = document.getElementById("txtApellido").value;
        var cmbGenero = document.getElementById("cmbGenero").value;
        var txtCorreo = document.getElementById("txtCorreo").value;
        var txtNombreUsuario = document.getElementById("txtNombreUsuario").value;
        var txtContrasenia = document.getElementById("txtContrasenia").value;
        var txtConfirmarContrasenia = document.getElementById("txtConfirmarContrasenia").value;
        var cmbCantones = document.getElementById("cmbCantones").value;
        var administradorCheck = document.getElementById("administradorCheck");
        var datos = {
            "idpersona": idPersona,
            "idCiudad": cmbCantones,
            "nombre": txtNombre,
            "apellido": txtApellido,
            "genero": cmbGenero,
            "usuario": txtNombreUsuario,
            "correo": txtCorreo,
            "clave": txtContrasenia,
            "administrador": administradorCheck.checked,
            "accion": "3"};
        console.log(datos);
        var validor = (txtNombre.length * txtApellido.length * cmbGenero.length *
                txtCorreo.length * txtNombreUsuario.length * cmbCantones.length)
        if (validor > 0)
        {
//            if (validarExistenciaUsuario())
//            {
//                if (validarExistenciaEmail())
//                {

                    $.ajax({
                        method: "POST",
                        url: "PersonaSrv",
                        data: datos,
                        success: function (data) {
                            alerta("Usuario Modificado correctamente:", "success");
                            listadeUsuarios();
                            limpiar();
                        },
                        error: function (error, ex) {
                            console.log(error);
                            console.log(ex);
                            alerta("Algo salio mal:" + error, "error");
                        }
                    });
//                } else
//                {
//                    alerta("Ya existe este correo", "info");
//                }
//            } else
//            {
//                alerta("Ya existe un usuario con este nombre", "info");
//            }


        } else
        {
            alerta("Complete todo los campos", "error");
        }

    });
});

function  validarExistenciaUsuario(){

    for (var i = 0; i < jsonPersonas.Persona.length; i++)
    {
        var usuario = jsonPersonas.Persona[i].usuario;
        var txtNombreUsuario = document.getElementById("txtNombreUsuario").value;
        if (usuario == txtNombreUsuario)
        {
            return false;
            break;
        }
    }
    return true;
}
function  validarExistenciaEmail(){
    for (var i = 0; i < jsonPersonas.Persona.length; i++)
    {
        var correo = jsonPersonas.Persona[i].correo;
        var txtCorreo = document.getElementById("txtCorreo").value;
        if (correo == txtCorreo)
        {
            return false;
            break;
        }
    }
    return true;
}
function btnEditPersona(aux) {
    
       if (anterior.length > 0) {
        var btnAux = document.getElementById("cardPersona" + anterior);
        btnAux.className = "card"
    }
        document.getElementById("cardPersona" + aux).className = "card text-white cajas bg-primary"
    
    idPersona = aux;
    console.log(jsonPersonas.Persona);
    for (var x of jsonPersonas.Persona) {
        if (x.idpersona == aux) {
            $('#txtNombre').val(x.nombre);
            $('#txtApellido').val(x.apellido);
            $('#cmbGenero').val(x.genero);
            $('#txtNombreUsuario').val(x.usuario);
            $('#cmbCantones').prop('selectedIndex', x.idciudad);
            $('#txtCorreo').val(x.correo);
            $('#contenedorClaves').hide("slow");
            $('#administradorCheck').attr('checked', x.estado);
            $('#btnGuardarUsuario').hide("slow");
            $('#btn_modificarUsuario').show("2000");
            $('#btn_cancelar').show("2000");
        }
    }
    anterior=aux+"";
    
}
function deletePersona(id) {
 
    var dato = {"idpersona": id, "accion": "4"};
      Swal.fire({
        title: '¿Desea Eliminar esta Persona?',
        icon: 'warning',
        showDenyButton: true,
        confirmButtonText: 'No',
        denyButtonText: `Si`,
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({text: "Eliminación cancelada", icon: "info"});
        } else if (result.isDenied) {
            $.ajax({
                method: "POST",
                url: 'PersonaSrv',
                data: dato,
                success: function (data)
                {
                    console.log(data);
                    Swal.fire("La persona a sido eliminada correctamente", {icon: "success"});
                    listadeUsuarios();
                },
                error: function (error) {
                    console.log(error);
                }
            });
           
        }
    });
  
    
    
}

